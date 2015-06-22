//
//  NewDetailViewController.swift
//  swift_project
//
//  Created by lighter on 2015/6/6.
//  Copyright (c) 2015年 Lighter. All rights reserved.
//

import UIKit
import CoreData

class NewDetailViewController: UIViewController, UITextFieldDelegate {
    var textField: UITextField!
    var statusBarHeight: CGFloat?
    var navBarHeight: CGFloat?

    lazy var managedContext:NSManagedObjectContext = {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.managedObjectContext!
    }()

    override func viewDidLayoutSubviews() {
        self.view.frame = CGRectMake(0, 0,
            CGRectGetWidth(UIScreen.mainScreen().bounds),
            CGRectGetHeight(UIScreen.mainScreen().bounds))
        self.view.backgroundColor = UIColor.whiteColor()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.statusBarHeight = CGFloat(UIApplication.sharedApplication().statusBarFrame.height)
        self.navBarHeight = CGFloat(self.navigationController!.navigationBar.frame.size.height)

        self.textField = UITextField(frame: CGRectMake(40, 50 + self.statusBarHeight! + self.navBarHeight!, 200, 30))
        textField.borderStyle = UITextBorderStyle.RoundedRect
        textField.delegate = self

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        self.view.addGestureRecognizer(tap)

        let addButton: UIButton = UIButton(frame: CGRectMake(40, 80, 200, 30))
        addButton.setTitle("新增", forState: .Normal)
        addButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        addButton.addTarget(self, action: "addNewData", forControlEvents: .TouchUpInside)

        self.view.addSubview(textField)
        self.view.addSubview(addButton)
    }

    func addNewData() {
        let entity = NSEntityDescription.entityForName("User", inManagedObjectContext: self.managedContext)

        let test = User(entity: entity!, insertIntoManagedObjectContext:self.managedContext)

        test.name = self.textField.text
        
        println(self.textField.text)

        managedContext.save(nil)

        self.navigationController?.popViewControllerAnimated(true)
    }

    func DismissKeyboard() {
        self.view.endEditing(true)
    }

    // 設定delegate 為self後，可以自行增加delegate protocol
    // 開始進入編輯狀態
    func textFieldDidBeginEditing(textField: UITextField){
        //println("textFieldDidBeginEditing:" + textField.text)
    }

    // 可能進入結束編輯狀態
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        //println("textFieldShouldEndEditing:" + textField.text)

        return true
    }

    // 結束編輯狀態(意指完成輸入或離開焦點)
    func textFieldDidEndEditing(textField: UITextField) {
        //println("textFieldDidEndEditing:" + textField.text)
    }

    // 按下Return後會反應的事件
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //利用此方式讓按下Return後會Toogle 鍵盤讓它消失
        textField.resignFirstResponder()
        //println("按下Return")
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
