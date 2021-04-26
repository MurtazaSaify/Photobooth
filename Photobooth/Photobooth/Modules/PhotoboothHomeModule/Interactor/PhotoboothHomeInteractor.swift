//
//  PhotoboothHomeInteractor.swift
//  Photobooth
//
//  Created by Murtuza Saify on 26/04/2021.
//

import Foundation

class PhotoboothHomeInteractor: InteractorInterface {

    var output: PhotoboothHomePresenterOutputInterface?
    private var pickedImageData: Data?
}

extension PhotoboothHomeInteractor: PhotoboothHomeInteractorInputInterface {

    func set(imageData: Data) {
        pickedImageData = imageData
    }

    func getImageData() -> Data? {
        return pickedImageData
    }
}
