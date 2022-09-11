//
//  Emp+CoreDataProperties.swift
//  CiRightTest
//
//  Created by Prakash on 25/05/22.
//
//

import Foundation
import CoreData


extension Emp {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Emp> {
        return NSFetchRequest<Emp>(entityName: "Emp")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var confirmpass: String?

}

extension Emp : Identifiable {

}
