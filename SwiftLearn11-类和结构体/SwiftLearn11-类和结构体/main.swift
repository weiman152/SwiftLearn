//
//  main.swift
//  SwiftLearn11-类和结构体
//
//  Created by iOS on 2018/5/7.
//  Copyright © 2018年 weiman. All rights reserved.
//

import Foundation

print("Hello, World!")

/*
 swift的类文件只有一个，不像OC中有.h和.m文件。那么如何区分一个方法或者属性是共有的还是私有的呢？在swift中，有多个属性和方法访问权限的关键字，public，private是常用的两种。
 */

/*
 swift中，类和结构体有许多的共同点：
 1.定义属性用于存储值；
 2.定义方法用于提供功能；
 3.定义下标操作使得可以通过下标语法来访问实例所包含的值；
 4.定义构造器用于生成初始化值；
 5.通过扩展以增加默认实现的功能；
 6.实现协议以提供某种标准功能。
 */


/*
 类比结构体多处的功能：
 1.继承允许一个类继承另一个类的特征；
 2.类型转换允许在一个运行时检查和解释一个类实例的类型；
 3.析构器允许一个类实例释放任何其所被分配的资源；
 4.引用计数允许对一个类的多次引用。
 */

// ⚠️⚠️⚠️注意： 结构体总是通过被复制的方式在代码中传递，不使用引用计数。

// 一、定义语法

// 类和结构体定义语法也很类似。

do {
    // 类
    class Person {
        
    }
    
    // 结构体
    struct Animal {
        
    }
    
    // 注意，名字要大写哟
    
}

class Car {
    var name: String = ""
    var size: CGSize?
    
    func run() {
        print("一辆 \(name), 在跑")
    }
}

struct VideoModel {
    var url: String?
    var name: String?
    var length: Float?
    // 初始化方法
    mutating func initModel(url: String, name: String, length: Float) {
        self.url = url
        self.name = name
        self.length = length
    }
}

extension VideoModel {
    
    func play() {
        print("播放呗")
    }
}

// 支持 == 比较符号
extension VideoModel: Equatable {
   
    static func == (left: VideoModel, right: VideoModel) -> Bool {
        return ( (left.url == right.url)&&(left.name == right.name)&&(left.length == right.length) )
    }
}

// 一般来说，在swift 中，model都是使用struct（结构体）定义。

// 二、 类和结构体的实例

do {
    
    let aodi = Car()
    aodi.name = "奥迪"
    
    var video = VideoModel()
    let v2 = video
    
    print("更改前： \(video == v2)" )
    
    video.name = "搞笑视频"
    
    print("更改后： \(video == v2)" )
    
    // 注意这里的不同：
    // aodi是类的实例，声明成常量，但是可以给它的属性进行赋值，因为它的属性是可变的类型；
    // video是结构体的实例，需要声明成变量，才可以对它属性进行赋值，尽管它的属性也是可变的，但是也必须声明成变量，结构体的实例才能进行属性赋值，不然会报错。
    
    // 为什么会这样呢？
    /*
     私以为，因为二者的数据类型不同，类是引用类型，结构体是值类型。对于值类型的结构体实例，一旦初始化了之后，内存空间已经确定了，值一旦发生改变，地址也会发生改变。但是，let修饰的常量是不允许地址发生改变的，所以不能对结构体类型的常量更改属性的值，即使属性是变量也不可以。而引用类型的类的实例，初始化之后，地址是不变的，更改它的属性，地址也不会发生改变，所以，是可以进行赋值的。
     */
    
    /*
     总结：
        如果声明一个值类型的常量，那么就意味着该常量是不可变的（无论内部数据为 var/let）。
        如果声明一个引用类型的常量，那么就意味着该常量的引用不能改变（即不能被同类型变量赋值），但指向的内存中所存储的变量是可以改变的。
     */
    
}

// 三、 结构体类型的成员逐一构造器

/*
 所有结构体都有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性。新实例中各个属性的初始值可以通过属性的名称传递到成员逐一构造器之中
 */

let myVideo = VideoModel(url: "http://..", name: "教育", length: 300)
print("   \(myVideo)")


// 四、 结构体和枚举都是值类型

