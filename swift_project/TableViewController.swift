
//
//  TableViewController.swift
//  test
//
//  Created by lighter on 2015/5/23.
//  Copyright (c) 2015年 Lighter. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController, DetailViewControllerProtocol {
    let cellIdentifier = "Cell"
    var selectName:String = ""

    var userData = [NSManagedObject]()

    lazy var managedContext:NSManagedObjectContext = {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.managedObjectContext!
    }()

    override func viewWillAppear(animated: Bool) {
        let fetchRequest = NSFetchRequest(entityName:"User")
        var error:NSError?
        let fetchResults = self.managedContext.executeFetchRequest(fetchRequest, error: &error) as! [NSManagedObject]
        userData = fetchResults
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        var addBarButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "add_new_data")
        
        // register your class with cell identifier
        self.tableView.registerClass(Cell.self as AnyClass, forCellReuseIdentifier: self.cellIdentifier)

        navigationItem.rightBarButtonItem = addBarButton
    }

    func add_new_data()
    {
        let newDetailViewController: NewDetailViewController = NewDetailViewController()

        self.navigationController!.pushViewController(newDetailViewController, animated: true)
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userData.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as! Cell

        let name_data = self.userData[indexPath.row] as! User
        cell.textLabel!.text = name_data.name
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator // > mark

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow()
        let detailViewController: DetailViewController = DetailViewController()

        detailViewController.delegate = self
        detailViewController.delegate!.setTextLabel()

        let name_data = self.userData[indexPath!.row] as! User
        self.selectName = String(name_data.name)
        self.navigationController!.pushViewController(detailViewController, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setTextLabel() -> String{
        return self.selectName
    }
}
