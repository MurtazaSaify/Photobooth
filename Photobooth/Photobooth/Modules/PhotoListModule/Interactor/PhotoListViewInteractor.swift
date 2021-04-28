//
//  PhotoListViewInteractor.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import CoreData
import SwiftUI

final class PhotoListViewInteractor: InteractorInterface {

    var output: PhotoListInteractorOutputInterface?
    let databaseOperationsManager: DatabaseOperationsManagerInterface

    private var allPhotos: [Photos] = []

    init(databaseOperationsManager: DatabaseOperationsManagerInterface = DefaultDatabaseOperationsManager.shared) {
        self.databaseOperationsManager = databaseOperationsManager
    }
    
}

extension PhotoListViewInteractor: PhotoListInteractorInputInterface {

    func fetchPhotoEntities() -> [Photos] {
        if allPhotos.isEmpty {
            let photos: [Photos]? = databaseOperationsManager.fetch(sortDescriptors: [NSSortDescriptor(key: "creationDate",
                                                                                                   ascending: true)], predicate: nil)
            allPhotos = photos ?? []
        }
        return allPhotos
    }

    func getPhotoAt(index: Int) -> Photos? {
        guard allPhotos.count > index else {
            return nil
        }
        return allPhotos[index]
    }
}