//值类型被赋予给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。
/*
 实际上，在 Swift 中，所有的基本类型：整数（Integer）、浮点数（floating-point）、布尔值（Boolean）、字符串（string)、数组（array）和字典（dictionary），都是值类型，并且在底层都是以结构体的形式所实现。
 在 Swift 中，所有的结构体和枚举类型都是值类型。这意味着它们的实例，以及实例中所包含的任何值类型属性，在代码中传递的时候都会被复制。
 
 */

do {
    var video1 = VideoModel()
    let video2 = video1
    video1.url = "http://www.abc.mp4"
    print("---video1 = \(video1)")
    print("---video2 = \(video2)")
    
    /*
     打印结果：
     ---video1 = VideoModel(url: Optional("http://www.abc.mp4"), name: nil, length: nil)
     ---video2 = VideoModel(url: nil, name: nil, length: nil)
     */
    
    //我们发现，我们更改了video1的值，但是video2并没有改变。
}


//五、类是引用类型
/*
 与值类型不同，引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝。因此，引用的是已存在的实例本身而不是其拷贝。
 */

do {
    let car1 = Car()
    car1.name = "小老虎"
    car1.size = CGSize(width: 2.0, height: 4.5)
    
    let car2 = car1
    car2.name = "小熊猫"
    
    print("car1 = \(car1.name)")
    print("car2 = \(car2.name)")
    
    /*
     打印结果：
     car1 = 小熊猫
     car2 = 小熊猫
     */
    
    /*
     这里看到，car1和car2两个指针是指向同一个地址的，把car2的name改变之后，car1的name也改变了，因为他们访问的是同一个地址呢。
     */
}

// 六、恒等运算符

/*
 因为类是引用类型，有可能有多个常量和变量在幕后同时引用同一个类实例。（对于结构体和枚举来说，这并不成立。因为它们作为值类型，在被赋予到常量、变量或者传递到函数时，其值总是会被拷贝。）
 
 如果能够判定两个常量或者变量是否引用同一个类实例将会很有帮助。为了达到这个目的，Swift 内建了两个恒等运算符：
 
 等价于（===）
 不等价于（!==）
 
 运用这两个运算符检测两个常量或者变量是否引用同一个实例。
 */

do {
    let car1 = Car()
    car1.name = "AA"
    
    let car2 = car1
    car2.name = "BB"
    
    if car1 === car2 {
        print("恒等哎,地址一样")
    } else {
        print("不恒等")
    }
    
    //打印：恒等哎,地址一样
}


/*
 注意：
 “等价于”（用三个等号表示，===）与“等于”（用两个等号表示，==）的不同：
 
 “等价于”表示两个类类型（class type）的常量或者变量引用同一个类实例。
 “等于”表示两个实例的值“相等”或“相同”，判定时要遵照设计者定义的评判标准，因此相对于“相等”来说，这是一种更加合适的叫法。
 */


// 七、指针

/*
 如果你有 C，C++ 或者 Objective-C 语言的经验，那么你也许会知道这些语言使用指针来引用内存中的地址。一个引用某个引用类型实例的 Swift 常量或者变量，与 C 语言中的指针类似，但是并不直接指向某个内存地址，也不要求你使用星号（*）来表明你在创建一个引用。Swift 中的这些引用与其它的常量或变量的定义方式相同。
 */

//八 、类和结构体的选择（用类还是使用结构体）

/*
 按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：
 
 该数据结构的主要目的是用来封装少量相关简单数据值。
 有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用。
 该数据结构中储存的值类型属性，也应该被拷贝，而不是被引用。
 该数据结构不需要去继承另一个既有类型的属性或者行为。
 */

//九、字符串、数组、和字典类型的赋值与复制行为

/*
 Swift 中，许多基本类型，诸如String，Array和Dictionary类型均以结构体的形式实现。这意味着被赋值给新的常量或变量，或者被传入函数或方法中时，它们的值会被拷贝。
 Objective-C 中NSString，NSArray和NSDictionary类型均以类的形式实现，而并非结构体。它们在被赋值或者被传入函数或方法时，不会发生值拷贝，而是传递现有实例的引用。
 */

/*
 注意
 以上是对字符串、数组、字典的“拷贝”行为的描述。在你的代码中，拷贝行为看起来似乎总会发生。然而，Swift 在幕后只在绝对必要时才执行实际的拷贝。Swift 管理所有的值拷贝以确保性能最优化，所以你没必要去回避赋值来保证性能最优化。
 */












