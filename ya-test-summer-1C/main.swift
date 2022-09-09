//
//  main.swift
//  ya-test-summer-1C
//
//  Created by ake11a on 09.09.2022.
//

import Foundation

var n = 6
var arr = [10, 3, 5, 3, 11, 9]
//n = 4
//arr = [5,5,5,5]
//n = 2
//arr = [5,-10]

//let nString = readLine()!
//let aString = readLine()!
//
//let n = Int(nString)!
//
//var arr = [Int]()
//let a = aString.split(separator: " ")
//for element in a {
//    arr.append(Int(element)!)
//}
let cash = 1000.0
var res = (0, 0)

func Slow(n: Int, arr: [Int]) -> (Int, Int) {
    var max = 0.0
    var ans = (0,0)
    var gasVolume = 0.0
    for i in 0...n - 2 {
        gasVolume = cash / Double(arr[i])
        for j in i + 1...n - 1 {
            if max < gasVolume * Double(arr[j]) - cash {
                max = gasVolume * Double(arr[j]) - cash
                ans = (i + 1, j + 1)
            }
        }
    }
    return ans
}

func Fast(n: Int, arr: [Int]) -> (Int, Int) {
    var iMin = 0
    var gasVolume = cash / Double(arr[0])
    var max = 0.0
    var ans = (0,0)
    
    for j in 1...n - 1 {
        let price = Double(arr[j])
        if max < gasVolume * price - cash {
            max = gasVolume * price - cash
            ans = (iMin + 1, j + 1)
        }
        if gasVolume < cash / price {
            iMin = j
            gasVolume = cash / price
        }
    }
    return ans
}

if n > 1 {
    res = Fast(n: n, arr: arr)
}

print (res.0)
print (res.1)
