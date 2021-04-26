//
//  PhotoboothHomeModuleTests.swift
//  PhotoboothTests
//
//  Created by Murtuza Saify on 26/04/2021.
//

import Foundation
import XCTest
import CoreData
@testable import Photobooth

class PhotoboothHomeModuleTests: XCTestCase {

    var photoboothHomeModule: PhotoboothHomeModule?

    override func tearDown() {
        photoboothHomeModule = nil
    }

    override func setUp() {
        photoboothHomeModule = PhotoboothHomeModule()
    }

    func testModuleAssembly() throws {
        let view = photoboothHomeModule?.build()
        
        XCTAssertNotNil(view)
        XCTAssertNotNil(view?.presenter)
        
        let presenter = try XCTUnwrap(view?.presenter as? PhotoboothHomePresenter)
        XCTAssertNotNil(presenter.interactor)
        XCTAssertNotNil(presenter.router)
        
        let interactor = try XCTUnwrap(presenter.interactor as? PhotoboothHomeInteractor)
        XCTAssertNotNil(interactor)
    }
}
