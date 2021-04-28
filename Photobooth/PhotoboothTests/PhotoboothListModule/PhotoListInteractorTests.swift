//
//  PhotoboothListInteractorTests.swift
//  PhotoboothTests
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import XCTest
import CoreData
@testable import Photobooth

class PhotoListInteractorTests: XCTestCase {

    var interactor: PhotoListViewInteractor?
    var databaseOperationsManager: DatabaseOperationsManagerInterface?

    override func tearDown() {
        interactor = nil
    }

    override func setUp() {
        let inMemoryCoreDataStack = TestCoreDataStack(name: "Photobooth")
        let dbOperationsManager = DefaultDatabaseOperationsManager(coreDataStack: inMemoryCoreDataStack)
        interactor = PhotoListViewInteractor(databaseOperationsManager: dbOperationsManager)
        databaseOperationsManager = dbOperationsManager
    }

    func testPhotoEntitiesFetch() throws {

        let _: Photos? = databaseOperationsManager?.initialize()
        let _: Photos? = databaseOperationsManager?.initialize()

        let photosFromDB = interactor?.fetchPhotoEntities()
        XCTAssertGreaterThan(photosFromDB?.count ?? 0, 0)
        XCTAssertEqual(photosFromDB?.count ?? 0, 2)
    }
}
