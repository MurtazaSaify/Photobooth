//
//  FlileManagerStub.swift
//  PhotoboothTests
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation

class FileManagerStub: FileManagerInterface {
    
    func saveFileData(_ data: Data, name: String, directory: DirectoryType) -> String? {
        "mockFilePath"
    }

    func fileDataAt(path: String) -> Data? {
        nil
    }

    func removeItemAt(path: String) -> Bool {
        true
    }
    
    func pathFor(directoryType: DirectoryType) -> String? {
        "mockDocumentDirectory"
    }
}
