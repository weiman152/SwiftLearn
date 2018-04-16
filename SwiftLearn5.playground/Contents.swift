//: Playground - noun: a place where people can play

import UIKit

//控制流

//1.for-in

//遍历数组
let names = ["小黄","小蓝","小红","小绿"]
for name in names {
    print(name)
}

//遍历字典
let students: [String:Any] = ["name" : "小明",
                              "age" : 15,
                              "location" : "北京 朝阳",
                              "grade" : "初三"]
for (key,value) in students {
    print("\(key) : \(value)")
}

//遍历范围
//for i in 1...9 {
//    for j in 1...i {
//        print("\(i)*\(j) = \(i*j)")
//    }
//}

/*
 
 */










