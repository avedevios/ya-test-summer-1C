//
//  main.swift
//  ya-test-summer-1C
//
//  Created by ake11a on 09.09.2022.
//

import Foundation

func Super(n: Int, arr: [Int]) -> (Int, Int) {
    var minCostDay = 0
    var bestBuyDay = 0
    var bestSellDay = 0
    
    for j in 1...n - 1 {
        if arr[bestSellDay] * arr[minCostDay] < arr[bestBuyDay] * arr[j] {
            bestBuyDay = minCostDay
            bestSellDay = j
        }
        if arr[j] < arr[minCostDay] {
            minCostDay = j
        }
    }
    if bestSellDay == 0 && bestBuyDay == 0 {
        return (0,0)
    } else {
        return (bestBuyDay + 1, bestSellDay + 1)
    }
}

let nString = readLine()!
let aString = readLine()!

let n = Int(nString)!

var arr = [Int]()
let a = aString.split(separator: " ")
for element in a {
    arr.append(Int(element)!)
}

let cash = 1000.0
var res = (0, 0)

if n > 1 {
    res = Super(n: n, arr: arr)
}

print (res.0)
print (res.1)
