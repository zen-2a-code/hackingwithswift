//
//  ContentView.swift
//  Navigation
//
//  Created by Stoyan Hristov on 26.01.26.
//

import SwiftUI

struct Task: Hashable {
    let id: UUID
    let title: String
    let body: String
}

struct CurrentTaskView: View {
    let task: Task
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "newspaper")
                    .font(.title)
                Text(task.title)
            }
            
            HStack {
                Image(systemName: "text.rectangle")
                    .font(.title)
                Text(task.body)
            }
        }
    }
}

struct ContentView: View {
    @State private var imporantArray = [Task]()
    @State private var currentTaskTitle: String = ""
    @State private var currentTaskBody: String = ""
    
    var body: some View {
        NavigationStack(path: $imporantArray){
            
            Form {
                TextField("Enter task title", text: $currentTaskTitle)
                TextField("Enter task:", text: $currentTaskBody)
                Button("Submit", role: .confirm) {
                    let newTask = Task(id: UUID(), title: currentTaskTitle, body: currentTaskBody)
                    imporantArray.append(newTask)
                }
            }
            .navigationDestination(for: Task.self) { task in
                CurrentTaskView(task: task)
            }
        }
    }
}

#Preview {
    ContentView()
}
