//
//  UserList.swift
//  Coco Movie
//
//  Created by Witchen on 6/9/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class UserList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var userName = ""
    @IBOutlet weak var userTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        userTable.dataSource = self
        userTable.delegate = self
        userTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell",forIndexPath: indexPath)
        let userdata = userList[indexPath.row]
        cell.textLabel?.text = userdata.valueForKey("fullName")?.description
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = self.userTable.cellForRowAtIndexPath(indexPath)! as UITableViewCell
        userName = cell.textLabel!.text!
        self.performSegueWithIdentifier("viewUserSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "viewUserSegue" {
            let x: viewUser = segue.destinationViewController as! viewUser
            x.name = userName
        }
    }
    
    func loadData(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "User")
        do {
        let results = try managedContext.executeFetchRequest(fetchRequest); userList = results as! [NSManagedObject]
    } catch let error as NSError {
        print("Could not fetch \(error), \(error.userInfo)") }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
