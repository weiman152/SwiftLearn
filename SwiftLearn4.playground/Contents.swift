//: Playground - noun: a place where people can play

import UIKit

//基本运算符
/*
 分类：一元、二元、三元
 
 一元： -（负），！a(非)，a!(强制解包) ，a?(可选值)
 
 */

//swift提供了恒等于（===）和不恒等（！==）这两个运算符来判断两个对象是否引用自同一个对象

//元组也是可以比较的，比较规则是，两个元组的元素相同，且长度相同，按照从左到右逐值进行比较，知道发现两个值不相等的时候停止。如果所有的值都相等，那么这一对元组就是相等的。

(1, "zebra") < (1, "apple")
(1,2,3) > (1,3,1)
(99,1) > (1,99)

//注意⚠️：
//1.存有布尔值的元组不能被比较
//2.swift标准库只能比较七个以内的元素的元组比较函数，如果元组内的元素超过七个，要比较的话需要自己实现比较函数。

//三目运算符：略

//空合运算符 ??
/*
 空合运算符（a??b）对可选类型a进行空判断，如果a包含一个值就进行解封，否则返回默认值b。条件是，a必须是一个可选值类型。默认值b的类型必须要和a存储的值类型一致。
 */

//空合运算符是对以下代码的简短表达方法：
do {
    let a: String? = "aaa"
    let b = "aa"
    a != nil ? a! : b
}

//区间运算符
//闭区间运算符 a...b [a,b]
for index in 1...5 {
    print(index)
    print("叫你一声你敢答应吗")
}

//半开区间  a..<b [a,b)

for index in 1..<5 {
    print(index)
    print("敢")
}

//单侧区间
//闭区间操作符可以表达往一侧无限延伸
let names: [String] = ["小明","小航","小李","小单","小哈"]
for name in names[1...] {
    print(name)
}

print("-------------------------------")
for name in names[...3] {
    print(name)
}

let range = ...5

range.contains(2)
range.contains(5)
range.contains(-2)

// 2.3 字符和字符串

do {
    let str = "这是一串字符"
}

//多行字符串
do {
    let str = """
            春眠不觉晓，
            处处闻啼鸟。
            夜来风雨声，
            花落知多少。
            """
    print(str)
}

//文字很多，使用多行字符串，又不想换行,你可以用在行尾写一个反斜杠(\)作为续行符
do {
    let str = """
            春眠不觉晓，\
            处处闻啼鸟。\
            夜来风雨声，\
            花落知多少。
            """
    print(str)
}

//字符串字面量的特殊字符
//转义字符\0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)。

//判断字符串是否为空
do {
    let str = ""
    let str2 = String()
    if str.isEmpty {
        print("str 空字符串")
    }
    if str2.isEmpty {
        print("str2 空字符串")
    }
}

//字符串可变性
//如果字符串是一个常量，那就是不可变的。如果是一个变量，那就是可变的.这与OC是不一样的地方

do {
    var name = "电脑"
    var nickName = name + "加啊哈哈"
    print(nickName)
}

//字符串是 值类型，这与OC也是不一样的，OC中字符串是作为对象存在的，是引用类型
//Swift 默认字符串拷贝的方式保证了在函数/方法中传递的是字符串的值。 很明显无论该值来自于哪里，都是您独自拥有的。 您可以确信传递的字符串不会被修改，除非你自己去修改它。

do {
    var str1 = "我是一个字符串"
    var str2 = "沙河撒花撒花"
    var str3 = str1
    str3 = "求索"
    print(str1)
    print(str3)
    
    var arr1 = [1,2,3]
    var arr2 = arr1
    arr2 = [2,2,2]
    print(arr1)
}

//获取字符串的每一个字符
//字符串可以直接遍历
for character in "Dog!🐩🐶汪汪" {
    print(character)
}

//字符串可以通过传递一个值类型为Character的数组作为自变量来初始化
do {
    let chars: [Character] = ["I","a","c"]
    let strChars = String(chars)
    print(strChars)
}

//插入
do {
    let p = 3
    let message = "\(p) 次闹铃响了 * & 7"
}

//特殊字符
let eAcute: Character = "\u{E9}"
print(eAcute)
let combinedEAcute: Character = "\u{65}\u{301}"
print(combinedEAcute)
do {
    let a: Character = "\u{61}"
    print(a)
    let b: Character = "\u{A4}"
    print(b)
}
//韩语字符
do {
    let precomposed: Character = "\u{D55C}"
    print(precomposed)
    let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
    print(decomposed)
}

