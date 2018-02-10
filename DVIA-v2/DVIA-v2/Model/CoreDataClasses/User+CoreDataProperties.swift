//
//  User+CoreDataProperties.swift
//  
//
//  Created by Prateek Gianchandani on 14/12/17.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var phone: String?
    @NSManaged public var password: String?
    @NSManaged public var name: String?

}
