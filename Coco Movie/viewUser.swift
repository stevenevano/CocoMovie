//
//  viewUser.swift
//  Coco Movie
//
//  Created by Witchen on 6/11/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class viewUser: UIViewController {
    var name = ""
    var nameArr = [String]()
    var usernameArr = [String]()
    var emailArr = [String]()
    var contactArr = [String]()
    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var contact: UITextField!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = name
        self.searchUser()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchUser(){
        self.loadData()
        var counter = 0
        for i in nameArr{
            if nameArr[counter] as String == userName.text {
                username.text = usernameArr[counter]
                emailtext.text = emailArr[counter]
                contact.text = contactArr[counter]
                break
            }
            counter++
        }
    }
    
    func loadData(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "User")
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest); moviesList = results as! [NSManagedObject]
            for i in  moviesList {
                let string1: NSString = i.valueForKey("fullName") as! NSString
                nameArr.append(string1 as String)
                let string2: NSString = i.valueForKey("username") as! NSString
                usernameArr.append(string2 as String)
                let string3: NSString = i.valueForKey("email") as! NSString
                emailArr.append(string3 as String)
                let string4: NSString = i.valueForKey("contact") as! NSString
                contactArr.append(string4 as String)
                
            }
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
