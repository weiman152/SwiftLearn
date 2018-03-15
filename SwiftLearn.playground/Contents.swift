//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

/*
 学习swift4 的语法: 第一章 欢迎使用swift
 */
print("Hello World")
//1.常量
let v1 = 12

//2.变量
var v2 = 14
v2 = v1
var v3 = "你好"
let v4 = "小明"
v3 = v3 + v4
let v5: CGFloat = 4

//3.类型转换： 值永远不会被隐式转换为其他类型，如果需要类型转换，需要显式的进行转换。这一点与OC和C都不同。
let label = "the width is"
let width = 94
//let widthLabel = label + width //这样写会报错binary operator '+' cannot be applied to operands of type 'String' and 'Int'
let widthLabel = label + " " + String(width)
//值转成字符串的另一种方式 \()
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples"
let orangesSummary = "I have \(oranges) oranges"

//4.数组，字典 使用 [] 创建
var list = ["fish", "water", "paint"]
list[1] = "可乐"
//字典
var dic = [
    "name": "苹果",
    "weight": "2.4kg"
]
dic["name"]
//空的字典、数组,需要制定元素类型
let arr1: [Int] = []
let dict2 = [String: Any]()

//5.控制流
/*
 使用if 和 switch 来进行条件操作
 使用 for-in \ for \ while \ repeat-while 来进行循环。包裹条件和循环变量括号可以省略，但是语句体的大括号不能省略。
 */

let scores = [75,43,103,87,12]
var teamScore = 0
for score in scores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

print(teamScore)

//注意，swift中，if中的表达式不会隐式的与0进行比较，也不是非0即真

//可选值： ？ 表示这个值可以为nil
var str1: String? = "Hello"
print(str1 == nil)
var str2: String? = "Jone"
var str3 = "你好"
//取出可选值 if let name = str2
if let name = str2 {
    str3 = "\(str3),\(name)"
}

var name: String?
var greeting = "你好呀"
if let name = name {
    print("\(name) \(greeting)")
}else{
    print(" swift \(greeting)")
}

//给可选值赋值默认值 ?? :如果可选值为nil的话，可以给一个默认值
let nickName: String? = nil
let fullName: String = "John"
let info = "Hi \(nickName ?? fullName)"

/*switch : 支持任意类型的数据以及各种比较操作----不仅仅是整数以及测试相等。
            而且必须有default
            每一个case后面不需要break
            成功匹配了一个case之后，不再比较后面的case，直接跳出switch*/
let table = "红色的纸"
switch table {
case "黄色的纸":
    print("这是一张黄色的纸")
case "花儿","草地":
    print("不错的环境")
case let x where x.hasSuffix("纸"):
    print("真的是 \(x)")
default:
    print("都不是")
}

//遍历字典
let numbers = [
    "素数": [2,3,5,7,11,13],
    "斐波那契数列": [1, 1, 2, 3, 5, 8],
    "平方": [1, 4, 9, 16, 25]
]

var largest = 0
var theKind: String?

for (kind, nums) in numbers {
    for number in nums {
        if number > largest {
            largest = number
            theKind = kind
        }
    }
}

print("\(largest)  \(theKind ?? "")")

//while 循环 repeat-while
var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100

print(m)

//循环中范围表示。
/*
 ... : 例如 0...10 表示 闭区间 [0,10]
 ..< : 例如 0..<10 半闭区间 [0,10)
 */
var total = 0
for i in 0..<4 {
    print(i)
    total += i
}
print(total)

//6.函数和闭包
/*
 使用 func 来声明一个函数，使用名字和参数来调用函数。使用 -> 来指定函数返回值的类型
 */

func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}

let re = greet(person: "小花", day: "2088-03-05")
print(re)

func haveLunch(person: String, food: String) -> String {
    return "邀请\(person)吃午饭 ，吃的是\(food)"
}

let haveL = haveLunch(person: "小李", food: "火锅")
print(haveL)

/*
 默认情况下，函数使用它们的参数名称作为它们参数的标签，在参数名称前可以自定义参数标签，或者使用 _ 表示不使用参数标签。
 */

func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}

print("\(greet("美美", on: "周三"))")






















