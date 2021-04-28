//
//  PhotoListDisplayItem.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import UIKit

struct PhotoListDisplayItem: Identifiable {
    
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
            if let savedImage = UIImage(contentsOfFile: basePath.appending("/\(path)")) {
                self.image = savedImage
            }
        }
        if let date = photoEntity.creationDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            self.creationDate = dateFormatter.string(from: date)
        }
    }

    func resize(image: UIImage)-> UIImage{
        let size = CGSize(width: 75, height: 75)

        let renderer = UIGraphicsImageRenderer(size: size)
        let resizedImage = renderer.image { context in
            image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
        
        return resizedImage
    }
}
