//
//  FileManagerTests.swift
//  PhotoboothTests
//
//  Created by Murtuza Saify on 28/04/2021.
//

import XCTest
@testable import Photobooth

class FileManagerTests: XCTestCase {

    var fileManager: DefaultFileManager?

    override func tearDown() {
        fileManager = nil
    }

    override func setUp() {
        fileManager = DefaultFileManager()
    }

    func testFileSaveAndRemove() throws {
        let fileData = try XCTUnwrap(UIImage.add.pngData())
        let path = try XCTUnwrap(fileManager?.saveFileData(fileData, name: "file1", directory: .temporaryDirectory))

        XCTAssertNotNil(fileManager?.fileDataAt(path: path))
        
        _ = fileManager?.removeItemAt(path: path)
        XCTAssertNil(fileManager?.fileDataAt(path: path))
    }
}
