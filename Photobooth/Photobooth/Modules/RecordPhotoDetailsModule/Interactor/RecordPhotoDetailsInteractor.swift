//
//  RecordPhotoDetailsInteractor.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import CoreData
import SwiftUI

final class RecordPhotoDetailsInteractor: InteractorInterface {

    let fileManager: FileManagerInterface
    var imageData: Data?
    var output: RecordPhotoDetailsInteractorOutputInterface?
    var databaseOperationsManager: DatabaseOperationsManagerInterface?
    
    init(fileManager: FileManagerInterface,
         databaseOperationsManager: DatabaseOperationsManagerInterface? = DependencyFactory.shared.databaseOperationsManager) {
        self.fileManager = fileManager
        self.databaseOperationsManager = databaseOperationsManager
    }
}

extension RecordPhotoDetailsInteractor: RecordPhotoDetailsInteractorInputInterface {

    func saveWith(title: String) -> Bool {
        guard let photo: Photos = databaseOperationsManager?.initialize() else {
            return false
        }
        photo.title = title
        photo.creationDate = Date()
        guard let savedImagePath = saveImageDataToDocumentDirectory() else {
            return false
        }
        photo.imagePath = savedImagePath
        do {
            try databaseOperationsManager?.save()
            return true
        } catch _ {
            return false
        }
    }
}

private extension RecordPhotoDetailsInteractor {

    func saveImageDataToDocumentDirectory() -> String? {
        guard let data = imageData else {
            return nil
        }
        return fileManager.saveFileData(data, name: "\(Date().timeIntervalSince1970)", directory: .documentDirectory)?.components(separatedBy: "/").last
    }
}
