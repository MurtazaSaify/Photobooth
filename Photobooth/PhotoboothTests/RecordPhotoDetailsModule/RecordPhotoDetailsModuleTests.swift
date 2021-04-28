//
//  RecordPhotoDetailsModuleTests.swift
//  PhotoboothTests
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import XCTest
import CoreData
@testable import Photobooth

class RecordPhotoDetailsModuleTests: XCTestCase {

    var recordPhotoDetailsModule: RecordPhotoDetailsModule?

    override func tearDown() {
        recordPhotoDetailsModule = nil
    }

    override func setUp() {
        recordPhotoDetailsModule = RecordPhotoDetailsModule()
    }

    func testModuleAssembly() throws {
        let view = recordPhotoDetailsModule?.build(imageData: UIImage.add.pngData())
        
        XCTAssertNotNil(view)
        XCTAssertNotNil(view?.presenter)
        
        let presenter = try XCTUnwrap(view?.presenter as? RecordPhotoDetailsPresenter)
        XCTAssertNotNil(presenter.interactor)
        XCTAssertNotNil(presenter.router)
        
        let interactor = try XCTUnwrap(presenter.interactor as? RecordPhotoDetailsInteractor)
        XCTAssertNotNil(interactor)
    }
}
