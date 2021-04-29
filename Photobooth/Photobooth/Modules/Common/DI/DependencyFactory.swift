//
//  DependencyFactory.swift
//  Photobooth
//
//  Created by Murtuza Saify on 29/04/2021.
//

import Foundation

public final class DependencyFactory {

    static let shared = DependencyFactory()

    public var databaseOperationsManager: DatabaseOperationsManagerInterface?
}
