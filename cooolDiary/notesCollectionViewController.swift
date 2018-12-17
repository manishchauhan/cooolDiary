//
//  notesCollectionViewController.swift
//  cooolDiary
//
//  Created by Manish on 01/10/16.
//  Copyright © 2016 Manish. All rights reserved.
//

import UIKit
import CoreData
private let reuseIdentifier = "noteCell"
var notesArray = [Notes]()


class notesCollectionViewController: UICollectionViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        registerReusebleCell()
        self.collectionView?.delegate=self;
        self.collectionView?.dataSource=self;
        self.collectionView?.resignFirstResponder();
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Register cell classes
        
         setUPData();
        // Do any additional setup after loading the view.
     
    }
    //
  
    fileprivate func setUPData()
    {
        notesArray=NotesDataModel.getAllNotes()!;
    }
    //register a cell
    fileprivate func registerReusebleCell()->Void
    {
        let nib = UINib(nibName: "noteCollectionViewCell", bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fillterSearchData(_ newNotes:Array<Notes>) -> Void {
        DispatchQueue.main.async{
            notesArray=newNotes
            self.collectionView?.reloadData();
            let delayTime = DispatchTime.now() + Double(Int64(0.6 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: delayTime) {
                self.collectionView!.setContentOffset(CGPoint.zero, animated: true)
            }
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    func refreshData() -> Void {
        
        DispatchQueue.main.async{
           self.setUPData();
           self.collectionView?.reloadData();
            let delayTime = DispatchTime.now() + Double(Int64(0.6 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: delayTime) {
                   self.collectionView!.setContentOffset(CGPoint.zero, animated: true)
            }
        
        }
      
    }
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
      
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true;
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item);
    }
   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
          
        return notesArray.count;
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! noteCollectionViewCell

        cell.thumbDetail.text=notesArray[indexPath.item].cnoteTitle;
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
}
