//
//  RecordPhotoDetailsInteractorTests.swift
//  PhotoboothTests
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import XCTest
import CoreData
@testable import Photobooth

class RecordPhotoDetailsInteractorTests: XCTestCase {

    var interactor: RecordPhotoDetailsInteractor?
    var databaseOperationsManager: DatabaseOperationsManagerInterface?
    var fileManager: FileManagerInterface?

    override func tearDown() {
        interactor = nil
        databaseOperationsManager = nil
        fileManager = nil
    }

    override func setUp() {
        let inMemoryCoreDataStack = TestCoreDataStack(name: "Photobooth")
        let dbOperationsManager = DefaultDatabaseOperationsManager(coreDataStack: inMemoryCoreDataStack)
        interactor = RecordPhotoDetailsInteractor(fileManager: FileManagerStub(),
                                                  databaseOperationsManager: dbOperationsManager)
        databaseOperationsManager = dbOperationsManager
    }

    func testRecordPhotoDetailsSavesPhotoDetailsInDB() throws {

        interactor?.imageData = UIImage.add.pngData()
        _ = interactor?.saveWith(title: "Test")
        
        let savedPhotos: [Photos]? = databaseOperationsManager?.fetch(sortDescriptors: [], predicate: nil)
        let photoFromStore = savedPhotos?.first
        
        XCTAssertNotNil(photoFromStore)
        XCTAssertEqual(photoFromStore?.title, "Test")
    }
}
