//
//  CoreDataHelper.swift
//  CoreDataHelper
//
//  Created by charanbir sandhu on 17/05/21.
//

import Foundation
import CoreData

class CoreDataHelper {
    // MARK: - Core Data stack
    
    static let shared = CoreDataHelper()
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    lazy var persistentCoordinator1: NSPersistentStoreCoordinator? = {
        guard let path = Bundle.main.url(forResource: "CoreDataHelper", withExtension: "momd") else {
            fatalError()
        }
        guard let model = NSManagedObjectModel(contentsOf: path) else {
            fatalError()
        }
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        var url = getDocumentsDirectory()
        url = url.appendingPathComponent("storeOne.sqlite", isDirectory: false)
        print(url)
        let options = [NSMigratePersistentStoresAutomaticallyOption: true, NSInferMappingModelAutomaticallyOption: true]
        do {
        try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: options)
        } catch {
            fatalError()
        }
        return coordinator
    }()
    
    lazy var persistentCoordinator2: NSPersistentStoreCoordinator? = {
        guard let path = Bundle.main.url(forResource: "CoreDataHelper", withExtension: "momd") else {
            fatalError()
        }
        guard let model = NSManagedObjectModel(contentsOf: path) else {
            fatalError()
        }
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        var url = getDocumentsDirectory()
        url = url.appendingPathComponent("storeTwo.sqlite", isDirectory: false)
        let options = [NSMigratePersistentStoresAutomaticallyOption: true, NSInferMappingModelAutomaticallyOption: true]
        do {
        try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: options)
        } catch {
            fatalError()
        }
        return coordinator
    }()

//    lazy var persistentStore1: NSPersistentStore? = {
//        var url = getDocumentsDirectory()
//        url = url.appendingPathComponent("storeOne.sqlite", isDirectory: false)
//        let store = try? persistentCoordinator1?.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: "store1", at: url, options: nil)
//
//        return store
//    }()
    
    lazy var context1: NSManagedObjectContext = {
            // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
            let coordinator = self.persistentCoordinator1
            var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
            managedObjectContext.persistentStoreCoordinator = coordinator
            managedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            return managedObjectContext
        }()
    
    lazy var context2: NSManagedObjectContext = {
            // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
            let coordinator = self.persistentCoordinator2
            var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
            managedObjectContext.persistentStoreCoordinator = coordinator
            managedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            return managedObjectContext
        }()
    
    
    
        // MARK: - Core Data stack
    
//        lazy var persistentContainer: NSPersistentContainer = {
//            let container = NSPersistentContainer(name: "CoreDataHelper")
//            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//                if let error = error as NSError? {
//                    fatalError("Unresolved error \(error), \(error.userInfo)")
//                }
//            })
//            return container
//        }()
//    
//        // MARK: - Core Data Saving support
//    
//        func saveContext () {
//            let context = persistentContainer.viewContext
//            if context.hasChanges {
//                do {
//                    try context.save()
//                } catch {
//                    let nserror = error as NSError
//                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//                }
//            }
//        }
    
    

}
