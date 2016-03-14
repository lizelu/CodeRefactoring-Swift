//
//  AddViewControllerBack0.swift
//  MovieShopDemo_20160224
//
//  Created by Mr.LuDashi on 16/3/1.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

import UIKit

class AddViewControllerBack0: UIViewController {
    
    //三个输入框对应的字段
    @IBOutlet var firstNumberTextField: UITextField!
    @IBOutlet var secondNumberTextField: UITextField!
    @IBOutlet var resultTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //获取第一个输入框的值
    func getFirstNumber() -> String {
        return firstNumberTextField.text!
    }
    
    //获取第二个输入框的值
    func getSecondNumber() -> String {
        return secondNumberTextField.text!
    }
    
    //加数与被加数中的值改变时会调用的方法
    @IBAction func textFieldChange(sender: AnyObject) {
        self.resultTextField.text = calculate(getFirstNumber(), second: getSecondNumber())
    }
    
    
    //计算两个数的值
    func calculate(first: String, second: String) -> String {
        return String(stringToInt(first) + stringToInt(second))
    }
    
    //将字符串安全的转变成整数的函数
    func stringToInt(str: String) -> Int {
        guard let result = Int(str) else {
            return 0
        }
        return result
    }
}
