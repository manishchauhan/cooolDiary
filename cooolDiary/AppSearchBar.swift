//
//  AppSearchBar.swift
//  cooolDiary
//
//  Created by Manish on 22/11/16.
//  Copyright © 2016 Manish. All rights reserved.
//

import UIKit

class AppSearchBar: UISearchBar,UISearchBarDelegate {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    var disableSearch:Bool?=false;
    var textTosearch:String?=nil;
    var searchBarUpdate: (String?)->Void = {_ in }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        self.delegate=self
        
    }
    required override init(frame: CGRect) {
        super.init(frame: frame);
    }
    //begin
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
       
    }
    //end
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
       
    }
    //cancel clicked
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        self.resignFirstResponder();
    }
    //button clicked
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
         searchBarUpdate(textTosearch!);
    }
    func textFieldShouldClear(_ textField:UITextField)
    {
       
        textTosearch=nil;
        disableSearch=true;
        searchBarUpdate(textTosearch);
     
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard  disableSearch==false else { disableSearch=false ;return}
        textTosearch=searchText;
        if(textTosearch=="")
        {
             searchBarUpdate(nil);
            return;
        }
        searchBarUpdate(textTosearch);
     
    }
    
}
