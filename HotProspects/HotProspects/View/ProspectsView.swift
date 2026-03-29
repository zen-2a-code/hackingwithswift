//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Stoyan Hristov on 25.03.26.
//

import AVFoundation
import CodeScanner
import SwiftData
import SwiftUI
@preconcurrency import UserNotifications

struct ProspectsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Prospect.name) private var prospects: [Prospect]
    @State private var isShowingScanner = false
    @State private var selectedProspectIDs = Set<PersistentIdentifier>()
    @Binding var sortedBy: SortBy
    
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    private var title: String {
        switch filter {
        case .none:
            "Everyone"
        case .contacted:
            "Contacted people"
        case .uncontacted:
            "Uncontacted people"
        }
    }
    
    let filter: FilterType
    var body: some View {
        NavigationStack {
            List(prospects, selection: $selectedProspectIDs) { prospect in
                NavigationLink(value: prospect) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(prospect.name)
                                .font(.headline)
                            Text(prospect.emailAddress)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        
                        Image(systemName: prospect.isContacted ? "person.crop.circle.fill.badge.checkmark" : "person.crop.circle.badge.xmark")
                            .font(.title)
                            .foregroundStyle(prospect.isContacted ? .green.opacity(0.5) : .red.opacity(0.5))
                    }
                }
                .tag(prospect)
                .swipeActions {
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        modelContext.delete(prospect)
                    }
                    if prospect.isContacted {
                        Button("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark") {
                            prospect.isContacted.toggle()
                        }
                        .tint(.blue)
                    } else {
                        Button("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark") {
                            prospect.isContacted.toggle()
                        }
                        .tint(.green)
                            
                        Button("Add reminder", systemImage: "bell") {
                            scheduleNotifications(for: prospect)
                        }
                        .tint(.orange)
                    }
                }
            }
            .navigationTitle(title)
            .navigationDestination(for: Prospect.self) { prospect in
                EditProspectDetailsView(prospect: prospect)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu("Sort") {
                        Button {
                            sortedBy = .name
                        } label: {
                            if sortedBy != .name {
                                Text("Name")
                            } else {
                                Label("Name", systemImage: "checkmark")
                            }
                        }
                        
                        Button {
                            sortedBy = .recent
                        } label: {
                            if sortedBy != .recent {
                                Text("Recent")
                            } else {
                                Label("Recent", systemImage: "checkmark")
                            }
                        }
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Scan", systemImage: "qrcode.viewfinder") {
                        isShowingScanner = true
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
            }
            .safeAreaInset(edge: .bottom) {
                    if !selectedProspectIDs.isEmpty {
                        Button(role: .destructive, action: deleteSelectedProspects) {
                            Text("Delete Selected")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(.red)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                                .padding(.horizontal)
                        }
                        .background(.ultraThinMaterial)
                        .padding(.vertical)
                    }
                }
            .sheet(isPresented: $isShowingScanner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: "Stoyan Hristov\nstoyanexample@co.nl", completion: handleScan(result:))
            }
        }
    }
    
    init(filter: FilterType, sortedBy: Binding<SortBy>) {
        self.filter = filter
        self._sortedBy = sortedBy
        
        let sortOrder: SortDescriptor = self.sortedBy == SortBy.name ?
            SortDescriptor(\Prospect.name)
            : SortDescriptor(\Prospect.createdDate, order: .reverse)

        if self.filter != .none {
            let isFilterContactedOnly = filter == .contacted
            
            _prospects = Query(filter: #Predicate { currentProspect in
                currentProspect.isContacted == isFilterContactedOnly
            }, sort: [sortOrder])
        } else {
            _prospects = Query(sort: [sortOrder])
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            
            let newProspect = Prospect(name: details[0], emailAddress: details[1], isContacted: false)
            modelContext.insert(newProspect)
            
        case .failure(let scanError):
            print("Scanning failed: \(scanError.localizedDescription)")
        }
    }
    
    func deleteSelectedProspects() {
        for id in selectedProspectIDs {
            if let prospect = modelContext.model(for: id) as? Prospect {
                modelContext.delete(prospect)
            }
        }
    }
    
    func scheduleNotifications(for prospect: Prospect) {
        let notificationCenter = UNUserNotificationCenter.current()
        
        let name = prospect.name
        let email = prospect.emailAddress
        
        let addRequest: @Sendable () -> Void = { [name, email] in
            let content = UNMutableNotificationContent()
            content.title = "Contact \(name)"
            content.subtitle = email
            content.sound = UNNotificationSound.default
            
//            var dateComponents = DateComponents()
//            dateComponents.hour = 9
//            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            notificationCenter.add(request)
        }
        
        notificationCenter.getNotificationSettings { notificatoinSettings in
            if notificatoinSettings.authorizationStatus == .authorized {
                addRequest()
            } else {
                notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

#Preview {
    ProspectsView(filter: .none, sortedBy: .constant(.name))
        .modelContainer(for: Prospect.self, inMemory: true)
}
