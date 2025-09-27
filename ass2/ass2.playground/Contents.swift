// Problem 1: FizzBuzz

/*
for i in 1...100 {
    
    if (i % 3 == 0) && (i % 5 == 0) {
        print("FizzBuzz", i)
    }
    else if i % 3 == 0 {
        print("Fizz", i)
    }
    else if i % 5 == 0 {
        print("Buzz", i)
    }
    
    
}
*/

// Problem 2: Prime Numbers

/*
 func isPrime(_ number: Int) -> Bool {
 
 if number <= 1 {
 return false
 }
 
 for i in 2..<number {
 if number % i == 0 {
 return false
 }
 }
 return true
 }
 
 for n in 1...100 {
 if isPrime(n) {
 print(n)
 }
 }
 */

// Problem 3: Temperature Converter

//func celsiusToFahrenheit(_ c: Double) -> Double {
//    return (c * 9/5) + 32
//}
//
//func celsiusToKelvin(_ c: Double) -> Double {
//    return c + 273.15
//}
//
//func fahrenheitToCelsius(_ f: Double) -> Double {
//    return (f - 32) * 5/9
//}
//
//func fahrenheitToKelvin(_ f: Double) -> Double {
//    return (f - 32) * 5/9 + 273.15
//}
//
//func kelvinToCelsius(_ k: Double) -> Double {
//    return k - 273.15
//}
//
//func kelvinToFahrenheit(_ k: Double) -> Double {
//    return (k - 273.15) * 9/5 + 32
//}

/*
func celsius(_ c: Double) {
    print("Fahrenheit", (c * 9/5) + 32)
    print("Kelvin", c + 273.15)
}

func fahrenheit(_ f: Double) {
    print("Celsius", (f - 32) * 5/9)
    print("Kelvin", (f - 32) * 5/9 + 273.15)
}

func kelvin(_ k: Double) {
    print("Celsius", k - 273.15)
    print("Fahrenheit", (k - 273.15) * 9/5 + 32)
}

celsius(20)
fahrenheit(68)
kelvin(293.15)
*/

/*
func temperature(_ value: Double,_ unit: String){
    if unit == "c" {
        print("Fahrenheit", (value * 9/5) + 32)
        print("Kelvin", value + 273.15)
    }
    else if unit == "f" {
        print("Celsius", (value - 32) * 5/9)
        print("Kelvin", (value - 32) * 5/9 + 273.15)
    }
    else if unit == "k" {
        print("Celsius", value - 273.15)
        print("Fahrenheit", (value - 273.15) * 9/5 + 32)
    }
    else {
        print( "Invalid unit!" )
    }
}

temperature(20, "c")
 */

// Problem 4: Shopping List Manager

/*
var shoppingList: [String] = [] //create an empty array

@MainActor func addItem (_ item: String) { //function that add items
    shoppingList.append(item)
    print ("Item was added")
}

@MainActor func removeItem (_ item: String){ //function that delete the items
    if let index = shoppingList.firstIndex(of: item) {
        shoppingList.remove(at: index)
        print("Item was deleted")
    }
    else{
        print("Item not founded")
    }
}

@MainActor func ShowList () { //function that show shopping list with enumerated function
    if shoppingList.isEmpty{
        print("Your list is empty")
    }
    else{
        print("Shopping list: ")
        for (index, item) in shoppingList.enumerated(){
            print("\(index + 1). \(item)")
        }
    }
}

addItem("Bread")
addItem("Milk")
removeItem("Bread")
ShowList()
*/

// Problem 5: Word Frequency Counter

/*
import Foundation

func wordFrequencyCounter(sentence: String) {
    
    let lowercased = sentence.lowercased()
    
   
    let cleaned = lowercased.components(separatedBy: CharacterSet.punctuationCharacters).joined()
    
    
    let words = cleaned.split(separator: " ").map { String($0) }
    
    
    var frequency: [String: Int] = [:]
    
    for word in words {
        frequency[word, default: 0] += 1
    }
    
    
    print(frequency)

}

let mySentence = "ios, Ios, 123 123 45 jj"

wordFrequencyCounter(sentence: mySentence)
*/


