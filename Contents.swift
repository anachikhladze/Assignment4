import UIKit
import Foundation

func firstProblemWithoutRecursion(number: Int) {
    /*
     შექმენით function რომლის მეშვეობითაც გამოითვლით ფაქტორიალს. function იღებს ერთ Int ტიპის ცვლადს და აბრუნებს ფაქტორიალს, ანუ მაგალითად თუ გადავაწვდით 5-იანს function-მა უნდა დაგვიბრუნოს 120 რომელიც მიიღო შემდეგი გამოთვლის შედეგად 5*4*3*2*1. არ გამოიყენოთ მზა ფუნქციები.
     */
    
    print("--------------- First Problem Without Recursion ---------------")
    
    func factorial(_ number: Int) -> Int {
        var res = 1
        for i in 1...number {
            res *= i
        }
        return res
    }
    print("Factorial Of \(number) is \(factorial(number))")
}

func firstProblemWithRecursion(number: Int) {
    print("--------------- First Problem With Recursion ---------------")
    
    func factorialWithRecursion(_ number: Int) -> Int {
        if number == 0 {
            return 1
        }
        return number * factorialWithRecursion(number - 1)
    }
    print("Factorial Of \(number) is \(factorialWithRecursion(number))")
}

func printFirstProblemResult(){
    firstProblemWithRecursion(number: 5)
    firstProblemWithoutRecursion(number: 5)
    
    firstProblemWithRecursion(number: 7)
    firstProblemWithoutRecursion(number: 7)
}

func firstProblem() {
    printFirstProblemResult()
}

/*
 შექმენით function რომელიც აგენერირებს ფიბონაჩის პირველ 20 რიცხვს. არ გამოიყენოთ მზა ფუნქციები.
 */

func getFibonacciNumbers(n: Int) -> [Int] {
    if n <= 0 {
        return []
    } else if n == 1 {
        return [0]
    } else if n == 2 {
        return [0, 1]
    }
    
    var sequence = [0, 1]
    
    while sequence.count < n {
        let nextNumber = sequence[sequence.count - 1] + sequence[sequence.count - 2]
        sequence.append(nextNumber)
    }
    return sequence
}

func printSecondProblemResult(n: Int) {
    print("First \(n) Fibonacci numbers are: \(getFibonacciNumbers(n: n))")
}

func secondProblem() {
    print()
    print("--------------- Second Problem ---------------")
    printSecondProblemResult(n: 20)
}

/*
 შექმენით function რომელიც მიიღებს String-ს, function-მა უნდა შეამოწმოს პალინდრომია (წინიდანაც და უკნიდანაც იკითხება ერთნაირად) თუ არა ეს String-ი. მაგალითად "racecar" ამ შემთხვევაში ფუნქციამ უნდა დააბრუნოს true. არ გამოიყენოთ მზა ფუნქციები. შეგიძლიათ მეორე solution-ი მზა ფუნქციის გამოყენებით გვაჩვენოთ.
 */

func isPalindrome(_ str: String) -> Bool {
    return str.lowercased() == reversedString(str).lowercased()
}

func reversedString(_ str: String) -> String {
    var res = ""
    
    for char in str {
        res = String(char) + res
    }
    return res
}

func printThirdProblemResult(_ str: String) {
    if isPalindrome(str) {
        print("\(str) is a Palindrome")
    } else {
        print("\(str) is Not a Palindrome")
    }
}

func thirdProblem() {
    print()
    print("--------------- Third Problem ---------------")
    
    printThirdProblemResult("Ana")
    printThirdProblemResult("Racecar")
    printThirdProblemResult("Level")
    printThirdProblemResult("Breakfast")
}

/*
 შექმენით function რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.
 */

func getSquareNumbers(_ numArray: [Int]) -> [Int] {
    var squareNumArray: [Int] = []
    
    for num in numArray {
        let square = Int(pow((Double)(num), 2))
        squareNumArray.append(square)
    }
    return squareNumArray
}

func printFourthProblemResult(_ numArray: [Int]) {
    print("Square Numbers of \(numArray) are \(getSquareNumbers(numArray))")
}

func fourthProblem() {
    print()
    print("--------------- Fourth Problem ---------------")
    
    var numArray = [2, 4, 11, 16, 17, 20]
    printFourthProblemResult(numArray)
}

