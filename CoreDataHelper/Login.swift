//
//  Login.swift
//  CoreDataHelper
//
//  Created by charanbir sandhu on 17/05/21.
//

import Foundation

import CoreData

@objc(Login)
public class Login: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Login> {
        return NSFetchRequest<Login>(entityName: "Login")
    }

    @NSManaged public var name: String?
    
    class func get(context: NSManagedObjectContext) -> [Login] {
        let request: NSFetchRequest<Login>
        request = Login.fetchRequest()
        do {
            let results = try context.fetch(request)
            return results
        }catch {
            return []
        }
    }
    
    class func save(context: NSManagedObjectContext, name: String?) {
        let obj = NSEntityDescription.insertNewObject(forEntityName: "Login", into: context) as! Login
        obj.name = name
        do {
            try context.save()
        }catch {
            fatalError()
        }
    }
    
    class func delete1(context: NSManagedObjectContext) {
        let request: NSFetchRequest<Login>
        request = Login.fetchRequest()
        do {
            let results = try context.fetch(request)
            for obj in results {
                context.delete(obj)
            }
            do {
                try context.save()
            }catch {
                fatalError()
            }
        }catch {
            fatalError()
        }
    }
}
