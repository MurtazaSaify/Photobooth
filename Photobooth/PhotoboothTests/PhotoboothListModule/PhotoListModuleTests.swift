//
//  PhotoListModuleTests.swift
//  PhotoboothTests
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import XCTest
import CoreData
@testable import Photobooth

class PhotoListModuleTests: XCTestCase {

    var photoListModule: PhotoListModule?

    override func tearDown() {
        photoListModule = nil
    }

    override func setUp() {
        photoListModule = PhotoListModule()
    }

    func testModuleAssembly() throws {
        let view = photoListModule?.build()
        
        XCTAssertNotNil(view)
        XCTAssertNotNil(view?.presenter)
        
        let presenter = try XCTUnwrap(view?.presenter as? PhotoListViewPresenter)
        XCTAssertNotNil(presenter.interactor)
        XCTAssertNotNil(presenter.router)
        
        let interactor = try XCTUnwrap(presenter.interactor as? PhotoListViewInteractor)
        XCTAssertNotNil(interactor.databaseOperationsManager)
    }
}
