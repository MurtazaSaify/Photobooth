//
//  ShowPhotoDetailsModuleTests.swift
//  PhotoboothTests
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import XCTest
import CoreData
@testable import Photobooth

class ShowPhotoDetailsModuleTests: XCTestCase {

    var showPhotoDetailsModule: ShowPhotoDetailsModule?
    var photo: Photos?

    override func tearDown() {
        showPhotoDetailsModule = nil
        photo = nil
    }

    override func setUp() {
        let inMemoryCoreDataStack = TestCoreDataStack(name: "Photobooth")
        let dbOperationsManager = DefaultDatabaseOperationsManager(coreDataStack: inMemoryCoreDataStack)
        photo = dbOperationsManager.initialize()
        showPhotoDetailsModule = ShowPhotoDetailsModule()
    }

    func testModuleAssembly() throws {
        let safePhoto = try XCTUnwrap(photo)
        let view = showPhotoDetailsModule?.build(photo: safePhoto)
        
        XCTAssertNotNil(view)
        XCTAssertNotNil(view?.presenter)
        
        let presenter = try XCTUnwrap(view?.presenter as? ShowPhotoDetailsPresenter)
        XCTAssertNotNil(presenter.interactor)
        XCTAssertNotNil(presenter.router)
        
        let interactor = try XCTUnwrap(presenter.interactor as? ShowPhotoDetailsInteractor)
        XCTAssertNotNil(interactor)
    }
}
