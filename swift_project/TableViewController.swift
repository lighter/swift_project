
//
//  TableViewController.swift
//  test
//
//  Created by lighter on 2015/5/23.
//  Copyright (c) 2015年 Lighter. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, DetailViewControllerProtocol {
    let cellIdentifier = "Cell"
    var tableData = [String]()
    var selectIndex:String = ""

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
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as! Cell

        cell.textLabel!.text = self.tableData[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator // > mark

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow()
        let detailViewController: DetailViewController = DetailViewController()

        detailViewController.delegate = self
        detailViewController.delegate!.setTextLabel()

        self.selectIndex = String(indexPath!.row)
        self.navigationController!.pushViewController(detailViewController, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setTextLabel() -> String{
        return self.selectIndex
    }
}
