//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Richard Tyran on 4/25/15.
//  Copyright (c) 2015 Richard Tyran. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
//        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
//            as NSManagedObject
//        
//        newUser.setValue("Tom", forKey: "username")
//        
//        newUser.setValue("password2", forKey: "password")
//        
//        context.save(nil)
        
        var request = NSFetchRequest(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        // just request one item from database? use predicate code below
        
        request.predicate = NSPredicate(format: "username = %@", "Lisa")
        
        var results = context.executeFetchRequest(request, error: nil)
        
        if (results?.count > 0) {
            
            println(results)
            
            for result: AnyObject in results! {
                
                if let user = result.valueForKey("username") as? String {
                    
                    if user == "Lisa" {
                        
//                        context.deleteObject(result as NSManagedObject)
//                        
//                        println(user + " has been deleted")
                    
                        result.setValue("password4", forKey: "password")
                        
                
                    }
                    
                }
                
                context.save(nil)
            }
            
        } else {
            
            println("No results")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

