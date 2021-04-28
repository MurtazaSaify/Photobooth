//
//  ShowPhotoDetailsModule.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import UIKit
import SwiftUI
import CoreData

protocol ShowPhotoDetailsPresenterInputInterface: PresenterInputInterface {
    func loadPhotoDetails()
}

protocol ShowPhotoDetailsPresenterOutputInterface: PresenterOutputInterface {}

protocol ShowPhotoDetailsInteractorInputInterface: InteractorInputInterface {
    func getPhotoDetails() -> Photos
}

protocol ShowPhotoDetailsInteractorOutputInterface: InteractorOutputInterface {}

protocol ShowPhotoDetailsRouterInputInterface: RouterInputInterface {}

final class ShowPhotoDetailsModule: ModuleInterface {
    typealias View = ShowPhotoDetailsView
    typealias Presenter = ShowPhotoDetailsPresenter
    typealias Router = ShowPhotoDetailsRouter
    typealias Interactor = ShowPhotoDetailsInteractor

    func build(photo: Photos) -> View {
        let presenter = Presenter()
        let interactor = Interactor(photo: photo)
        let router = Router()

        let viewModel = ShowPhotoDetailsViewModel()
        let view = View(viewModel: viewModel, presenter: presenter)
        presenter.viewModel = viewModel

        self.assemble(presenter: presenter, router: router, interactor: interactor)

        return view
    }
}
