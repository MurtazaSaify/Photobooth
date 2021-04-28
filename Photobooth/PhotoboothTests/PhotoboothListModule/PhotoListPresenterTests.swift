//
//  PhotoListPresenterTests.swift
//  PhotoboothTests
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import XCTest
import CoreData
@testable import Photobooth

class PhotoListPresenterTests: XCTestCase {

    var presenter: PhotoListViewPresenter?
    var databaseOperationsManager: DatabaseOperationsManagerInterface?
    var viewModel: PhotoListViewModel?

    override func tearDown() {
        presenter = nil
        databaseOperationsManager = nil
        viewModel = nil
    }

    override func setUp() {
        let inMemoryCoreDataStack = TestCoreDataStack(name: "Photobooth")
        let dbOperationsManager = DefaultDatabaseOperationsManager(coreDataStack: inMemoryCoreDataStack)
        let interactor = PhotoListViewInteractor(databaseOperationsManager: dbOperationsManager)
        viewModel = PhotoListViewModel()
        
        presenter = PhotoListViewPresenter()
        presenter?.interactor = interactor
        presenter?.viewModel = viewModel
        databaseOperationsManager = dbOperationsManager
    }

    func testPresenterPopulatesViewModelUponSuccesfullFetch() throws {

        let _: Photos? = databaseOperationsManager?.initialize()
        let _: Photos? = databaseOperationsManager?.initialize()

        presenter?.loadPhotos()
        XCTAssertEqual(presenter?.viewModel?.displayItems.count ?? 0, 2)
    }

    func testDisplayItems() throws {
        let photo1: Photos? = databaseOperationsManager?.initialize()
        photo1?.title = "Photo 1"
        photo1?.creationDate = Date()
        photo1?.imagePath = "images/photo1"
        
        let photo2: Photos? = databaseOperationsManager?.initialize()
        photo2?.title = "Photo 2"
        photo2?.creationDate = Date()
        photo2?.imagePath = "images/photo2"

        presenter?.loadPhotos()
        XCTAssertEqual(presenter?.viewModel?.displayItems.count ?? 0, 2)
        
        let displayItem1 = viewModel?.displayItems[0]
        XCTAssertEqual(displayItem1?.title, photo1?.title)

        let displayItem2 = viewModel?.displayItems[1]
        XCTAssertEqual(displayItem2?.title, photo2?.title)
    }
}
