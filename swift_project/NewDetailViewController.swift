//
//  NewDetailViewController.swift
//  swift_project
//
//  Created by lighter on 2015/6/6.
//  Copyright (c) 2015年 Lighter. All rights reserved.
//

import UIKit

class NewDetailViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let statusBarHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.height
        let navBarHeight             = self.navigationController?.navigationBar.frame.size.height

        println("statusBarHeight: \(statusBarHeight) navBarHeight: \(navBarHeight)")

        // view
        var x:CGFloat      = self.view.bounds.origin.x
        var y:CGFloat      = self.view.bounds.origin.y + statusBarHeight + CGFloat(navBarHeight!)
        var width:CGFloat  = self.view.bounds.width
        var height:CGFloat = self.view.bounds.height - statusBarHeight - CGFloat(navBarHeight!)
        var frame:CGRect   = CGRect(x: x, y: y, width: width, height: height)

        self.view.frame           = frame
        self.view.backgroundColor = UIColor.whiteColor()

        self.view.layoutSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let textField: UITextField = UITextField(frame: CGRectMake(40, 50, 200, 30))
        textField.borderStyle = UITextBorderStyle.RoundedRect
        textField.delegate = self

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        self.view.addGestureRecognizer(tap)

        self.view.addSubview(textField)
    }

    func DismissKeyboard() {
        self.view.endEditing(true)
    }

    // 設定delegate 為self後，可以自行增加delegate protocol
    // 開始進入編輯狀態
    func textFieldDidBeginEditing(textField: UITextField){
        println("textFieldDidBeginEditing:" + textField.text)
    }

    // 可能進入結束編輯狀態
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        println("textFieldShouldEndEditing:" + textField.text)

        return true
    }

    // 結束編輯狀態(意指完成輸入或離開焦點)
    func textFieldDidEndEditing(textField: UITextField) {
        println("textFieldDidEndEditing:" + textField.text)
    }

    // 按下Return後會反應的事件
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //利用此方式讓按下Return後會Toogle 鍵盤讓它消失
        textField.resignFirstResponder()
        println("按下Return")
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
