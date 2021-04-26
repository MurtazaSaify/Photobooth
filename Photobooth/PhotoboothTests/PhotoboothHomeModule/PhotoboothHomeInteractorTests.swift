//
//  PhotoboothHomeInteractorTests.swift
//  PhotoboothTests
//
//  Created by Murtuza Saify on 26/04/2021.
//

import Foundation
import XCTest
@testable import Photobooth

class PhotoboothHomeIntercatorTests: XCTestCase {

    var interactor: PhotoboothHomeInteractor?

    override func tearDown() {
        interactor = nil
    }

    override func setUp() {
        interactor = PhotoboothHomeInteractor()
    }

    func testPhotoEntitiesFetch() throws {
        guard let imageData = UIImage.add.pngData() else {
            return
        }

        interactor?.set(imageData: imageData)
        let recordedImageData = interactor?.getImageData()
        
        XCTAssertNotNil(recordedImageData)
        XCTAssertEqual(recordedImageData, imageData)
    }
}