/*
 შექმენით function რომელიც დაითვლის სიტყვების რაოდენობას String-ში, ფუნქციამ უნდა მიიღოს String-ი, და დააბრუნოს dictionary, სიტყვებით და იმ რაოდენობით რამდენჯერ იყო ერთი და იგივე სიტყვა გამოყენებული String-ში. uppercase და lowercase ასოები უნდა იყოს დაჰენდლილი ერთნაირად, მაგალითად თუ function-s გადავაწვდით "TBC x USAID, tbc it academy, we are in TBC academy." function-მა უნდა დააბრუნოს ["tbc": 3, "academy": 2, "we": 1, "are": 1, "in": 1, "it": 1, "x": 1]
 */

func getWordCount(_ str: String) -> [String: Int] {
    let wordsArray = str.lowercased().components(separatedBy: " ")
    var dictionary = [String: Int]()
    
    for word in wordsArray {
        if let count = dictionary[word] {
            dictionary[word] = count + 1
        } else {
            dictionary[word] = 1
        }
    }
    return dictionary
}

func fifthProblem() {
    print()
    print("--------------- Fifth Problem ---------------")
    
    let str = "TBC x USAID tbc it academy we are in TBC academy"
    print(getWordCount(str))
}

/*
 შექმენით Closure რომელსაც გადაეცემა რიცხვი და დააბრუნებს ამ რიცხვის ორობით ჩანაწერს.
 */

let binaryNum: (Int) -> String = { number in
    return String(number, radix: 2)
}

func printSixthProblemResult(number: Int) {
    let binaryStr = binaryNum(number)
    print("\(number) to Binary is \(binaryStr)")
}

func sixthProblem() {
    print()
    print("--------------- Sixth Problem ---------------")
    printSixthProblemResult(number: 89)
}

func seventhProblem() {
    /*
     შექმენით Closure რომელიც გაფილტრავს(ანუ წაშლის) კენტ რიცხვებს Int-ების Array-დან.
     */
    print()
    print("--------------- Seventh Problem ---------------")
    
    var numArray = [13, 16, 2, 7, 8, 99, 100]
    
    let removeOddNumbers: () -> () = {
        numArray = numArray.filter { $0 % 2 == 0 }
    }
    
    removeOddNumbers()
    print("Filtered Array: \(numArray)")
}

func eighthProblem() {
    /*
     შექმენით Closure რომელიც დამაპავს(ანუ გააკეთებს ქმედებას ყველა მასივის ელემენტზე) Int-ების Array-ის და თითოეულ ელემენტს გაათმაგებს.
     */
    
    print()
    print("--------------- Eighth Problem ---------------")
    var numArray = [13, 16, 2, 7, 8, 99, 100]
    
    let decupledNumbers = numArray.map{ $0 * 10 }
    print("Decupled numbers of \(numArray) are \(decupledNumbers)")
}

func ninthProblem() {
    /*
     გამოიყენეთ escaping closure სადაც 3 წამის შემდეგ დაბეჭდავს ჩაწოდებული მასივის ჯამს.
     */
    
    print()
    print("--------------- Ninth Problem ---------------")
    
    func escapingClosure(_ operation: @escaping ([Int]) -> Void) {
        let numArray = [13, 16, 2, 7, 8, 99, 100]
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            operation(numArray)
        }
    }
    
    let closure: ([Int]) -> Void = { numbers in
        let sum = numbers.reduce(0, +)
        print("Sum of elements is \(sum)")
    }
    
    escapingClosure(closure)
    
    RunLoop.current.run(until: Date(timeIntervalSinceNow: 4))
}

func tenthProblem() {
    /*
     function-ს გადავცეთ String-ების array და დაგვიბრუნოს მხოლოდ კენტი რიცხვების მასივი. გამოიყენეთ high order functions.
     */
    print()
    print("--------------- Tenth Problem ---------------")
    
    func filterOddNumbers(from strArray: [String]) -> [Int] {
        let oddNumbers = strArray.compactMap { Int($0) }
            .filter { $0 % 2 != 0 }
        return oddNumbers
    }
    
    var strArray = ["13", "16", "2", "7", "K", "Ana"]
    let oddNumbersArray = filterOddNumbers(from: strArray)
    print("Odd Numbers: \(oddNumbersArray)")
}

firstProblem()
secondProblem()
thirdProblem()
fourthProblem()
fifthProblem()
sixthProblem()
seventhProblem()
eighthProblem()
ninthProblem()
tenthProblem()
