//
//  NotesDataModel.swift
//  cooolDiary
//
//  Created by Manish on 23/11/16.
//  Copyright © 2016 Manish. All rights reserved.
//

import UIKit
import CoreData
class NotesDataModel: NSObject {
    
    
    //search a note by name string

    
    
    static func getAllNotes(_ str:String?=nil)->Array<Notes>?
    {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest:NSFetchRequest<NSFetchRequestResult>!
        
        if(str != nil)
        {
            fetchRequest = NSFetchRequest(entityName: "Notes")
            fetchRequest.predicate = NSPredicate(format: "cnoteTitle contains %@", str!)
        }
        else
        {
           fetchRequest = NSFetchRequest(entityName: "Notes")
        }
        //3
        do {
            let results =
                try managedContext.fetch(fetchRequest)
            
            notesArray = results as! [Notes];
            notesArray=notesArray.reversed();
            return notesArray;
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            return nil;
        }

    }
  
    static func updateNoteList(_ title:String,msg:String, completeHandler: (_ status:Bool)-> Void)->Void
    {
        
        let managedObjectContext =
            (UIApplication.shared.delegate
                as! AppDelegate).managedObjectContext;
        let entityDescription =
            NSEntityDescription.entity(forEntityName: "Notes",
                                              in: managedObjectContext)
        
        let newNote = Notes(entity: entityDescription!,
                            insertInto: managedObjectContext)
        newNote.cnoteTitle=title;
        newNote.cnoteDetails=msg;
        do {
            try managedObjectContext.save()
            print("the data is saved");
            completeHandler(true);
            
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
            completeHandler(false);
        }
    
    }
 
}
