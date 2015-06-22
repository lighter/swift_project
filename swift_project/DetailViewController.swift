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

    override func viewDidLoad() {
        super.viewDidLoad()

        let navBarHeight = self.navigationController!.navigationBar.frame.size.height
        let statusBarHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.height

        // textLabel
        self.textLabel       = UILabel(frame: CGRectMake(10, 50 + navBarHeight + statusBarHeight, 200, 100))
        self.textLabel!.text = self.delegate!.setTextLabel()

        self.view.addSubview(self.textLabel!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}