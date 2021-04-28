//
//  ShowPhotoDetailsPresenter.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import UIKit

final class ShowPhotoDetailsPresenter: PresenterInterface {

    var interactor: ShowPhotoDetailsInteractorInputInterface?
    var router: ShowPhotoDetailsRouterInputInterface?
    weak var viewModel: ShowPhotoDetailsViewModel?
}

extension ShowPhotoDetailsPresenter: ShowPhotoDetailsPresenterInputInterface {
    
    func loadPhotoDetails() {
        guard let photo = interactor?.getPhotoDetails() else {
            return
        }
        viewModel?.photoDisplayItem = PhotoDetailsDisplayItem(photoEntity: photo)
    }
}
