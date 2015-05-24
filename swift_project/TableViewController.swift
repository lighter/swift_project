
//
//  TableViewController.swift
//  test
//
//  Created by lighter on 2015/5/23.
//  Copyright (c) 2015年 Lighter. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    let cellIdentifier = "Cell"
    var tableData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // register your class with cell identifier
        self.tableView.registerClass(Cell.self as AnyClass, forCellReuseIdentifier: self.cellIdentifier)

        // create sample data
        for index in 0...100 {
            self.tableData.append("Item \(index)")
        }
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as! UITableViewCell

        (cell as! Cell).indexLabel.text = self.tableData[indexPath.row]

        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
