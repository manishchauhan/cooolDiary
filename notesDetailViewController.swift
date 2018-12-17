//
//  notesDetailViewController.swift
//  cooolDiary
//
//  Created by Manish on 23/10/16.
//  Copyright © 2016 Manish. All rights reserved.
//

import UIKit
import CoreData
class notesDetailViewController: rootViewController {

    @IBOutlet weak var noteDetails: UITextView!

    @IBOutlet weak var noteHeading: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveNote(_ sender: AnyObject) {
      self.performSegue(withIdentifier: "okdoit", sender: self);
        NotesDataModel.updateNoteList(noteHeading.text!, msg: noteDetails.text) { [weak this=self](status) in
            this!.updateRecord();
        }
        
    }
    func updateRecord()
    {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: { () -> Void in
                
            })
        }
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
        NotificationCenter.default.post(name: Notification.Name(rawValue: "appendListIdentifier"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
