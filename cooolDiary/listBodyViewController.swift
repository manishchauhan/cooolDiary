//
//  listBodyViewController.swift
//  cooolDiary
//
//  Created by Manish on 22/10/16.
//  Copyright © 2016 Manish. All rights reserved.
//

import UIKit

class listBodyViewController: UIViewController {
    var noteList:notesCollectionViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //add a list which is show all notes user added 
        
  
        NotificationCenter.default.addObserver(self, selector: #selector(listBodyViewController.appendList(_:)), name:NSNotification.Name(rawValue: "appendListIdentifier"), object: nil)
        addNotesList();
    }
    //
    func tryNewSearch(_ arry:Array<Notes>) -> Void {
        self.noteList?.fillterSearchData(arry);
    }
    
    func appendList(_ id:AnyObject) -> Void {
        self.noteList?.refreshData();
    }
    
    //add list of notes
    fileprivate func addNotesList()
    {
        noteList=notesCollectionViewController(nibName: "notesCollectionViewController", bundle: nil);
        self.view.addSubview(noteList!.view);
        self.addChildViewController(noteList!);
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    




  

}
