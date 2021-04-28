//
//  ShowPhotoDetailsViewModel.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import SwiftUI
import Combine

final class ShowPhotoDetailsViewModel: ObservableObject {

    let objectWillChange = ObservableObjectPublisher()

    @Published var photoDisplayItem: PhotoDetailsDisplayItem? = nil {
        willSet {
            self.objectWillChange.send()
        }
    }
}
