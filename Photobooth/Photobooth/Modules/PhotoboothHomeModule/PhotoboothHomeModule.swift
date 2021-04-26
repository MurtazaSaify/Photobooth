//
//  PhotoboothHomeModule.swift
//  Photobooth
//
//  Created by Murtuza Saify on 26/04/2021.
//

import SwiftUI

protocol PhotoboothHomePresenterInputInterface: PresenterInputInterface {

    func didPick(image: UIImage)
    func linkBuilder<Content: View>(for route: PhotoboothHomeRoute, selection: Binding<String?>, @ViewBuilder content: () -> Content
    ) -> AnyView
}

protocol PhotoboothHomePresenterOutputInterface: PresenterOutputInterface {}

protocol PhotoboothHomeInteractorInputInterface: InteractorInputInterface {
    func set(imageData: Data)
    func getImageData() -> Data?
}

protocol PhotoboothHomeRouterInputInterface: RouterInputInterface {}

final class PhotoboothHomeModule: ModuleInterface {
    typealias View = PhotoboothHomeView
    typealias Presenter = PhotoboothHomePresenter
    typealias Router = PhotoboothHomeRouter
    typealias Interactor = PhotoboothHomeInteractor

    func build() -> View {
        let presenter = Presenter()
        let interactor = Interactor()
        let router = Router()

        var view = View()
        view.presenter = presenter
        self.assemble(presenter: presenter, router: router, interactor: interactor)
        return view
    }
}
