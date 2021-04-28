//
//  PhotoListViewPresenter.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import SwiftUI

final class PhotoListViewPresenter: PresenterInterface {

    var interactor: PhotoListInteractorInputInterface?
    var router: PhotoListRouterInputInterface?
    weak var viewModel: PhotoListViewModel?
}

extension PhotoListViewPresenter: PhotoListPresenterInputInterface {

    func loadPhotos() {
        let photos = interactor?.fetchPhotoEntities()
        let displayItems = photos?.compactMap { PhotoListDisplayItem(photoEntity: $0) } ?? []
        viewModel?.displayItems = displayItems
    }

    func linkBuilder<Content: View>(for route: PhotoListRoute, @ViewBuilder content: () -> Content
    ) -> AnyView {
        switch route {
        case let .photoDetails(index):
            if let photo = interactor?.getPhotoAt(index: index) {
                return AnyView(NavigationLink(
                    destination: ShowPhotoDetailsModule().build(photo: photo)) {
                    content()
                })
            } else {
                return AnyView(NavigationLink(
                    destination: Text("Invalid photo accessed")) {
                    content()
                })
            }
        }
    }
}
