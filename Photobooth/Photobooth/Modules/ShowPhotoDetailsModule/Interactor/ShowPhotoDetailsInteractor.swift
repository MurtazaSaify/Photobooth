//
//  ShowPhotoDetailsInteractor.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import CoreData
import SwiftUI

final class ShowPhotoDetailsInteractor: InteractorInterface {

    var output: ShowPhotoDetailsInteractorOutputInterface?

    private var photo: Photos
    
    init(photo: Photos) {
        self.photo = photo
    }
}

extension ShowPhotoDetailsInteractor: ShowPhotoDetailsInteractorInputInterface {

    func getPhotoDetails() -> Photos {
        return photo
    }
}
