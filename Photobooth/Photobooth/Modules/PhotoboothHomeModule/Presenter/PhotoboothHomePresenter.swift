//
//  PhotoboothHomePresenter.swift
//  Photobooth
//
//  Created by Murtuza Saify on 26/04/2021.
//

import SwiftUI

class PhotoboothHomePresenter: PresenterInterface {

    var interactor: PhotoboothHomeInteractorInputInterface?
    var router: PhotoboothHomeRouterInputInterface?
}

extension PhotoboothHomePresenter: PhotoboothHomePresenterInputInterface {

    func didPick(image: UIImage) {
        guard let data = image.pngData() else {
            return
        }
        interactor?.set(imageData: data)
    }
    
    func linkBuilder<Content: View>(for route: PhotoboothHomeRoute, selection: Binding<String?>, @ViewBuilder content: () -> Content
    ) -> AnyView {
        // TODO : Connect routing appropriately.
        switch route {
        case .photoListView:
            return AnyView(NavigationLink(
                destination: PhotoListModule().build(),
                tag: "Gallery",
                selection: selection) {
                content()
            })
        case .recordPhotoDetails:
            return AnyView(NavigationLink(
                destination: router?.makeRecordPhotoDetailsView(imageData: interactor?.getImageData()),
                tag: "PhotoDetails",
                selection: selection) {
                content()
            })

        }
    }
}
