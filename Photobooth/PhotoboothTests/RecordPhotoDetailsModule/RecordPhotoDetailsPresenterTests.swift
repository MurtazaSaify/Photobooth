//
//  RecordPhotoDetailsPresenterTests.swift
//  PhotoboothTests
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import XCTest
import CoreData
@testable import Photobooth

class RecordPhotoDetailsPresenterTests: XCTestCase {

    var presenter: RecordPhotoDetailsPresenter?
    var databaseOperationsManager: DatabaseOperationsManagerInterface?
    var interactor: RecordPhotoDetailsInteractorInputInterface?

    override func tearDown() {
        presenter = nil
        databaseOperationsManager = nil
        interactor = nil
    }

    override func setUp() {
        let inMemoryCoreDataStack = TestCoreDataStack(name: "Photobooth")
        let dbOperationsManager = DefaultDatabaseOperationsManager(coreDataStack: inMemoryCoreDataStack)
        interactor = RecordPhotoDetailsInteractor(fileManager: FileManagerStub(),
                                                  databaseOperationsManager: dbOperationsManager)
        interactor?.imageData = UIImage.add.pngData()
        
        presenter = RecordPhotoDetailsPresenter()
        presenter?.interactor = interactor
        databaseOperationsManager = dbOperationsManager
    }

    func testPresenterMakesCallToInteractorToPersistPhotoOnSave() throws {
    
        _ = presenter?.saveWith(title: "Test")
        let savedPhotos: [Photos]? = databaseOperationsManager?.fetch(sortDescriptors: [], predicate: nil)
        let photoFromStore = savedPhotos?.first
        
        XCTAssertNotNil(photoFromStore)
        XCTAssertEqual(photoFromStore?.title, "Test")
    }
}
