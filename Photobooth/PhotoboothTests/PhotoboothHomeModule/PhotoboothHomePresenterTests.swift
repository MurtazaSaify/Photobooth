//
//  PhotoboothHomePresenterTests.swift
//  PhotoboothTests
//
//  Created by Murtuza Saify on 26/04/2021.
//

import Foundation
import XCTest
import CoreData
@testable import Photobooth

class PhotoboothHomePresenterTests: XCTestCase {

    var presenter: PhotoboothHomePresenter?

    override func tearDown() {
        presenter = nil
    }

    override func setUp() {
        presenter = PhotoboothHomePresenter()
        let interactor = PhotoboothHomeInteractor()
        presenter?.interactor = interactor
    }

    func testPresenterUpdatesInteractorImageData() throws {

        let image = UIImage.add
        let imageData = image.pngData()
        presenter?.didPick(image: UIImage.add)
        XCTAssertNotNil(presenter?.interactor?.getImageData())
        XCTAssertEqual(presenter?.interactor?.getImageData(), imageData)
    }
}
