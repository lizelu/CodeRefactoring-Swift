//
//  AddViewController.swift
//  MovieShopDemo_20160224
//
//  Created by Mr.LuDashi on 16/3/1.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var firstNumberTextField: UITextField!
    @IBOutlet var secondNumberTextField: UITextField!
    @IBOutlet var resultTextField: UITextField!
    
    lazy var calculate: Calculate = Calculate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getFirstNumber() -> String {
        return self.firstNumberTextField.text!
    }
    
    func getSecondNumber() -> String {
        return self.secondNumberTextField.text!
    }
    
    @IBAction func textFieldChange(sender: AnyObject) {
        
        calculate.setFirstNumber(firstNumberTextField.text!)
        calculate.setSecondNumber(secondNumberTextField.text!)
        
        self.resultTextField.text = calculate.resultNumber
        
    }
}
