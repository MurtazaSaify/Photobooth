//
//  DefaultFileManager.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation

class DefaultFileManager: FileManagerInterface {

    func saveFileData(_ data: Data, name: String, directory: DirectoryType) -> String? {
        var directoryURL: URL?
        switch directory {
        case .documentDirectory:
            directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        case .temporaryDirectory:
            directoryURL = URL(fileURLWithPath: NSTemporaryDirectory())
        }
        guard let fileURL = directoryURL?.appendingPathComponent(name) else {
            return nil
        }
        if !FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try data.write(to: fileURL)
                return fileURL.path
            } catch _ {
                return nil
            }
        }
        return nil
    }

    func fileDataAt(path: String) -> Data? {
        let fileURL = URL(fileURLWithPath: path)
        return try? Data(contentsOf: fileURL)
    }

    func removeItemAt(path: String) -> Bool {
        let url = URL(fileURLWithPath: path)
        do {
            try FileManager.default.removeItem(at: url)
            return true
        } catch _ {
            return false
        }
    }

    func pathFor(directoryType: DirectoryType) -> String? {
        switch directoryType {
        case .documentDirectory:
            return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.path
        case .temporaryDirectory:
            return NSTemporaryDirectory()
        }
    }
}
