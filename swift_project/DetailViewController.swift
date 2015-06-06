//
//  DetailViewController.swift
//  swift_project
//
//  Created by lighter on 2015/5/25.
//  Copyright (c) 2015年 Lighter. All rights reserved.
//

import UIKit

protocol DetailViewControllerProtocol {
    func setTextLabel() -> String
}

class DetailViewController: UIViewController {
    var delegate: DetailViewControllerProtocol?
    var textLabel: UILabel?

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let statusBarHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.height
        let navBarHeight             = self.navigationController?.navigationBar.frame.size.height

        // view
        var x:CGFloat      = self.view.bounds.origin.x
        var y:CGFloat      = self.view.bounds.origin.y + statusBarHeight + CGFloat(navBarHeight!)
        var width:CGFloat  = self.view.bounds.width;
        var height:CGFloat = self.view.bounds.height - statusBarHeight - CGFloat(navBarHeight!)
        var frame:CGRect   = CGRect(x: x, y: y, width: width, height: height)

        self.view.frame           = frame
        self.view.backgroundColor = UIColor.whiteColor()

        self.view.layoutSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // textLabel
        self.textLabel       = UILabel(frame: CGRectMake(10, 50, 200, 100))
        self.textLabel!.text = self.delegate!.setTextLabel()

        self.view.addSubview(self.textLabel!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}