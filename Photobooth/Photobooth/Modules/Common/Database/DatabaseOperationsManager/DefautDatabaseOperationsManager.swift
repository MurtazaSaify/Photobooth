//
//  DefautDatabaseOperationsManager.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import CoreData

class DefaultDatabaseOperationsManager: DatabaseOperationsManagerInterface {

    var managedObjectContext: NSManagedObjectContext?
    static let shared = DefaultDatabaseOperationsManager(coreDataStack: CoreDataStack(name: "Photobooth"))

    init(coreDataStack: CoreDataStackInterface) {
        self.managedObjectContext = coreDataStack.managedObjectContext
    }
    
    func fetch<T>(sortDescriptors: [NSSortDescriptor], predicate: NSPredicate?) -> [T]? where T : NSManagedObject {
        let fetchRequest = T.fetchRequest()
        fetchRequest.sortDescriptors = sortDescriptors
        fetchRequest.predicate = predicate
        do {
            let objects = try managedObjectContext?.fetch(fetchRequest)
            return objects as? [T]
        } catch _ {
            return nil
        }
    }
    
    func initialize<T>() -> T? where T : NSManagedObject {
        guard let moc = managedObjectContext else {
            return nil
        }
        let object = T(context: moc)
        return object
    }
    
    func save() throws {
        try managedObjectContext?.save()
    }
}
