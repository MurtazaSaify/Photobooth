//
//  PhotoListModule.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import UIKit
import SwiftUI
import CoreData

protocol PhotoListPresenterInputInterface: PresenterInputInterface {
    func loadPhotos()
    func linkBuilder<Content: View>(for route: PhotoListRoute, @ViewBuilder content: () -> Content
    ) -> AnyView
}

protocol PhotoListPresenterOutputInterface: PresenterOutputInterface {}

protocol PhotoListInteractorInputInterface: InteractorInputInterface {

    func fetchPhotoEntities() -> [Photos]
    func getPhotoAt(index: Int) -> Photos?
}

protocol PhotoListInteractorOutputInterface: InteractorOutputInterface {}

protocol PhotoListRouterInputInterface: RouterInputInterface {}

final class PhotoListModule: ModuleInterface {
    typealias View = PhotoListView
    typealias Presenter = PhotoListViewPresenter
    typealias Router = PhotoListViewRouter
    typealias Interactor = PhotoListViewInteractor

    func build() -> View {
        let presenter = Presenter()
        let interactor = Interactor()
        let router = Router()

        let viewModel = PhotoListViewModel()
        let view = View(viewModel: viewModel, presenter: presenter)
        presenter.viewModel = viewModel

        self.assemble(presenter: presenter, router: router, interactor: interactor)

        return view
    }
}
