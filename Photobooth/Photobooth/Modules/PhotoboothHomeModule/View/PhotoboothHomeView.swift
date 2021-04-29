//
//  PhotoboothHomeView.swift
//  Photobooth
//
//  Created by Murtuza Saify on 26/04/2021.
//

import Foundation
import SwiftUI

struct PhotoboothHomeView: ViewInterface, View {

    @State private var selection: String? = nil
    @State private var showingImagePicker: Bool = false
    
    var presenter: PhotoboothHomePresenterInputInterface?

    var body: some View {
        NavigationView {
            
            VStack(alignment: .center, spacing: 30) {
                
                presenter?.linkBuilder(for: .recordPhotoDetails, selection: $selection, content: {})
                
                Button(TextConstants.takePhotoButtonText) {
                    showingImagePicker = true
                }.foregroundColor(.white)
                .padding()
                .background(Color.accentColor)
                .cornerRadius(8)
                
                self.presenter?.linkBuilder(for: .photoListView, selection: $selection, content: {
                    Button(TextConstants.viewPhotosButtonText) {
                        self.selection = SelectionConstants.takePhotoActionSelectionTag
                    }.foregroundColor(.white)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(8)
                })
            }
            .navigationBarTitle(Text(TextConstants.navigationTitle))
            .sheet(isPresented: $showingImagePicker) {
                ImagePickerView(sourceType: .photoLibrary) { (image) in
                    self.presenter?.didPick(image: image)
                    self.selection = SelectionConstants.viewPhotoListActionSelectionTag
                }
            }
        }
    }
}

private extension PhotoboothHomeView {

    struct TextConstants {
        static let takePhotoButtonText = "Take a Photo"
        static let viewPhotosButtonText = "View Photos"
        static let navigationTitle = "Photobooth"
    }

    struct SelectionConstants {
        static let takePhotoActionSelectionTag = "Gallery"
        static let viewPhotoListActionSelectionTag = "PhotoDetails"
    }
}
