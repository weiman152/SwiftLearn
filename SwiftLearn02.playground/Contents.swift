//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//枚举和结构体
/*
 使用 enum来创建一个枚举。
枚举就像类一样，可以包含方法
 */

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func desc() -> String {
        switch self {
        case .ace:
            return "aaaaaa"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue

print(Rank.ten.rawValue)
print(Rank.king)
print(Rank.king.rawValue)
print(ace.desc())

if let conRank = Rank(rawValue: 3) {
    let three = conRank.desc()
    print(three)
}

enum Suit {
    
    case spades, hearts, diamonds, clubs
    
    func desc() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        default:
            return "red"
        }
    }
}

let hearts = Suit.hearts
let heartDesc = hearts.desc()
print(hearts.color())

enum ServerResponse {
    case result(String, String)
    case failure(String)
    case noNet(String)
}

let success = ServerResponse.result("6:00", "8:30")
let failure = ServerResponse.failure("时间不对")
let nonet = ServerResponse.noNet("没有网络")
switch nonet {
    case let .result(sunrise, sunset):
       print("太阳出来时间：\(sunrise),太阳下山时间：\(sunset)")
    case let .failure(message):
       print("失败了。。。。\(message)")
    case let .noNet(mess):
       print("网络：\(mess)")
}

/**
 使用 struct 来创建一个结构体。
 结构体和类有很多相同的地方，比如方法构造器。他们之间最大的区别就是：
 结构体传值，类传引用
 */

struct Card {
    var rank: Rank
    var suit: Suit
    
    func Desc() -> String {
        return "the \(rank.desc()) of \(suit.desc())"
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
print(threeOfSpades.Desc())


//协议和扩展

/*
 使用 protocol 来声明一个协议
 */
protocol TestProtocol {
    var desc: String { get }
    //mutating 一个可以被修改的方法，因为结构体中的方法不是像类的方法一样都可以修改
    mutating func adjust()
}

//注意： 类、枚举、结构体都可以实现协议

class SimpleClass: TestProtocol {
    var desc: String = "这是一个简单的类"
    var id: Int = 111
    
    func adjust() {
        desc += "哈哈哈哈"
    }
}

var a = SimpleClass()
a.adjust()
print(a.desc)

struct SimpleStruct:TestProtocol {
    var desc: String = "这是一个结构体"
    mutating func adjust() {
        desc += "哇哇哇"
    }
}

var s = SimpleStruct()
s.adjust()
print(s.desc)

/*
 注意声明 SimpleStructure 时候 mutating 关键字用来标记一个会修改结构体的方法。SimpleClass 的声明不需要标记任何方法，因为类中的方法通常可以修改类属性（类的性质）。
 */

/*
 使用 extension 来为现有的类型添加功能，比如新的方法和计算属性。你可以使用扩展让某个在别处声明的类型来遵守某个协议，这同样适用于从外部库或者框架引入的类型。
 extension 在swift中特别常用。
 
 */

extension Int: TestProtocol {
    var desc: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.desc)


/*
 错误处理
 采用Error协议的类型来表示错误
 */

enum PrintError: Error {
    case outOfPaper
    case noToner
    case OnFire
}

//使用 throw 来抛出异常，并使用throws来表示一个可以抛出错误的函数。如果在函数中抛出一个错误，这个函数会立刻返回并调用该函数的代码进行错误处理。

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "AA" {
        throw PrintError.noToner
    }
    return "Job send"
}

/*
 有多种方式来进行错误处理。一种方式是使用do-catch。在do代码块中，使用try来标记可以抛出错误的代码。在catch代码块中，除非另外命名，否则错误会自动命名为error。
 */

do {
    let printerResponse = try send (job: 1040, toPrinter: "AA")
    print(printerResponse)
} catch {
    print(error)
}

/*
 使用defer代码块来表示在函数返回前，函数中最后执行的代码。无论函数是否抛出异常，这段代码都会执行。使用defer，可以把函数调用之初就要执行的代码和函数调用执行结束时的扫尾代码写一起，虽然这两者的执行时机截然不同。
 defer是无论如何都会执行的语句块，注意，要放在return之前，如果放在之后还是不会执行了。
 */

var fridgeIsOpen = false
let fridgeContent = ["milk","eges","leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    let result = fridgeContent.contains(food)
    return result
}
let contains = fridgeContains("eges")
print(contains)
print(fridgeIsOpen)

//注意打印顺序
func checkSomething() {
    
    print("CheckPoint 1")
    doSomething()
    print("CheckPoint 4")
    
}

func doSomething() {
    
    print("CheckPoint 2")
    defer {
        print("Clean up here")
    }
    print("CheckPoint 3")
    
}

checkSomething()
//这就是defer的作用，它对进行了print("Clean up here")延迟。

/*
 泛型

 在尖括号里写一个名字来创建一个泛型函数或者类型
 */
//Item就是泛型
func repeatItem<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

let result = repeatItem(repeating: "knock", numberOfTimes: 4)
print(result)

let re = repeatItem(repeating: 2, numberOfTimes: 2)
print(re)

//还可以创建泛型函数、方法、类、枚举和结构体

//重新实现 swift 标准库中的可选类型

enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
}

var possibleInteger: OptionalValue<Int>  = .None
possibleInteger = .Some(100)



















