//
//  noteCollectionViewCell.swift
//  cooolDiary
//
//  Created by Manish on 22/10/16.
//  Copyright © 2016 Manish. All rights reserved.
//

import UIKit

class noteCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var thumbDetail: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbDetail.isUserInteractionEnabled=false;
        thumbDetail.isEditable=false;
        // Initialization code
    }

}