//字符长度
do {
    let a = "I am a good worker,and you? ☺"
    print(a.count)
}

//修改字符串
//你可以通过字符串的属性和方法来访问和修改它，当然也可以用下标语法完成。

//1.字符串索引
/*
 前面提到，不同的字符可能会占用不同数量的内存空间，所以要知道Character的确定位置，就必须从String开头遍历每一个 Unicode 标量直到结尾。因此，Swift 的字符串不能用整数(integer)做索引。
 使用startIndex属性可以获取一个String的第一个Character的索引。使用endIndex属性可以获取最后一个Character的后一个位置的索引。因此，endIndex属性不能作为一个字符串的有效下标。如果String是空串，startIndex和endIndex是相等的。
 */

let greeting = "bei jing"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 4)
greeting[index]

//从字面上看，字符串通过索引取字符的行为是把字符串当做数组处理的。
//如果索引超过了边界，也会引发错误

//使用 indices 属性会创建一个包含全部索引的范围(Range)，用来在一个字符串中访问单个字符。
for index in greeting.indices {
    //terminator  变成一行
    print("\(greeting[index])", terminator: "")
}

//插入和删除
do {
    var welcome = "hello"
    welcome.insert("!", at: welcome.endIndex)
    print(welcome)
    welcome.insert(contentsOf: "three", at: welcome.index(before: welcome.endIndex))
    print(welcome)
    //删除
    welcome.remove(at: welcome.index(before: welcome.endIndex))
    print(welcome)
    
}

//子字符串
do {
    let greeting = "hello, world"
    let index = greeting.index(of: ",") ?? greeting.endIndex
    var beginning = greeting[..<index]
    beginning.append(contentsOf: "123")
    print(greeting)

    // 把结果转化为 String 以便长期存储。
    let newStr = String(beginning)
    print(newStr)
}

/*
 注意：
而 String 和 SubString 的区别在于性能优化上，SubString 可以重用原 String 的内存空间，或者另一个 SubString 的内存空间（String 也有同样的优化，但如果两个 String 共享内存的话，它们就会相等）。这一优化意味着你在修改 String 和 SubString 之前都不需要消耗性能去复制内存。就像前面说的那样，SubString 不适合长期存储 —— 因为它重用了原  String 的内存空间，原 String 的内存空间必须保留直到它的 SubString 不再被使用为止。
 */

//比较字符串

do {
    let a = "abc"
    let b = "abc"
    if a == b {
        print("相等")
    } else {
        print("不相等")
    }
}

//hasPrefix(_:)和hasSuffix(_:)方法都是在每个字符串中逐字符比较其可扩展的字符群集是否标准相等

print("----------------集合--------------------")
//集合类型

//数组，字典，集合都是集合类型
/*
 数组：有序的数据集合
 字典：无序的键值对集合
 集合：无序无重复的数据集合
 */

//空数组
//存储整型的空数组
var someInts = [Int]()
//添加值
someInts.append(3)
//带有默认值的数组
var threeDoubles = Array(repeating: 0.0, count: 3)
print(threeDoubles)
//合并相同类型的数组
do {
    let a = Array(repeating: 2.5, count: 3)
    let b = [3.0,4.0,6.0,7.0]
    let c = a + b
    print(c)
}
//访问和修改数组

//获取数组的个数
do {
    let b = [3.0,4.0,6.0,7.0]
    print(b.count)
}

//检查count是否为0，也就是是否是空数组
do {
    let a = Array(repeating: 2.5, count: 3)
    if a.isEmpty {
        print("空数组")
    } else {
        print("非空数组")
    }
}



extension Array {
    
    public var first2: Element? {
        return isEmpty ? nil : self[0]
    }
    
    func filter2(_ matching: (Element) -> Bool) -> [Element]? {
//        var result: [Element] = []
//        for e in self where matching(e) {
//            result.append(e)
//        }
        return reduce([], { matching($1) ? [$1] : $0 })
    }
    
    func count(where w: (Element) -> Bool) -> Int {
        var c = 0
        for e in self where w(e) {
            c += 1
        }
        return c
    }
    
}

var arr: [String] = []
//添加元素
do {
    //在最后添加一个元素
    arr.append("你好")
    arr.append("坚果")
    //添加一个或多个元素
    arr = arr + ["吃饭了吗？"]
    arr += ["小兰","小黄","小美"]
    print(arr)
    print(arr.filter2({ $0 == "小黄" }))
    
    for str in arr {
        if str == "小黄" {
            print(str)
        }
    }
    
    
}

