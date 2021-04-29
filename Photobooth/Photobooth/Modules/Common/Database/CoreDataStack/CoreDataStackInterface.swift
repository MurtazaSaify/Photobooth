//
//  CoreDataStackInterface.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import CoreData

public protocol CoreDataStackInterface {

    init(name: String)
    var managedObjectContext: NSManagedObjectContext? { get }
}
