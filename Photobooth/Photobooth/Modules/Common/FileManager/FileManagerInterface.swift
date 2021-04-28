//
//  FileManagerInterface.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation

public enum DirectoryType {
    case documentDirectory
    case temporaryDirectory
}

public protocol FileManagerInterface {

    func saveFileData(_ data: Data, name: String, directory: DirectoryType) -> String?
    func fileDataAt(path: String) -> Data?
    func removeItemAt(path: String) -> Bool
    func pathFor(directoryType: DirectoryType) -> String?
}
