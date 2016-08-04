//
//  ViewController.swift
//  Coco Movie
//
//  Created by Witchen on 6/9/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class ViewController: UIViewController {
    
    var usernameArr = [String]()
    var passwordArr = [String]()
    var counter = 0
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    var user = [NSManagedObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.loadData()
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Loginbutton(sender: AnyObject) {
        loadData()
        var check = true
        var msg = ""
        if (username.text == "admin" || username.text == "Admin" && password.text == "admin" || password.text == "Admin"){
            self.performSegueWithIdentifier("loginAdminSegue", sender: self)
            print("adminlogin")
        } else {
            print("userlogin")
            for i in usernameArr{
                if usernameArr[counter] as String == username.text && passwordArr[counter] == password.text {
                    check = true
                    break
                } else {
                    check = false
                }
                counter++
            }
            if check == true {
                msg = "Login Success"
                let msgAlert = UIAlertController(title: "Login Status", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
                msgAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
                    self.performSegueWithIdentifier("loginSegue", sender: self)
                }))
                self.presentViewController(msgAlert, animated: true, completion: nil)
            } else {
                msg = "Login Failed"
                let msgAlert = UIAlertController(title: "Login Status", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
                msgAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
                    self.username.text = ""
                    self.password.text = ""
                }))
                self.presentViewController(msgAlert, animated: true, completion: nil)
            }
            
            
        }
        

    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue == "loginSegue" {
            let x: movieListUser = segue.destinationViewController as! movieListUser
        } else if segue == "loginAdminSegue" {
            let y: movieList = segue.destinationViewController as! movieList
        }
    }
    
    func loadData(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "User")
        do {
        let results = try managedContext.executeFetchRequest(fetchRequest); userList = results as! [NSManagedObject]
        for i in userList {
            let string1: NSString = i.valueForKey("username") as! NSString
            usernameArr.append(string1 as String)
            let string2: NSString = i.valueForKey("password") as! NSString
            passwordArr.append(string2 as String)
            }
    } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)") }
    }

}

