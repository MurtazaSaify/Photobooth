//
//  PhotoDetailsDisplayItem.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import UIKit

struct PhotoDetailsDisplayItem: Identifiable {

    var id: Int?
    var title: String?
    var image: UIImage?
    var creationDate: String?

    init(photoEntity: Photos,
         baseDirectoryPath: String? = DefaultFileManager().pathFor(directoryType: .documentDirectory)) {
        self.id = photoEntity.id.hashValue
        self.title = photoEntity.title
        if let path = photoEntity.imagePath,
           let basePath = baseDirectoryPath {
            self.image = UIImage(contentsOfFile: basePath.appending("/\(path)"))
        }
        if let date = photoEntity.creationDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            self.creationDate = dateFormatter.string(from: date)
        }
    }
}
