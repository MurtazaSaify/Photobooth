//
//  PhotoListView.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import SwiftUI

struct PhotoListView: ViewInterface, View {

    @ObservedObject var viewModel: PhotoListViewModel
    var presenter: PhotoListPresenterInputInterface?

    var body: some View {
        VStack(alignment: .leading) {
            if viewModel.displayItems.isEmpty {
                Spacer()
                Text("No photos exists")
                Spacer()
            } else {
                List {
                    ForEach(0..<viewModel.displayItems.count) { index in
                        let photoEntity = viewModel.displayItems[index]
                        self.presenter?.linkBuilder(for: .photoDetails(index: index), content: {
                            PhotoListItemView(photo: photoEntity)
                        })
                    }
                }
            }
        }
        .onAppear(perform: {
            presenter?.loadPhotos()
        })
        .navigationBarTitle(Text("Photos"))
    }
}
