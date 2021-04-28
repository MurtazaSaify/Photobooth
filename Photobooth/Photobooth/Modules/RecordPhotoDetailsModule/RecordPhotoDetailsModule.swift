//
//  RecordPhotoDetailsModule.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import UIKit
import SwiftUI
import CoreData

protocol RecordPhotoDetailsPresenterInputInterface: PresenterInputInterface {
    var image: UIImage? { get }
    func saveWith(title: String) -> Bool
}

protocol RecordPhotoDetailsPresenterOutputInterface: PresenterOutputInterface {}

protocol RecordPhotoDetailsInteractorInputInterface: InteractorInputInterface {
    var imageData: Data? { get set }
    func saveWith(title: String) -> Bool
}

protocol RecordPhotoDetailsInteractorOutputInterface: InteractorOutputInterface {}

protocol RecordPhotoDetailsRouterInputInterface: RouterInputInterface {}

final class RecordPhotoDetailsModule: ModuleInterface {
    typealias View = RecordPhotoDetailsView
    typealias Presenter = RecordPhotoDetailsPresenter
    typealias Router = RecordPhotoDetailsRouter
    typealias Interactor = RecordPhotoDetailsInteractor

    func build(imageData: Data?) -> View {
        let presenter = Presenter()
        let interactor = Interactor(fileManager: DefaultFileManager())
        let router = Router()

        let view = View(presenter: presenter)
        interactor.imageData = imageData

        self.assemble(presenter: presenter, router: router, interactor: interactor)

        return view
    }
}
