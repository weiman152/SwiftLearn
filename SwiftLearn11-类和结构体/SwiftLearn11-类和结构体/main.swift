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

// 一般来说，在swift 中，model都是使用struct（结构体）定义。

// 二、 类和结构体的实例

do {
    
    let aodi = Car()
    aodi.name = "奥迪"
    
    var video = VideoModel()
    video.name = "搞笑视频"
    
    // 注意这里的不同：
    // aodi是类的实例，声明成常量，但是可以给它的属性进行赋值，因为它的属性是可变的类型；
    // video是结构体的实例，需要声明成变量，才可以对它属性进行赋值，尽管它的属性也是可变的，但是也必须声明成变量，结构体的实例才能进行属性赋值，不然会报错。
    
}

// 三、 结构体类型的成员逐一构造器

/*
 所有结构体都有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性。新实例中各个属性的初始值可以通过属性的名称传递到成员逐一构造器之中
 */

let myVideo = VideoModel(url: "http://..", name: "教育", length: 300)
print("   \(myVideo)")



















