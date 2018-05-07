//
//  main.swift
//  SwiftLearn10-枚举
//
//  Created by iOS on 2018/5/3.
//  Copyright © 2018年 weiman. All rights reserved.
//

import Foundation

print("Hello, World!")

/*
 枚举定义：
 枚举为一组相关的值定义了一个共同类型，使得你可以在代码中以类型安全的方式使用这些值。
 */

/*
 swift中，枚举有多么强大呢？
 1.枚举成员的值类型更加灵活，不必一定是整型，还可以是字符串，字符，浮点型等
 2.在swift中，枚举类型是 一等类型（first-class），他具有很多类才具有的功能。比如：
    A.计算属性，用于提供枚举值的附加信息；
    B.实例方法，用于提供和枚举值相关联的功能；
    C.遵循协议，提供标准的功能。
 
 */

// 一、枚举语法

// 简单声明
enum Week {
    case Monday
    case Tuesday
}

/*
 注意：
 1. 声明枚举要像声明类一样，首字母大写；虽然不大写，编译也不会报错，但是大写会规范一些。
 2. 每一个case后面没有逗号。
 */

// 指南针的四个方向，可以声明成枚举类型
enum CompassPoint {
    case north
    case south
    case east
    case west
}
/*
注意
与 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。在上面的CompassPoint例子中，north，south，east和west不会被隐式地赋值为0，1，2和3。相反，这些枚举成员本身就是完备的值，这些值的类型是已经明确定义好的CompassPoint类型。
*/

// 多个成员值出现在同一行的时候，可以用逗号隔开。
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

// 二、 访问枚举

var directionToHead: CompassPoint = .north
var directionToHead2 = CompassPoint.north

// directionToHead 是CompassPoint类型的变量，初始值是north;以上两种写法都是正确的。
//更改枚举变量的值
directionToHead = .east

// 三、与Switch匹配使用

/*
 一般枚举类型都是成员变量比较多的，需要判断每种情况下做出相应的处理，这时候，一般使用switch，更加的条例清晰。
 */

directionToHead = .south

switch directionToHead {
case .north:
    print("北方")
case .south:
    print("南方")
case .east:
    print("东方")
case .west:
    print("西方")
    
}

/*
 四、枚举关联值
 */

enum Barcode {
    case upc(Int,Int,Int,Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51126, 3)
// 现在，productBarcode这个变量是Barcode类型的，值为upc，关联值为元组(8, 85909, 51126, 3)

// 改变值
productBarcode = .qrCode("BBBJKKHGGUYJLI")

print("---- \(productBarcode)")

// 提取关联值
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let string):
    print("QR: \(string)")
}


// 五、原始值
/*
 在关联值小节的条形码例子中，演示了如何声明存储不同类型关联值的枚举成员。作为关联值的替代选择，枚举成员可以被默认值（称为原始值）预填充，这些原始值的类型必须相同。
 */

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

//枚举类型ASCIIControlCharacter的原始值类型被定义为Character，并设置了一些比较常见的 ASCII 控制字符

//六、原始值的隐式赋值

/*
 在使用原始值为整数或者字符串类型的枚举时，不需要显式地为每一个枚举成员设置原始值，Swift 将会自动为你赋值。
 */

enum PlanetNew: Int {
    case mercury = 1,  venus, earth, mars, jupiter, saturn, uranus, neptune
}

let p = PlanetNew.venus
print("p = \(p)")
print("p = \(p.rawValue)")
/*
 打印结果：
 p = venus
 p = 2
 */

// 使用原始值初始化枚举实例

let possiblePlanet = PlanetNew(rawValue: 7)
print("possiblePlanet = \(possiblePlanet!)")
// 打印结果：possiblePlanet = uranus
/*
 注意： possiblePlanet是一个可选值，为什么呢？因为possiblePlanet使用数字进行初始化，但是并不是每一个数字都会都对应的枚举值，也就是说这个possiblePlanet可能是初始化失败的，可能没有值，所以是可选的。
 */

// 七、递归枚举

/*
 递归枚举是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。使用递归枚举时，编译器会插入一个间接层。你可以在枚举成员前加上indirect来表示该成员可递归。
 */
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression,
        ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

//你也可以在枚举类型开头加上indirect关键字来表明它的所有成员都是可递归的

do {
    
    indirect enum ArithmeticExpression {
        case number(Int)
        case addition(ArithmeticExpression, ArithmeticExpression)
        case multiplication(ArithmeticExpression, ArithmeticExpression)
    }
    
    // (5+4) * 2
    
    let five = ArithmeticExpression.number(5)
    let four = ArithmeticExpression.number(4)
    let sum = ArithmeticExpression.addition(five, four)
    let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
    print("--- \(product)")
}


















