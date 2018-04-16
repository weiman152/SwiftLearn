//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//第二章
// 2.1 基础部分
// 在swift语言中，大量使用常量（let），如果声明一个变量，而之后并没有改变该变量的值，xcode 会自动报出警告，告诉代码编写者，这个变量可以用常量代替。这样做，更加准确。
//常量和变量
let count = 10
var currentCount = 2

var a = 1.0, b = 2.0, c = 3.0

//注意，swift中没有可变类型和不可变类型之分，可变和不可变都归类到常量和变量中。

let array1 = [1,2,3]
var array2 = [2,3,4,5]
array2.append(7)
//array1.append(8) 这里会编译报错

//类型标注
//一个变量没有赋给初始值，就需要给它指定一个类型
var welcome: String
welcome = "你好"

//一行中可以定义多个同一个类型的变量，在最后加上类型标注
do {
    var a, b, c: Int
    a = 9
    b = 100
    c = 0
}

//常量和变量的命名
//你可以用任何你喜欢的字符作为常量和变量名，包括 Unicode 字符：
do {
    let 🐶 = "狗狗"
    let 叫声 = "汪汪"
    print(🐶+叫声)
}

//常量与变量名不能包含数学符号，箭头，保留的（或者非法的）Unicode 码位，连线与制表符。也不能以数字开头，但是可以在常量与变量名的其他地方包含数字。
//一旦你将常量或者变量声明为确定的类型，你就不能使用相同的名字再次进行声明，或者改变其存储的值的类型。同时，你也不能将常量与变量进行互转。

let cat = "🐈"; print(cat)

//整数范围
let minIntValue = UInt.min
let maxIntValue = UInt.max

let minInt8Value = UInt8.min
let maxInt8Value = UInt8.max

print(MAXFLOAT)

//数值型字面量
/*
 十进制：没有前缀
 二进制：0b
 八进制: 0o
 十六进制: 0x
 */

do {
    let shi = 17
    let er = 0b10001
    let ba = 0o21
    let shiliu = 0x11
}

//如果一个十进制数的指数为 exp，那这个数相当于基数和10^exp的乘积：
/*
 1.25e2 表示 1.25 × 10^2，等于 125.0。
 1.25e-2 表示 1.25 × 10^-2，等于 0.0125。
 */

//如果一个十六进制数的指数为exp，那这个数相当于基数和2^exp的乘积：
/*
 0xFp2 表示 15 × 2^2，等于 60.0。
 0xFp-2 表示 15 × 2^-2，等于 3.75。
 */

//下面的这些浮点字面量都等于十进制的12.1875：
/*
 let decimalDouble = 12.1875
 let exponentDouble = 1.21875e1
 let hexadecimalDouble = 0xC.3p0
 */

//数值类字面量可以包括额外的格式来增强可读性。整数和浮点数都可以添加额外的零并且包含下划线，并不会影响字面量：
/*
 let paddedDouble = 000123.456
 let oneMillion = 1_000_000
 let justOverOneMillion = 1_000_000.000_000_1
 */

//数值型类型转换
let twot: UInt16 = 2_000
let one: UInt8 = 1
let twoTAndOne = twot + UInt16(one)

let bool = true
if bool {
    print("真的")
} else {
    print("假的")
}

//元组
/*
 元组把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求相同类型
 */

let http404Error = (404,"Not Found")
print(http404Error.0)

let http200Status = (statusCode: 200, desc: "OK")
print(http200Status)
print(http200Status.statusCode)
print(http200Status.desc)

/*
 元组并不适用于创建复杂的数据结构，如果要创建复杂的结构，还是使用类或者结构体
 */

//可选类型
//可选类型表示值缺失的情况

//例如：构造器来尝试将一个String类型的值转成Int类型

let possibleNumber = "123"
let convertNumber = Int(possibleNumber)
// convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"

Int("hello")

//nil
//可以给可选变量赋值为nil来表示它没有值
var serverResponseCode: Int? = 404
serverResponseCode = nil
/*
 
 注意：
 nil不能用于非可选的常量和变量。如果你的代码中有常量或者变量需要处理值缺失的情况，请把它们声明成对应的可选类型。
 如果你声明一个可选常量或者变量但是没有赋值，它们会自动被设置为 nil：
*/

var surveyAnswer: String?
// surveyAnswer 被自动设置为 nil

//注意，在项目中，一个类的成员变量如果没有初始值的话，一定要声明成可选类型，不然类会报错

/*
 Swift的nil和Object的nil并不是一样的，在Object中nil表示是空指针，指向不存在的对象。在swift中，nil不是指针，它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以赋值为nil。
 */

//if和强制解析
//使用if和nil比较判断一个可选值是否有值

if convertNumber != nil {
    print("字符串转整数有值")
}

//强制解析
//当一个可选值确定有值的时候，使用！取值，也被称为可选值的强制解析
//注意：项目不要轻易使用强制解析解析，需要使用的时候一定要确认这个可选值一定有值，不然会崩溃

//隐式解析可选类型
/*
 如上所述，可选类型暗示了常量或者变量可以“没有值”。可选可以通过 if 语句来判断是否有值，如果有值的话可以通过可选绑定来解析值。
 
 有时候在程序架构中，第一次被赋值之后，可以确定一个可选类型总会有值。在这种情况下，每次都要判断和解析可选值是非常低效的，因为可以确定它总会有值。
 
 这种类型的可选状态被定义为隐式解析可选类型（implicitly unwrapped optionals）。把想要用作可选的类型的后面的问号（String?）改成感叹号（String!）来声明一个隐式解析可选类型。
 */

let possibleString: String? = "一个可选值"
let forcedString: String = possibleString!//这里需要感叹号来获取值

let assumedString: String! = "一个确定值"
let implicitString: String = assumedString

do {
    //如果不加？修饰，并且初始化的时候就已经赋值了的话，默认就是确定值
    let str = "不加修饰的字符串"
    let str2 = str
}

//错误处理
//你可以使用 错误处理（error handling） 来应对程序执行中可能会遇到的错误条件。

func canThrowAnError() throws {
    //这个函数有可能抛出错误
}

/*
 一个函数可以通过在声明中添加throws来抛出错误异常。当函数能抛出异常的时候应该使用try关键字
 */

do {
    try canThrowAnError()
    //没有错误抛出
} catch {
    //有错误信息抛出
}

func makeASandwich() throws {
    print("做三明治")
}

func eatASandwich() {
    print("吃三明治")
}

func washDishes() {
    print("洗盘子")
}

func buyGroceries(peiliao: String) {
    print("买配料")
}

enum SandwichError {
    case outOfCleanDishes
    case missingIngredients(ingredients: String)
}

do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outOfCleanDishes {
    washDishes()
} catch SandwichError.missingIngredients(let ingredients) {
    buyGroceries(peiliao: ingredients)
}

//断言
do {
    let age = -3
    //assert(age >= 0, "年龄必须大于0")
    //Assertion failed: 年龄必须大于0: file SwiftLearn3.playground, line 242
}
//断言可以帮助调试，一旦出现断言条件，xcode会主动报错













