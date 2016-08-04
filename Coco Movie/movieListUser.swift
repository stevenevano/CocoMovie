//
//  movieListUser.swift
//  Coco Movie
//
//  Created by Witchen on 6/11/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class movieListUser: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var movieName = ""
    @IBOutlet weak var movieUserTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        movieUserTable.dataSource = self
        movieUserTable.delegate = self
        movieUserTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell",forIndexPath: indexPath)
        let moviedata = moviesList[indexPath.row]
        cell.textLabel?.text = moviedata.valueForKey("name")?.description
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = self.movieUserTable.cellForRowAtIndexPath(indexPath)! as UITableViewCell
        movieName = cell.textLabel!.text!
        self.performSegueWithIdentifier("movieSegue", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "movieSegue" {
            let x: bookMovie = segue.destinationViewController as! bookMovie
            x.movie = movieName
        } 
    }
    
    override func viewWillAppear(animated: Bool) { super.viewWillAppear(animated)
        movieUserTable.reloadData() }
    
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
