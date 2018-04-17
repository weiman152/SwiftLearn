//
//  main.swift
//  SwiftLearn8
//
//  Created by iOS on 2018/4/16.
//  Copyright © 2018年 weiman. All rights reserved.
//

import Foundation

print("Hello, World!")

//定义和调用
do {
    //欢迎一个人
    //带参数的函数，没有返回值
    func greeting(personName: String) {
        print("欢迎 \(personName) 来到大别山")
    }
    
    //带参数的函数，有返回值
    func greeting(name: String) -> String {
        let str = "欢迎 \(name) 来到澜沧江"
        return str
    }
    
    //不带参数，没有返回值
    func sayHello() -> () {
        print("你好")
    }
    
    //调用
    greeting(personName: "王小华")
    
    let str = greeting(name: "李晓灯")
    print(str)
    
    sayHello()
}

do {
    //多参数函数
    func greet(person: String, alreadGreeted: Bool) {
        if alreadGreeted == true {
            print("再一次欢迎 \(person) 来到北京")
        } else {
            print("欢迎你 \(person) 来北京")
        }
    }
    
    greet(person: "王小二", alreadGreeted: true)
    greet(person: "斯威夫特", alreadGreeted: false)
    
}

/*
 严格上来说，虽然没有返回值被定义，greet(person:) 函数依然返回了值。没有定义返回类型的函数会返回一个特殊的Void值。它其实是一个空的元组（tuple），没有任何元素，可以写成()
 */


//swift中因为有元组，函数的返回值也是一个元组，这个元组内自然可以放置任何元素，也可以是任意个。这一点与别的语言都不一样，其他语言返回值只能是一个。

do {
    // 求最大值和最小值的方法
    func minMax(array:[Int]) -> (Int,Int)? {
        if array.isEmpty {
            return nil
        }
        var currentMin = array[0]
        var currentMax = array[0]
        for item in array {
            if item > currentMax {
                currentMax = item
            }
            
            if item < currentMin {
                currentMin = item
            }
        }
        return (currentMin,currentMax)
    }
    
    let array = [2,4,23,5,4,12,66,43,76,45,37,85]
    let temp = minMax(array: array)
    
    print("最小值: \(String(describing: temp?.0)), 最大值: \(String(describing: temp?.1))")
    
}

// 参数标签

do {
    func greet(person: String, from hometown: String) -> String {
        return "Hello \(person)! Glad you could visit from \(hometown)."
    }
    print(greet(person: "json", from: "asia"))
}

// 默认参数值
//你可以在函数体中通过给参数赋值来为任意一个参数定义默认值（Deafult Value）。当默认值被定义后，调用这个函数时可以忽略这个参数。

do {
    func hello(name: String, greet: String = "你好") {
        print("\(name),\(greet)")
    }
    // 如果函数参数中有默认值，系统会为我们生成两种声明形式，一个是带默认参数的，一个是不带默认参数的。
    hello(name: "小明")
    hello(name: "小华", greet: "欢迎你")
}

// 可变参数
/*
 一个可变参数可以接受一个或者多个值。函数调用的时候，可以用可变参数指定，函数可以传入不确定的参数。
 可变参数的传入值在函数体中变为此类型的一个数组。所以，可变参数只能传入相同类型的值。
 */

do {
    // 计算一组任意长度数字的算术平均数
    func arithmeticMean(_ numbers: Double...) -> Double {
        var total: Double = 0
        for num in numbers {
            total += num
        }
        return total / Double(numbers.count)
    }
    
    print(arithmeticMean(1,2,3,4,5,6,7))
    print(arithmeticMean(3,8.25))
    /*
    注意：
    一个函数最多只能拥有一个可变参数。
     */
}

/*
 输入输出参数
 默认情况下，函数的参数是一个常量，如果想在函数中改变参数的值，并且传出这个改变后的值，就需要定义特殊的参数
 
 注意 输入输出参数不能有默认值，而且可变参数不能用 inout 标记
 */

do {
    func swapTwoInts(_ a:inout Int,_ b: inout Int) {
        let temp = a
        a = b
        b = temp
    }
    
    var someInt = 3
    var anotherInt = 107
    swapTwoInts(&someInt, &anotherInt)
    // 就像是引用传递一样，传入函数之后，这两个值发生了改变
    print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
}

// 函数类型
// 每个函数都有特定的类型，函数类型是由函数的参数类型和返回类型组成

do {
    func addTwoInts(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
    
    // 这两个函数的类型是相同的，都是 （Int，Int）-> Int
}

// 使用函数类型
// 1. 函数类型的常量或者变量
// swift中，使用函数类型就像使用其他类型一样。可以定义一个类型为函数的常量或者变量，并且给它赋值。

do {
    func addTwoInts(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    // 把函数赋值给变量
    let  mathFunction: (Int,Int) -> Int = addTwoInts
    // 使用函数类型的变量
    print(mathFunction(2,4))
}

// 2. 函数作为参数
do {
    func addTwoInts(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    func minus(a: Int, b: Int) -> Int {
        return a - b
    }
    
    let  mathFunction: (Int,Int) -> Int = addTwoInts
    // 函数作为参数
    func printMath(math: (Int,Int) -> Int, a: Int, b: Int) {
        print("result: \(math(a,b))")
    }
    
    //调用
    printMath(math: mathFunction, a: 3, b: 6)
    
    printMath(math: minus, a: 10, b: 8)
    
}

// 3.函数类型作为返回类型
/*
 你可以用函数类型作为另一个函数的返回类型。你需要做的是在返回箭头（->）后写一个完整的函数类型
 */

do {
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    
    func chooseStep(back: Bool) -> (Int) -> Int {
        return back ? stepBackward : stepForward
    }
    
    //使用
    var currentValue = 3
    let move = chooseStep(back: currentValue > 0)
    print(move(currentValue))
    
    //计算 currentValue 逐渐接近到0是需要向正数走还是向负数走
    while currentValue != 0 {
        print("\(currentValue)...")
        currentValue = move(currentValue)
    }
}

// 4.嵌套函数
/*
 前面定义的函数都是全局函数，他们定义在全局域中。
 还可以把函数定义在别的函数体中，称为 嵌套函数
 */

do {
    
    func chooseStep(back: Bool) -> (Int) -> Int {
        func stepForward(input: Int) -> Int { return input + 1 }
        func stepBackward(input: Int) -> Int { return input - 1 }
        return back ? stepBackward : stepForward
    }
    
    // 调用
    
    let result = chooseStep(back: true)
    print("函数嵌套。   \(result(6))")
    
}






