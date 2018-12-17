//
//  listMainContainer.swift
//  cooolDiary
//
//  Created by Manish on 20/11/16.
//  Copyright © 2016 Manish. All rights reserved.
//

import UIKit

class listMainContainer:rootViewController {
    var notesArray = [Notes]()
    @IBOutlet weak var SearchBar: AppSearchBar!
    @IBOutlet weak var ListContainer: UIView!
    var listBodyViewControllerClone:listBodyViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
          print("this is called");
        // Do any additional setup after loading the view.
        getSearchResults()
    }
    fileprivate func getSearchResults()
    {
       listBodyViewControllerClone=self.childViewControllers.last as? listBodyViewController

        SearchBar.searchBarUpdate={ [weak this=self](str:String?) -> Void in
            //Do the stuff on completion
            print(str);
            this!.updateListonSearch(str);
            
        }
    }
    func updateListonSearch(_ str:String?) -> Void {
        
   
        notesArray=NotesDataModel.getAllNotes(str)!;
        listBodyViewControllerClone?.tryNewSearch(notesArray);
  
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func unwindToHome(_ segue: UIStoryboardSegue) {
        print("this is called");
    }
   
    
    

}
