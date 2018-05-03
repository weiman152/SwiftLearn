//
//  main.swift
//  SwiftLearn9-闭包
//
//  Created by iOS on 2018/4/17.
//  Copyright © 2018年 weiman. All rights reserved.
//

import Foundation

print("Hello, World!")

/** 一、
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


// 二、尾随闭包
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

/*
 三、值捕获
 闭包可以在其被定义的上下文中捕获常量或者变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
 
 Swift 中，可以捕获值的闭包的最简单形式是嵌套函数，也就是定义在其他函数的函数体内的函数。嵌套函数可以捕获其外部函数所有的参数以及定义的常量和变量。
 
 举个例子，这有一个叫做 makeIncrementer 的函数，其包含了一个叫做 incrementer 的嵌套函数。嵌套函数  incrementer() 从上下文中捕获了两个值，runningTotal 和 amount。捕获这些值之后，makeIncrementer 将 incrementer 作为闭包返回。每次调用 incrementer 时，其会以 amount 作为增量增加 runningTotal 的值。
 */

func makeIncrementer(forIncrement amount: Int) -> ()->Int{
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
print("-----1-----  \(incrementByTen())")
print("-----2-----  \(incrementByTen())")
print("-----3-----  \(incrementByTen())")
print("-----4-----  \(incrementByTen())")
/*
 结果是：
 -----1-----  10
 -----2-----  20
 -----3-----  30
 -----4-----  40
 */

/*
 解释：
 捕获引用保证了 runningTotal 和 amount 变量在调用完 makeIncrementer 后不会消失，并且保证了在下一次执行 incrementer 函数时，runningTotal 依旧存在。
 
 注意 为了优化，如果一个值不会被闭包改变，或者在闭包创建后不会改变，Swift 可能会改为捕获并保存一份对值的拷贝。 Swift 也会负责被捕获变量的所有内存管理工作，包括释放不再需要的变量。
 */

/*
 如果你创建了另一个 incrementer，它会有属于自己的引用，指向一个全新、独立的 runningTotal 变量：
 */

let incrementBySeven = makeIncrementer(forIncrement: 7)
print("--aa--- \(incrementBySeven())")

/*
 注意：
 如果你将闭包赋值给一个类实例的属性，并且该闭包通过访问该实例或其成员而捕获了该实例，你将在闭包和该实例间创建一个循环强引用。Swift 使用捕获列表来打破这种循环强引用
 */

/*
 四、闭包是引用类型
 上面的例子中，incrementBySeven 和 incrementByTen 都是常量，但是这些常量指向的闭包仍然可以增加其捕获的变量的值。这是因为函数和闭包都是引用类型。
 这也意味着如果你将闭包赋值给了两个不同的常量或变量，两个值都会指向同一个闭包。
 */

let alsoIncrementByTen = incrementByTen
print("--bb-- \(alsoIncrementByTen())")

/*
 打印结果：
 --bb-- 50
 */

/*
 五、逃逸闭包
 当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。
 当你定义接受闭包作为参数的函数时，你可以在参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的。
 */

// 一个数组，数组的元素是无参数，无返回值的函数
var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

//将一个闭包标记为 @escaping 意味着你必须在闭包中显式地引用 self。
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// 打印出 "200"

completionHandlers.first?()
print(instance.x)
// 打印出 "100"

/*
 六、自动闭包
 自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。
 这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。这种便利语法让你能够省略闭包的花括号，用一个普通的表达式来代替显式的闭包。
 */

do {
    var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    print(customersInLine.count)
    
    let customerProvider = { customersInLine.remove(at : 0) }
    print("customersInLine: \(customersInLine.count)")
    print("customerProvider = \(customerProvider())")
    print("customersInLine: \(customersInLine.count)")
    
    /*
     打印结果：
     5
     customersInLine: 5
     customerProvider = Chris
     customersInLine: 4
     
     由此可以看出，在调用customerProvider之前，花括号中的语句体都没有执行，直到customerProvider调用才执行。
     */
    
    //将闭包作为参数传递给函数时，你能获得同样的延时求值行为。
    
    func serve(customer customerProvider: () -> String) {
        print("Now serving \(customerProvider())!")
    }
    serve(customer: { customersInLine.remove(at: 0) } )
    // 输出：Now serving Alex!
    
    /*
     注意
     过度使用 autoclosures 会让你的代码变得难以理解。上下文和函数名应该能够清晰地表明求值是被延迟执行的。
     */
}

// 个人认为，代码的书写应该尽量的逻辑清晰，易读，过多的使用闭包或许会让代码过于晦涩难懂。






