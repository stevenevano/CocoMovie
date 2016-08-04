//
//  ViewMovie.swift
//  Coco Movie
//
//  Created by Witchen on 6/11/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class ViewMovie: UIViewController {
    var movieNameView: String = ""
    var movieNameArr = [String]()
    var movieLanguageArr = [String]()
    var movieDurationArr = [String]()
    var movieDescArr = [String]()
    @IBOutlet weak var descView: UITextView!
    @IBOutlet weak var durationView: UITextField!
    @IBOutlet weak var languageView: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        descView.layer.borderWidth = 1
        descView.layer.borderColor = UIColor.lightGrayColor().CGColor
        titleLabel.text = movieNameView
        self.searchMovie()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchMovie(){
        self.loadData()
        var counter = 0
        for i in movieNameArr{
            if movieNameArr[counter] as String == titleLabel.text {
                languageView.text = movieLanguageArr[counter]
                durationView.text = movieDurationArr[counter]
                descView.text = movieDescArr[counter]
                break
            }
            counter++
        }
    }
    
    func loadData(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movies")
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest); moviesList = results as! [NSManagedObject]
            for i in  moviesList {
                let string1: NSString = i.valueForKey("name") as! NSString
                movieNameArr.append(string1 as String)
                let string2: NSString = i.valueForKey("language") as! NSString
                movieLanguageArr.append(string2 as String)
                let string3: NSString = i.valueForKey("duration") as! NSString
                movieDurationArr.append(string3 as String)
                let string4: NSString = i.valueForKey("movieDescription") as! NSString
                movieDescArr.append(string4 as String)
                
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
