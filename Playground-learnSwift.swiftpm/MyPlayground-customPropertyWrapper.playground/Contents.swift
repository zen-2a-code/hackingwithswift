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




var greeting = "Hello, playground"
