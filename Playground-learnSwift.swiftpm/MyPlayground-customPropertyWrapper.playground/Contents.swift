@propertyWrapper
struct NonNegative<Value: BinaryInteger> {
    private var value: Value
    
    init(wrappedValue: Value) {
        if wrappedValue < 0 {
              value = 0
          } else {
              value = wrappedValue
          }
    }
    
    var wrappedValue: Value {
        get { value }
        set {
            if newValue < 0 {
                value = 0
            } else {
                value = newValue
            }
        }
    }
}

struct User {
    var name: String
    @NonNegative var score: Int
}

var stoyan = User(name: "Stoyan", score: -200)
print(stoyan.score)
stoyan.score = 42
print(stoyan.score)
stoyan.score = -3_000_000
print(stoyan.score)


var greeting = "Hello, playground"
