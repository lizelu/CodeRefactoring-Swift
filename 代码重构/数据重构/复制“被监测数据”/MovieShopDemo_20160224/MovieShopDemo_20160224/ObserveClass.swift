//
//  ObserveClass.swift
//  MovieShopDemo_20160224
//
//  Created by Mr.LuDashi on 16/3/1.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

import Foundation

class Calculate {
    //存储属性
    private var firstNumber: String
    private var secondNumber: String
    //计算属性
    var resultNumber: String {
        get {
            return calculate(firstNumber, second: secondNumber)
        }
    }
    //构造函数
    init() {
        self.firstNumber = "0"
        self.secondNumber = "0"
    }
    //设置方法
    func setFirstNumber(firstNumber: String) {
        self.firstNumber = firstNumber
    }
    
    func setSecondNumber(secondNumber: String) {
        self.secondNumber = secondNumber
    }

    
    //业务逻辑的代码，与UI无关的东西，可以进行提取
    private func calculate(first: String, second: String) -> String {
        return String(stringToInt(first) + stringToInt(second))
    }
    
    private func stringToInt(str: String) -> Int {
        guard let result = Int(str) else {
            return 0
        }
        return result
    }

}