//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// for-in 循环

for i in 1...9 {
    for j in 1...i {
        if j == i {
            print("\(i)*\(j) = \(i*j)")
        } else {
            let str = """
                      \(i)*\(j) = \(i*j) \
                       
                      """
            print(str)
        }
        
    }
}

print("-------------")
//如果不需要区间序列内的每一项的值，可以使用下划线_替代变量名
let base = 3
let power = 10
var answer = 1
//求3的10次幂
for _ in 1...power {
    answer *= base
    print(answer)
}

// 使用 stride(from:to:by:) 函数跳过不需要的标记。 循环梯度不一定都是1，也可以是任意值
let lessValue = 5
for tickMark in stride(from: 0, to: 60, by: lessValue) {
    print("每5分钟打印一次")
    print(tickMark)
}

//注意上面的打印，没有包含最后的60
//要想包含，需要使用另一个函数stride(from:through:by:)

for tickMark in stride(from: 0, through: 60, by: lessValue) {
    //这里包含了最后的60
    print(tickMark)
}

//while循环
//while循环会一直运行一段语句知道条件变成false。while循环适用于循环次数未知，但是条件知晓的情况下。
/*
 while的两种形式：
 while循环，每次循环开始之前判断条件；
 repeat-while循环：每次循环结束的时候判断条件。
 */

do {
    /*
    let final = 25
    var board = [Int](repeating: 0, count: 25)
    board[3] = 8
    board[6] = 11
    board[9] = 9
    board[10] = 2
    board[14] = -10
    board[19] = -11
    board[22] = -2
    board[24] = -8
    
    var square = 0
    var diceRoll = 0
    while square < final {
        //掷骰子
        diceRoll += 1
        if diceRoll == 7 {
            diceRoll = 1
        }
        //根据点数移动
        square += diceRoll
        if square < board[square] {
            //如果玩家还在棋盘上，顺着梯子爬上去或者顺着蛇滑下去
            square += board[square]
        }
        print("-------- \(square)")
    }
 */
    print("Game over")
}

// repeat-while 类似 do-while
do {
    var i = 0
    repeat {
        print("hahaahahh")
    }while i < 5
}
