// Problem 6: Fibonacci Sequence

/*
func fibonacci(_ n: Int) -> [Int] {
    //  Handle invalid cases
    if n <= 0 {
        return []
    }
    
    // Handle base cases
    if n == 1 {
        return [0]
    }
    if n == 2 {
        return [0, 1]
    }
    
    // Create an array with the first two numbers
    var sequence = [0, 1]
    
    // Loop to calculate the rest
    for i in 2..<n {
        let next = sequence[i - 1] + sequence[i - 2]
        sequence.append(next)
    }
    
    return sequence
}

print(fibonacci(15))
*/

// Problem 7: Grade Calculator

/*
func gradeCalculator(students: [String: Int]) {
    
    let scores = Array(students.values)
    
    
    let total = scores.reduce(0, +)
    let average = Double(total) / Double(scores.count)
    
    
    if let highest = scores.max(), let lowest = scores.min() {
        print(" Average Score: \(average)")
        print("Highest Score: \(highest)")
        print("Lowest Score: \(lowest)")
    }
    
    print("\n--- Student Results ---")
    
    
    for (name, score) in students {
        let status = Double(score) >= average ? "Above or equal to average" : "Below average"
        print("\(name): \(score) \(status)")
    }

}

let studentScores = [
    "Dimash": 100,
    "Erasyl": 99,
    "Erbol": 92,
    "Pasul": 60,
    "Akhmadi": 78,
    "Alex": 87
]

gradeCalculator(students: studentScores)
*/

// Problem 8: Palindrome Checker
 /*
func isPalindrome(_ text: String) -> Bool {
    
    let lowercased = text.lowercased()
    

    var cleaned = ""
    for char in lowercased {
        if (char >= "a" && char <= "z") || (char >= "0" && char <= "9") {
            cleaned.append(char)
        }
    }
    
    
    var reversed = ""
    for char in cleaned {
        reversed = String(char) + reversed
    }
    
    
    return cleaned == reversed
}

let sentence = "12321"
if isPalindrome(sentence) {
    print("'\(sentence)' is a palindrome")
} else {
    print("'\(sentence)' is not a palindrome")
}
  */


// Problem 9: Simple Calculator


func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}

func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}

func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}

func divide(_ a: Double, _ b: Double) -> Double? {
    if b == 0 {
        return nil
    }
    return a / b
}
// Calculator function

/*
func calculator() {
    let numbers: [(Double, Double, String)] = [
        (10, 9, "+"),
        (14, 2, "-"),
        (10, 5, "*"),
        (45, 0, "/"),
        (27, 3, "/")
    ]
    
    print("Calculator Results ")
    
    for (index, (a, b, operation)) in numbers.enumerated() {
        print("\n[\(index + 1)] Calculating: \(a) \(operation) \(b)")

        var result: Double?
        
        switch operation {
        case "+":
            result = add(a, b)
        case "-":
            result = subtract(a, b)
        case "*":
            result = multiply(a, b)
        case "/":
            result = divide(a, b)
            if result == nil {
                print("Error: Division by zero is not allowed")
                continue
            }
        default:
            print("Error: Unknown operation '\(operation)'")
            continue
        }
        
        if let value = result {
            print("Result: \(a) \(operation) \(b) = \(value)")
        }
    }
    
    print("\n All calculations completed ")
}

calculator()
*/

// Problem 10: Unique Characters

/*
func hasUniqueCharacters(_ text: String) -> Bool {
    // Create an empty Set
    var seenCharacters: Set<Character> = []
    
    
    for char in text {
        if seenCharacters.contains(char) {
            return false
        }
        seenCharacters.insert(char)
    }
    
    
    return true
}

let test1 = "Dimash"
let test2 = "Dinmukhamed"

print("Does '\(test1)' have all unique characters? \(hasUniqueCharacters(test1))")
print("Does '\(test2)' have all unique characters? \(hasUniqueCharacters(test2))")
*/
