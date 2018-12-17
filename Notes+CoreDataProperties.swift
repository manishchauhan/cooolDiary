//
//  Notes+CoreDataProperties.swift
//  cooolDiary
//
//  Created by Manish on 23/10/16.
//  Copyright © 2016 Manish. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Notes {

    @NSManaged var cnoteDetails: String?
    @NSManaged var cnoteTitle: String?

}
