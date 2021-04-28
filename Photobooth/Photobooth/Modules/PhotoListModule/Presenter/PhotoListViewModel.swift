//
//  PhotoListViewModel.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import SwiftUI
import Combine

final class PhotoListViewModel: ObservableObject {

    let objectWillChange = ObservableObjectPublisher()

    @Published var displayItems: [PhotoListDisplayItem] = [] {
        willSet {
            self.objectWillChange.send()
        }
    }
}