//获取元素
do {
    let first = arr.first
    print(first)
    let f = arr[0]
    print(f)
}

//修改元素
do {
    arr[4...5] =  ["qq","wechat","搜狗"]
    print(arr)
    
    arr.insert("豆豆", at: 4)
    print(arr)
    
}

//注意:不可以用下标访问的形式去在数组尾部添加新项。

//数组遍历
for item in arr {
    print(item)
}

//如果同时需要值和索引值，可以使用元组
//enumerated()返回一个由每一个数据项索引值和数据值组成的元组
for (index,value) in arr.enumerated() {
    print("\(index): \(value)")
}

//集合 set
//创建集合
var letters = Set<Character>()
print(letters)
letters.insert("a")
print(letters)

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
print(favoriteGenres)

//集合的访问、插入、删除等操作与数组相似，这里不再单独列出

//集合的排序功能
//集合本来是无序的，要想获得一个有序的集合，swift提供了很方便的API

print(favoriteGenres.sorted())


//基本集合操作 交集、并集、差集。。。
/*
 使用intersection(_:)方法根据两个集合中都包含的值创建的一个新的集合。
 使用symmetricDifference(_:)方法根据在一个集合中但不在两个集合中的值创建一个新的集合。
 使用union(_:)方法根据两个集合的值创建一个新的集合。
 使用subtracting(_:)方法根据不在该集合中的值创建一个新的集合。
 */

do {
    var a: Set = [1,3,5,7,9]
    var b: Set = [0,2,4,6,8,10]
    var c: Set = [2,3,5,7]
    //a,b的并集
    print(a.union(b).sorted())
    //a,c的交集
    print(a.intersection(c))
    //在a中不再c中的集合
    print(a.subtracting(c))
    //除了a,c交集之外的元素的集合
    print(a.symmetricDifference(c).sorted())
}

//集合成员关系和相等
/*
 使用“是否相等”运算符(==)来判断两个集合是否包含全部相同的值。
 使用isSubset(of:)方法来判断一个集合中的值是否也被包含在另外一个集合中。
 使用isSuperset(of:)方法来判断一个集合中包含另一个集合中所有的值。
 使用isStrictSubset(of:)或者isStrictSuperset(of:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
 使用isDisjoint(with:)方法来判断两个集合是否不含有相同的值(是否没有交集)。
 */

do {
    let houseAnimals: Set = ["🐶", "🐱"]
    let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
    let cityAnimals: Set = ["🐦", "🐭"]
    //是否是子集
    print(houseAnimals.isSubset(of: farmAnimals))
    //是否是父集合
    print(farmAnimals.isSuperset(of: houseAnimals))
    //是否没有交集
    print(farmAnimals.isDisjoint(with: cityAnimals))//没有交集 true
    print(houseAnimals.isDisjoint(with: cityAnimals))//没有交集 true
    print(houseAnimals.isDisjoint(with: farmAnimals))
    
}


//字典
/*
 注意：
 一个字典的Key类型必须遵循Hashable协议，就像Set的值类型。
 */

//创建字典
do {
    var foods: [String : String] = [:]
    foods["name"] = "苹果"
    
    var books = ["name": "数学",
                 "price": "￥60",
                 "number": "200"]
    print(books)
}

//访问和修改字典
do {
    var books = ["name": "数学",
                 "price": "￥60",
                 "number": "200"]
    print("数学书的价格是 : \(books["price"]!)")
    
    //字典的元素数量
    print("数量是: \(books.count)")
    //判断是否是空字典
    if books.isEmpty {
        print("空字典啊")
    } else {
        print("不空")
    }
    
    //修改字典
    books["number"] = "260"
    print(books)
    
    print(books.first)
    print(books.removeValue(forKey: "number"))
    print(books)
    //取一个不存在的key，居然不报错
    print(books["number"])
    
    books["publish"] = "清华出版社"
    print(books)
    if let oldValue = books.updateValue("￥55", forKey: "price") {
        print("原来价格是 \(oldValue)")
    }
    print(books)
    
    //删除
    books["publish"] = nil
    print(books)
    
}

//字典遍历

do {
    let foods = ["name" : "苹果",
                 "price": "￥3.3",
                 "type" : "红富士",
                 "place": "河北"]
    for (key, value) in foods {
        print("\(key): \(value)")
    }
    
    //单独遍历key或者value
    for key in foods.keys {
        print(key)
    }

    for value in foods.values {
        print(value)
    }
}









