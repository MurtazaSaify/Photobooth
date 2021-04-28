//
//  PhotoboothHomeRouter.swift
//  Photobooth
//
//  Created by Murtuza Saify on 26/04/2021.
//

import SwiftUI

enum PhotoboothHomeRoute {
    case photoListView
    case recordPhotoDetails
}

class PhotoboothHomeRouter: PhotoboothHomeRouterInputInterface, RouterInterface {

    func makePhotoListView() -> PhotoListView {
        return PhotoListModule().build()
    }

    func makeRecordPhotoDetailsView(imageData: Data?) -> RecordPhotoDetailsView {
        return RecordPhotoDetailsModule().build(imageData: imageData)
    }
}
