import Cocoa

extension String {
    mutating func trim() {
        self = trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

var text = "   How are you doing? - Joey         "
text.trim()
print(text)

extension Collection {}
