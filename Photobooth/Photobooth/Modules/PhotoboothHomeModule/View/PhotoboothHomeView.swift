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
    @State var showingImagePicker: Bool = false
    
    var presenter: PhotoboothHomePresenterInputInterface?

    var body: some View {
        NavigationView {
            
            VStack(alignment: .center, spacing: 30) {
                
                presenter?.linkBuilder(for: .recordPhotoDetails, selection: $selection, content: {})
                
                Button("Take a Photo") {
                    showingImagePicker = true
                }.foregroundColor(.white)
                .padding()
                .background(Color.accentColor)
                .cornerRadius(8)
                
                self.presenter?.linkBuilder(for: .photoListView, selection: $selection, content: {
                    Button("View Photos") {
                        self.selection = "Gallery"
                    }.foregroundColor(.white)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(8)
                })
            }
            .navigationBarTitle(Text("Photobooth"))
            .sheet(isPresented: $showingImagePicker) {
                ImagePickerView(sourceType: .photoLibrary) { (image) in
                    self.presenter?.didPick(image: image)
                    self.selection = "PhotoDetails"
                }
            }
        }
    }
}
