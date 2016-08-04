//
//  bookMovie.swift
//  Coco Movie
//
//  Created by Witchen on 6/11/16.
//  Copyright © 2016 Steven. All rights reserved.
//

import UIKit
import CoreData
import Foundation

var seatList = [NSManagedObject]()
class bookMovie: UIViewController {
    var movie: String = ""
    var strDate = ""
    var movieArr = [String] ()
    var dateArr = [String] ()
    var seat1Arr = [Int] ()
    var seat2Arr = [Int] ()
    var seat3Arr = [Int] ()
    var seat4Arr = [Int] ()
    var seat5Arr = [Int] ()
    var seat6Arr = [Int] ()
    var seat7Arr = [Int] ()
    var seat8Arr = [Int] ()
    var seat9Arr = [Int] ()
    var seat10Arr = [Int] ()
    var seatArr = [Int: Int]()
    var seat1value = 0
    var seat2value = 0
    var seat3value = 0
    var seat4value = 0
    var seat5value = 0
    var seat6value = 0
    var seat7value = 0
    var seat8value = 0
    var seat9value = 0
    var seat10value = 0
    @IBOutlet weak var seat1: UIButton!
    @IBOutlet weak var seat2: UIButton!
    @IBOutlet weak var seat3: UIButton!
    @IBOutlet weak var seat4: UIButton!
    @IBOutlet weak var seat5: UIButton!
    @IBOutlet weak var seat6: UIButton!
    @IBOutlet weak var seat7: UIButton!
    @IBOutlet weak var seat8: UIButton!
    @IBOutlet weak var seat9: UIButton!
    @IBOutlet weak var seat10: UIButton!
    @IBOutlet weak var myDatepicker: UIDatePicker!
    @IBOutlet weak var movieName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        movieName.text = movie
        self.setDefaultSeat()
        seat1.userInteractionEnabled = true
        seat2.userInteractionEnabled = true
        seat3.userInteractionEnabled = true
        seat4.userInteractionEnabled = true
        seat5.userInteractionEnabled = true
        seat6.userInteractionEnabled = true
        seat7.userInteractionEnabled = true
        seat8.userInteractionEnabled = true
        seat9.userInteractionEnabled = true
        seat10.userInteractionEnabled = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkSeat(){
        self.loadData()
        var counter = 0
        for i in movieArr{
            if movieArr[counter] as String == movieName.text && dateArr[counter] == strDate {
                if seat1Arr[counter] == 1 {
                    seat1.backgroundColor = UIColor.redColor()
                    seat1.userInteractionEnabled = false
                }
                if seat2Arr[counter] == 1 {
                    seat2.backgroundColor = UIColor.redColor()
                    seat2.userInteractionEnabled = false
                }
                if seat3Arr[counter] == 1 {
                    seat3.backgroundColor = UIColor.redColor()
                    seat3.userInteractionEnabled = false
                }
                if seat4Arr[counter] == 1 {
                    seat4.backgroundColor = UIColor.redColor()
                    seat4.userInteractionEnabled = false
                }
                if seat5Arr[counter] == 1 {
                    seat5.backgroundColor = UIColor.redColor()
                    seat5.userInteractionEnabled = false
                }
                if seat6Arr[counter] == 1 {
                    seat6.backgroundColor = UIColor.redColor()
                    seat6.userInteractionEnabled = false
                }
                if seat7Arr[counter] == 1 {
                    seat7.backgroundColor = UIColor.redColor()
                    seat7.userInteractionEnabled = false
                }
                if seat8Arr[counter] == 1 {
                    seat8.backgroundColor = UIColor.redColor()
                    seat8.userInteractionEnabled = false
                }
                if seat9Arr[counter] == 1 {
                    seat9.backgroundColor = UIColor.redColor()
                    seat9.userInteractionEnabled = false
                }
                if seat10Arr[counter] == 1 {
                    seat10.backgroundColor = UIColor.redColor()
                    seat10.userInteractionEnabled = false
                }
                break
            }
            counter++
        }
    }


    @IBAction func seat1(sender: AnyObject) {
        if seat1.backgroundColor == UIColor.greenColor() {
            seat1.backgroundColor = UIColor.redColor()
            seat1value = 1
        } else {
            seat1.backgroundColor = UIColor.greenColor()
            seat1value = 0
        }
        seatArr[1] = seat1value
    }
    
    @IBAction func seat2(sender: AnyObject) {
        if seat2.backgroundColor == UIColor.greenColor() {
            seat2.backgroundColor = UIColor.redColor()
            seat2value = 1
        } else {
            seat2.backgroundColor = UIColor.greenColor()
            seat2value = 0
        }
        seatArr[2] = seat2value
    }
    
    @IBAction func seat3(sender: AnyObject) {
        if seat3.backgroundColor == UIColor.greenColor() {
            seat3.backgroundColor = UIColor.redColor()
            seat3value = 1
        } else {
            seat3.backgroundColor = UIColor.greenColor()
            seat3value = 0
        }
        seatArr[3] = seat3value
    }
    
    @IBAction func seat4(sender: AnyObject) {
        if seat4.backgroundColor == UIColor.greenColor() {
            seat4.backgroundColor = UIColor.redColor()
            seat4value = 1
        } else {
            seat4.backgroundColor = UIColor.greenColor()
            seat4value = 0
        }
        seatArr[4] = seat4value
    }
    
    @IBAction func seat5(sender: AnyObject) {
        if seat5.backgroundColor == UIColor.greenColor() {
            seat5.backgroundColor = UIColor.redColor()
            seat5value = 1
        } else {
            seat5.backgroundColor = UIColor.greenColor()
            seat5value = 0
        }
        seatArr[5] = seat5value
    }
    
