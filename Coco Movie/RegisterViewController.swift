//
//  RegisterViewViewController.swift
//  Coco Movie
//
//  Created by Witchen on 6/9/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import UIKit
import CoreData
import Foundation

var userList = [NSManagedObject]()

class RegisterViewViewController: UIViewController {
    var check = true
    @IBOutlet weak var contacttxt: UITextField!
    @IBOutlet weak var emailtxt: UITextField!
    @IBOutlet weak var fullnametxt: UITextField!
    @IBOutlet weak var usernametxt: UITextField!
    @IBOutlet weak var passwordtxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Registerbtn(sender: AnyObject) {
        let message = validate(fullnametxt.text!, username: usernametxt.text!, email: emailtxt.text!, contact: contacttxt.text!)
        if check == true {
        self.save(fullnametxt.text!, username: usernametxt.text!, password: passwordtxt.text!, email: emailtxt.text!, contact: contacttxt.text!)
        let msgAlert = UIAlertController(title: "Register Status", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        msgAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            self.performSegueWithIdentifier("afterRegisterSegue", sender: self)
        }))
        self.presentViewController(msgAlert, animated: true, completion: nil)
        } else {
            let msgAlert = UIAlertController(title: "Register Status", message: message, preferredStyle: UIAlertControllerStyle.Alert)
            msgAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
                self.fullnametxt.text = ""
                self.usernametxt.text = ""
                self.passwordtxt.text = ""
                self.emailtxt.text = ""
                self.contacttxt.text = ""
            }))
            self.presentViewController(msgAlert, animated: true, completion: nil)
        }
    }

    func save(fullname: String,username: String, password : String, email: String, contact: String){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("User", inManagedObjectContext:managedContext)
        let user = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        user.setValue(fullname, forKey: "fullName")
        user.setValue(password, forKey: "password")
        user.setValue(username, forKey: "username")
        user.setValue(email, forKey: "email")
        user.setValue(contact, forKey: "contact")
        do {
            try managedContext.save()
            userList.append(user)
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
    func validate(name: String, username: String, email: String, contact: String) -> String{
        var msg = ""
        let nameValidation = NSPredicate(format: "SELF MATCHES %@", "[a-zA-Z]{4,30}")
        let usernameValidation = NSPredicate(format: "SELF MATCHES %@", "[a-zA-Z]{4,15}")
        let emailValidation = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}")
        let contactValidation = NSPredicate(format: "SELF MATCHES %@", "[0-9][0-9 -]{8,14}")
        if nameValidation.evaluateWithObject(name) {
            msg = "OK"
            check = true
        } else {
            msg = "Name must only contain words, at least 4 words to 30 words"
            check = false
        }
        if usernameValidation.evaluateWithObject(username){
            msg = "OK"
            check = true
        } else {
            msg = "Name must only contain words, at least 4 words to 15 words"
            check = false
        }
        if emailValidation.evaluateWithObject(email){
            msg = "OK"
            check = true
        } else {
            msg = "E-mail is invalid"
            check = false
        }
        if contactValidation.evaluateWithObject(contact){
            msg = "OK"
            check = true
        } else {
            msg = "Contact number must only contain at least 8 number, can also use (-) or (+) sign"
            check = false
        }
        return msg
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

    // In a storyboard-based pplication, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
