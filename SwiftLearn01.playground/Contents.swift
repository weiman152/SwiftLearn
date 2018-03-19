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

//元组
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        }
        if score < min {
            min =  score
        }
        sum += score
    }
    
    return (min,max,sum)
}

let statistics = calculateStatistics(scores: [5,3,6,21,32,55,33])
print(statistics)
print(statistics.sum)
print(statistics.2)

// 函数参数不固定 的使用方式  (厉害了)
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

sumOf(numbers: 1)
sumOf(numbers: 1,2,3)
sumOf(numbers: 3,4,5,6,7,8)

func 平均值(参数们: Int...) -> Double {
    var avg = 0.0
    var sum = 0
    for n in 参数们 {
        sum += n
    }
    avg = Double(sum/参数们.count)
    return avg
}

平均值(参数们: 2,3,4,5,6)
平均值(参数们: 2,4)

//函数嵌套
func returnFifteen() -> Int {
    var y = 10
    func add(){
        y += 5
    }
    add()
    return y
}

returnFifteen()

//函数的返回值为一个函数
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

var increment = makeIncrementer()
increment(7)

//函数作为参数传入另一个函数
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers2 = [20,19,7,12]

hasAnyMatches(list: numbers2, condition: lessThanTen)

/*
 函数实际上是一种特殊的闭包:它是一段能之后被调取的代码。闭包中的代码能访问闭包作用域中的变量和函数，即使闭包是在一个不同的作用域被执行的 - 你已经在嵌套函数的例子中看过了。你可以使用 {} 来创建一个匿名闭包。使用 in 将参数和返回值类型的声明与闭包函数体进行分离。
 */

//数组每个元素的三倍组成的数组
let num3 = numbers2.map { (number: Int) -> Int in
    let result = 3 * number
    return result
}

print(num3)

let num4 = numbers2.map { (number: Int) -> Int in
    if number % 2 != 0 {
        return 0
    } else {
        return number
    }
}

print(num4)

/*
 创建简单闭包的方法
 如果一个闭包的类型已知，可以忽略参数，返回值，甚至两个都忽略
 */

let mapNumber = numbers2.map({ number in  3 * number })
print(mapNumber)

/*
 通过参数位置而不是名字来引用参数 —— 这个方法在非常短的方法中非常好用。比如在懒加载的时候。
 */
//从大到小排序
let sortNumbers = numbers2.sorted{ $0 > $1 }
print(sortNumbers)

//-----------------------对象和类--------------------------

//创建类 ：使用关键字 class
class Shape {
    var numberOfSides = 0
    let color = "红色"
    func desc() -> String {
        return "一个具有 \(numberOfSides)个边的图形"
    }
    
    func setSides(number: Int) {
        self.numberOfSides = number
    }
}

//创建类的实例
var shape = Shape()
shape.setSides(number: 7)
print(shape.desc())

/*
 这个版本的 Shape 类缺少了一些重要的东西：一个构造函数来初始化类实例。使用 init 来创建一个构造器
 */

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func desc() -> String {
        return "这是一个具有\(numberOfSides)边的图形"
    }
    //删除对象之前进行一些清理工作，使用 deinit 创建一个析构函数。
    deinit {
        
    }
}

/*创建子类： 在类名的后面加上父类的名字，使用冒号分割。 而且创建类的时候并不需要一个标准的根类，
 这与OC的所有类都继承自NSObject根类有一点区别。
*/

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
}

/*
 重写父类的方法： override
 如果没有添加 override 就重写父类方法的话编译器会报错。
 编译器同样会检测 override 标记的方法是否确实在父类中。
 */

class SquareMy: Square {
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func desc() -> String {
        return "这是一个正方形，边长是 \(sideLength)"
    }
}

let test = SquareMy.init(sideLength: 5.2, name: "test")
print("正方形的面积是 \(test.area())")
print(test.desc())

/*
 getter 和 setter 方法
 除了存储简单的属性之外，属性可以有 getter 和 setter 方法
 */

class Sanjiaoxing: NamedShape {
    var sideLength: Double = 0.0
    
    /*
     注意 sanjiaoxing 类的构造器执行了三步：
     
     设置子类声明的属性值
     调用父类的构造器
     改变父类定义的属性值。其他的工作比如调用方法、getters 和 setters 也可以在这个阶段完成。
     */
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
           return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func desc() -> String {
        return "这是一个等边三角形，三角形的边长是 \(sideLength)"
    }
}

var triangle = Sanjiaoxing.init(sideLength: 3.1, name: "三角形")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)
print(triangle.desc())

/*
 willset 和didset
 如果不需要计算属性，但是仍然需要在设置一个新值之前或者之后运行代码，使用willSet和didSet.
 写入的代码会在属性值发生改变时调用，但不包含构造器中发生值改变的情况。
 */

//正方形和三角形的边长相同
class TriangleAndSquare {
    var sanjiao: Sanjiaoxing {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: SquareMy {
        willSet {
            sanjiao.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = SquareMy.init(sideLength: size, name: name)
        sanjiao = Sanjiaoxing.init(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare.init(size: 10, name: "三角形和正方形相同的边长的图形")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.sanjiao.sideLength)
triangleAndSquare.square = SquareMy.init(sideLength: 50, name: "大的正方形")
print(triangleAndSquare.sanjiao.sideLength)




























