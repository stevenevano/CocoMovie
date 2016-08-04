//
//  newMovie.swift
//  Coco Movie
//
//  Created by Witchen on 6/9/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import UIKit
import CoreData
import Foundation

var moviesList = [NSManagedObject]()

class newMovie: UIViewController {

    
    @IBOutlet weak var movieDes: UITextView!
    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieDuration: UITextField!
    @IBOutlet weak var movieLanguage: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        movieDes.layer.borderWidth = 1
        movieDes.layer.borderColor = UIColor.lightGrayColor().CGColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveMovie(sender: AnyObject) {
        self.save(movieTitle.text!, language: movieLanguage.text!, duration: movieDuration.text!, desc: movieDes.text!)
        let msgAlert = UIAlertController(title: "Adding Status", message: "Add Movie Success", preferredStyle: UIAlertControllerStyle.Alert)
        msgAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            self.performSegueWithIdentifier("afterAddMovie", sender: self)
        }))
        self.presentViewController(msgAlert, animated: true, completion: nil)

    }
    
    func save(name: String, language : String, duration : String, desc : String){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Movies", inManagedObjectContext:managedContext)
        let movie = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        movie.setValue(name, forKey: "name")
        movie.setValue(language, forKey: "language")
        movie.setValue(duration, forKey: "duration")
        movie.setValue(desc, forKey: "movieDescription")
        do {
            try managedContext.save()
            moviesList.append(movie)
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func loadData(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movies")
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest); moviesList = results as! [NSManagedObject]
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
