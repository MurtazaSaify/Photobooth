//
//  ShowPhotoDetailsView.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import SwiftUI

struct ShowPhotoDetailsView: ViewInterface, View {

    @ObservedObject var viewModel: ShowPhotoDetailsViewModel
    var presenter: ShowPhotoDetailsPresenterInputInterface?

    var body: some View {
            VStack(alignment: .leading, spacing: 30) {
                Text(viewModel.photoDisplayItem?.title ?? "").font(.headline).padding()
                if let image = viewModel.photoDisplayItem?.image {
                    Image(uiImage: image).resizable().aspectRatio(contentMode: .fit)
                    Spacer()
                } else {
                    Spacer()
                    Text("Some error occured")
                    Spacer()
                }
            }.onAppear(perform: {
                presenter?.loadPhotoDetails()
            })
    }
}
