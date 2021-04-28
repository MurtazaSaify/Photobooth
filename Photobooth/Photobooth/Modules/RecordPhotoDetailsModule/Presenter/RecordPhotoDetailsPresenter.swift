//
//  RecordPhotoDetailsPresenter.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import UIKit

final class RecordPhotoDetailsPresenter: PresenterInterface {

    var interactor: RecordPhotoDetailsInteractorInputInterface?
    var router: RecordPhotoDetailsRouterInputInterface?

    var image: UIImage? {
        guard let data = interactor?.imageData else {
            return nil
        }
        return UIImage(data: data)
    }
}

extension RecordPhotoDetailsPresenter: RecordPhotoDetailsPresenterInputInterface {
    
    func saveWith(title: String) -> Bool {
        let success = interactor?.saveWith(title: title) ?? false
        return success
    }
}
