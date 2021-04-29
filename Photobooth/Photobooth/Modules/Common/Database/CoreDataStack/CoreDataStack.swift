//
//  DefaultCoreDataStack.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import CoreData

public class CoreDataStack: CoreDataStackInterface {

    private var modelName: String
    public var managedObjectContext: NSManagedObjectContext? {
        return persistentContainer.viewContext
    }
    
    required public init(name: String) {
        self.modelName = name
    }

    lazy private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                // You should add your own error handling code here.
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
}
