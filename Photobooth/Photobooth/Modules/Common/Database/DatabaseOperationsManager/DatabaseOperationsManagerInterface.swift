//
//  DatabaseOperationsManagerInterface.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import CoreData

protocol DatabaseOperationsManagerInterface {

    func fetch<T: NSManagedObject>(sortDescriptors: [NSSortDescriptor], predicate: NSPredicate?) -> [T]?
    func initialize<T: NSManagedObject>() -> T?
    func save() throws
}
