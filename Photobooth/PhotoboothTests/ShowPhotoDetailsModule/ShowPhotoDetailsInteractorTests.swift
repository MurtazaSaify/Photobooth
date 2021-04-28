//
//  ShowPhotoDetailsInteractorTests.swift
//  PhotoboothTests
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import XCTest
import CoreData
@testable import Photobooth

class ShowPhotoDetailsInteractorTests: XCTestCase {

    var interactor: ShowPhotoDetailsInteractor?
    var databaseOperationsManager: DatabaseOperationsManagerInterface?

    override func tearDown() {
        interactor = nil
        databaseOperationsManager = nil
    }

    override func setUp() {
        let inMemoryCoreDataStack = TestCoreDataStack(name: "Photobooth")
        let dbOperationsManager = DefaultDatabaseOperationsManager(coreDataStack: inMemoryCoreDataStack)
        databaseOperationsManager = dbOperationsManager
    }

    func testCallToInteractorToGetPhotoDetails() throws {

        let photo: Photos = try XCTUnwrap(databaseOperationsManager?.initialize())
        photo.title = "Photo1"
        interactor = ShowPhotoDetailsInteractor(photo: photo)
        
        XCTAssertNotNil(interactor?.getPhotoDetails())
        XCTAssertEqual(interactor?.getPhotoDetails().title, photo.title)
    }
}