    @IBAction func seat6(sender: AnyObject) {
        if seat6.backgroundColor == UIColor.greenColor() {
            seat6.backgroundColor = UIColor.redColor()
            seat6value = 1
        } else {
            seat6.backgroundColor = UIColor.greenColor()
            seat6value = 0
        }
        seatArr[6] = seat6value
    }
    
    @IBAction func seat7(sender: AnyObject) {
        if seat7.backgroundColor == UIColor.greenColor() {
            seat7.backgroundColor = UIColor.redColor()
            seat7value = 1
        } else {
            seat7.backgroundColor = UIColor.greenColor()
            seat7value = 0
        }
        seatArr[7] = seat7value
    }
    
    @IBAction func seat8(sender: AnyObject) {
        if seat8.backgroundColor == UIColor.greenColor() {
            seat8.backgroundColor = UIColor.redColor()
            seat8value = 1
        } else {
            seat8.backgroundColor = UIColor.greenColor()
            seat8value = 0
        }
        seatArr[8] = seat8value
    }
    
    @IBAction func seat9(sender: AnyObject) {
        if seat9.backgroundColor == UIColor.greenColor() {
            seat9.backgroundColor = UIColor.redColor()
            seat9value = 1
        } else {
            seat9.backgroundColor = UIColor.greenColor()
            seat9value = 0
        }
        seatArr[9] = seat9value
    }
    
    @IBAction func seat10(sender: AnyObject) {
        if seat10.backgroundColor == UIColor.greenColor() {
            seat10.backgroundColor = UIColor.redColor()
            seat10value = 1
        } else {
            seat10.backgroundColor = UIColor.greenColor()
            seat10value = 0
        }
        seatArr[10] = seat10value
    }

    func setDefaultSeat(){
        for i in 1...18{
            seatArr[i] = 0
        }
    }
   
    @IBAction func datePicker(sender: AnyObject) {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        strDate = dateFormatter.stringFromDate(myDatepicker.date)
        print(strDate)
    }
    
    @IBAction func checkSeatMovie(sender: AnyObject) {
        self.checkSeat()
    }
    
    @IBAction func bookConfirm(sender: AnyObject) {
        save(movieName.text!, date: strDate, seat1: seatArr[1]!, seat2: seatArr[2]!, seat3: seatArr[3]!, seat4: seatArr[4]!, seat5: seatArr[5]!, seat6: seatArr[6]!, seat7: seatArr[7]!, seat8: seatArr[8]!, seat9: seatArr[9]!, seat10: seatArr[10]!)
        let msgAlert = UIAlertController(title: "Booking Status", message: "Booking Seat Success", preferredStyle: UIAlertControllerStyle.Alert)
        msgAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            self.performSegueWithIdentifier("afterBookingSegue", sender: self)
        }))
        self.presentViewController(msgAlert, animated: true, completion: nil)
   }
    
    func save(name: String,date: String,seat1: Int, seat2: Int, seat3: Int,seat4: Int, seat5: Int, seat6: Int, seat7: Int, seat8: Int, seat9: Int, seat10: Int){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("BookMovies", inManagedObjectContext:managedContext)
        let seat = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        seat.setValue(name, forKey: "movieName")
        seat.setValue(date, forKey: "date")
        seat.setValue(seat1, forKey: "seat1")
        seat.setValue(seat2, forKey: "seat2")
        seat.setValue(seat3, forKey: "seat3")
        seat.setValue(seat4, forKey: "seat4")
        seat.setValue(seat5, forKey: "seat5")
        seat.setValue(seat6, forKey: "seat6")
        seat.setValue(seat7, forKey: "seat7")
        seat.setValue(seat8, forKey: "seat8")
        seat.setValue(seat9, forKey: "seat9")
        seat.setValue(seat10, forKey: "seat10")
        do {
            try managedContext.save()
            seatList.append(seat)
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }

    func loadData(){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "BookMovies")
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest); moviesList = results as! [NSManagedObject]
            for i in  moviesList {
                let string1: NSString = i.valueForKey("movieName") as! NSString
                movieArr.append(string1 as String)
                let string2: NSString = i.valueForKey("date") as! NSString
                dateArr.append(string2 as String)
                let int1: NSInteger = i.valueForKey("seat1") as! NSInteger
                seat1Arr.append(int1 as Int)
                let int2: NSInteger = i.valueForKey("seat2") as! NSInteger
                seat2Arr.append(int2 as Int)
                let int3: NSInteger = i.valueForKey("seat3") as! NSInteger
                seat3Arr.append(int3 as Int)
                let int4: NSInteger = i.valueForKey("seat4") as! NSInteger
                seat4Arr.append(int4 as Int)
                let int5: NSInteger = i.valueForKey("seat5") as! NSInteger
                seat5Arr.append(int5 as Int)
                let int6: NSInteger = i.valueForKey("seat6") as! NSInteger
                seat6Arr.append(int6 as Int)
                let int7: NSInteger = i.valueForKey("seat7") as! NSInteger
                seat7Arr.append(int7 as Int)
                let int8: NSInteger = i.valueForKey("seat8") as! NSInteger
                seat8Arr.append(int8 as Int)
                let int9: NSInteger = i.valueForKey("seat9") as! NSInteger
                seat9Arr.append(int9 as Int)
                let int10: NSInteger = i.valueForKey("seat10") as! NSInteger
                seat10Arr.append(int10 as Int)
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
