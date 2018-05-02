//
//  main.swift
//  SwiftLearn9-闭包
//
//  Created by iOS on 2018/4/17.
//  Copyright © 2018年 weiman. All rights reserved.
//

import Foundation

print("Hello, World!")

/**
 闭包是自包含的代码块，可以在代码中被传递和使用。
 swift的闭包与C和OC的Block以及其他一些语言的匿名函数比较相似。
 */

/*
 闭包采取如下三种形式之一：
 1.全局函数是一个有名字但不会捕获任何值的闭包。
 2.嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
 3.闭包表达式是一个利用轻量级语法所写的可以捕获上下文中变量或者常量值的匿名闭包
 
 */

/*
 swift闭包表达式拥有简洁的风格，并鼓励优化。主要优化如下：
 1.利用上下文推断参数和返回值类型
 2.隐式返回单表达式闭包，即单表达式闭包可以省略关键字return
 3.参数名称缩写
 4.尾随闭包语法
 */

do {
    // 数组排序
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    
    func backward(s1: String, s2: String) -> Bool {
        return s1 > s2
    }
    // 名字按照字母倒序排列
    var reversedNames = names.sorted(by: backward)
    print("使用函数。\n \(reversedNames)")
    
    // 使用闭包
    reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
        return s1 > s2
    })
    print("使用闭包。\n \(reversedNames)")
    
    /*
     闭包的函数体部分由关键字in引入。该关键字表示闭包的参数和返回值类型定义已经完成，闭包函数体即将开始。
     */
    
    //闭包优化1: 根据上下文推断类型
    
    // 根据数组内的元素类型可以推断出参数的类型，所以，参数类型可以省略
    reversedNames = names.sorted(by: { (s1, s2) -> Bool in return s1 > s2 })
    print("根据上下文推断类型。\n \(reversedNames)")
    
    //闭包优化2: 单表达式闭包隐式返回
    
    //单行表达式可以省略return关键字
    reversedNames = names.sorted(by: { (s1, s2) -> Bool in s1 > s2 })
    print("单表达式闭包隐式返回\n  \(reversedNames)")
    
    //闭包优化3: 参数名称缩写
    
    /*Swift 自动为内联闭包提供了参数名称缩写功能，你可以直接通过 $0，$1，$2 来顺序调用闭包的参数，以此类推.
     如果你在闭包表达式中使用参数名称缩写，你可以在闭包定义中省略参数列表，并且对应参数名称缩写的类型会通过函数类型进行推断。in关键字也同样可以被省略，因为此时闭包表达式完全由闭包函数体构成：
 */
    reversedNames = names.sorted(by: { $0 > $1 })
    print("参数名称缩写\n  \(reversedNames)")
    
    //闭包优化4: 运算符方法
    /*
     Swift 的 String 类型定义了关于大于号（>）的字符串实现，其作为一个函数接受两个 String 类型的参数并返回 Bool 类型的值。而这正好与 sorted(by:) 方法的参数需要的函数类型相符合。因此，你可以简单地传递一个大于号，Swift 可以自动推断出你想使用大于号的字符串函数实现：
     */
    reversedNames = names.sorted(by: >)
    print("运算符方法\n  \(reversedNames)")
    
    
}


// 尾随闭包
// 如果你需要将一个很长的闭包表达式作为最后一个参数传递给函数，可以使用尾随闭包来增强函数的可读性。
// 尾随闭包，顾名思义就是闭包作为函数的最后一个参数。
do {
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    var reversedNames = names.sorted(){ $0 > $1 }
    print("尾随闭包\n  \(reversedNames)")
    
    //如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略
    
    reversedNames = names.sorted { $0 > $1 }
    print("尾随闭包简化\n  \(reversedNames)")
    
    
}

/*
 使用尾随闭包将 Int 类型数组 [16, 58, 510] 转换为包含对应 String 类型的值的数组["OneSix", "FiveEight", "FiveOneZero"]
 */

do {
    let digitNames = [
        0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
        5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
    ]
    
    let numbers = [16, 58, 510]
    
    let strings  = numbers.map { (number) -> String in
        var number = number
        var output = ""
        repeat {
            output = digitNames[number % 10]! + output
            number /= 10
        } while number > 0
        
        return output
    }
    
    print("---- \(strings)")
}








