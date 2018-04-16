//
//  main.swift
//  SwiftLearn7
//
//  Created by iOS on 2018/4/16.
//  Copyright © 2018年 weiman. All rights reserved.
//

import Foundation

print("Hello, World!")

/*
 switch语句：
 1.不需要显示的break
 与C和OC不同的是，Swift中，switch每个case后面不需要显示的添加break语句。
 每个case执行完成之后会自动跳出switch。
 2.每个case分支至少有一条语句。不然，编译阶段会报错。
 3.每个case条件可以有复合匹配，用逗号分隔。
 4.不像 C 语言，Swift 允许多个 case 匹配同一个值。实际上，在这个例子中，点(0, 0)可以匹配所有四个 case。但是，如果存在多个匹配，那么只会执行第一个被匹配到的 case 分支。考虑点(0, 0)会首先匹配case (0, 0)，因此剩下的能够匹配的分支都会被忽视掉。
 
 */

do {
    let char = "a"
    switch char {
    case "a","A":
        print("The letter A")
    default:
        print("不知道是啥")
    }
}

//匹配区间
do {
    let score = 78
    switch score {
    case 90...100:
        print("A")
    case 80..<90:
        print("B")
    case 70..<80:
        print("C")
    case 60..<70:
        print("D")
    default:
        print("E")
    }
}

//switch匹配元组
do {
    //判断点所在区域
    let point = (0,5)
    switch point {
    case (0,0):
        print("原点")
    case (_,0):
        print("X轴")
    case (0,_):
        print("Y轴")
    case (-2...2,-5...10):
        print("矩形框内")
    default:
        print("不知道在哪儿")
    }
}

//值绑定
do {
    let point = (2,0)
    switch point {
    case (let x,0):
        print("在X轴，X=\(x)")
    case (0,let y):
        print("在Y轴，Y=\(y)")
    default:
        print("不在轴上")
        
    }
}

//where
//case 分支的模式可以使用where语句来判断额外的条件。
do {
    let point = (-1,1)
    switch point {
    case let (x,y) where x == y:
        print("\(x),\(y)在线x==y上")
    case let (x,y) where x == -y:
        print("\(x),\(y)在线x==-y上")
    case let(x,y):
        print("\(x),\(y)不在对角线上")
    }
}

/*
 控制转移语句
 控制转移语句改变了代码的执行顺序。
 Swift 有五种控制转移语句：
 1.continue: 跳出当前循环，执行下一次循环
 2.break:直接跳出循环
 3.fallthrough:贯穿，switch语句中，匹配两个多个case
 4.return： 结束当前的代码块
 5.throw：抛出异常
 */

do {
    let a = 5
    switch a {
    case 0...5:
        print("aaaaa")
        fallthrough
    case 5:
        print("hahahaha")
    default:
        print("cccc")
    }
}

//检测 API 可用性
//Swift内置支持检查 API 可用性，这可以确保我们不会在当前部署机器上，不小心地使用了不可用的API。
/*
 我们在if或guard语句中使用可用性条件（availability condition)去有条件的执行一段代码，来在运行时判断调用的API是否可用。编译器使用从可用性条件语句中获取的信息去验证，在这个代码块中调用的 API 是否可用。
 */
do {
    /*
     以上可用性条件指定，if语句的代码块仅仅在 iOS 10 或 macOS 10.12 及更高版本才运行。最后一个参数，*，是必须的，用于指定在所有其它平台中，如果版本号高于你的设备指定的最低版本，if语句的代码块将会运行。
     */
    if #available(iOS 10, *){
        print("这是 ios10")
    } else {
        print("哈哈哈啊哈")
    }
}








