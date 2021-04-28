//
//  ShowPhotoDetailsPresenterTests.swift
//  PhotoboothTests
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import XCTest
import CoreData
@testable import Photobooth

class ShowPhotoDetailsPresenterTests: XCTestCase {

    var presenter: ShowPhotoDetailsPresenter?
    var interactor: ShowPhotoDetailsInteractorInputInterface?
    var viewModel: ShowPhotoDetailsViewModel?

    override func tearDown() {
        presenter = nil
        interactor = nil
    }

    override func setUp() {
        presenter = ShowPhotoDetailsPresenter()
        viewModel = ShowPhotoDetailsViewModel()
        presenter?.viewModel = viewModel
    }

    func testPresenterPopulatesViewMdelWithDispalyEntityOnCallToLoad() throws {
    
        let inMemoryCoreDataStack = TestCoreDataStack(name: "Photobooth")
        let dbOperationsManager = DefaultDatabaseOperationsManager(coreDataStack: inMemoryCoreDataStack)
        let photo: Photos = try XCTUnwrap(dbOperationsManager.initialize())
        photo.title = "Photo 1"
        interactor = ShowPhotoDetailsInteractor(photo: photo)
        presenter?.interactor = interactor

        presenter?.loadPhotoDetails()
        XCTAssertNotNil(presenter?.viewModel?.photoDisplayItem)

        XCTAssertEqual(presenter?.viewModel?.photoDisplayItem?.title, photo.title)
    }
}
