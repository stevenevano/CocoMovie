//
//  movieList.swift
//  Coco Movie
//
//  Created by Witchen on 6/9/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class movieList: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var movieName1 = ""
    var moviename = ""
    var index = 0
    @IBOutlet weak var movieTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        movieTable.dataSource = self
        movieTable.delegate = self
        movieTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
    }

    @IBAction func addNewMovie(sender: UIButton) {
        self.performSegueWithIdentifier("addSegue", sender: self)
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
        let cell = self.movieTable.cellForRowAtIndexPath(indexPath)! as UITableViewCell
        movieName1 = cell.textLabel!.text!
        self.performSegueWithIdentifier("viewMovieSegue", sender: self)
    }

    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {

        let deleteRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler:{action, indexpath in
            print("DELETE•ACTION");
            self.deleteMovie(indexPath.row)
        });
        
        return [deleteRowAction];
    }
    
    func deleteMovie(index: Int){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let movie = moviesList[index]
        moviesList.removeAtIndex(index)
        managedContext.deleteObject(movie)
        do {

            try managedContext.save()
            print("deleted")
            }catch {
                print("not able to delete")
            }
        self.movieTable.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) { super.viewWillAppear(animated)
        movieTable.reloadData() }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "viewMovieSegue" {
            let y: ViewMovie = segue.destinationViewController as! ViewMovie
            y.movieNameView = movieName1
        }
    }
    
   
    func loadData(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Movies")
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest); moviesList = results as! [NSManagedObject]
            print("total = \(moviesList.count)")
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
