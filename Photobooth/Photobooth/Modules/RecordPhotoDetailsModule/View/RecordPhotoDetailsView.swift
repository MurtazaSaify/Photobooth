//
//  RecordPhotoDetailsView.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import SwiftUI

struct RecordPhotoDetailsView: ViewInterface, View {

    var presenter: RecordPhotoDetailsPresenterInputInterface?
    @State var titleText: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
            VStack(alignment: .center, spacing: 30) {
                TextField("Enter image title", text: $titleText) { (changed) in
                } onCommit: {
                    
                }.padding()
                if let image = presenter?.image {
                    Image(uiImage: image).resizable().aspectRatio(contentMode: .fit)
                    Button("Save") {
                        let _ = presenter?.saveWith(title: titleText)
                        presentationMode.wrappedValue.dismiss()
                    }.foregroundColor(.white)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(8)
                } else {
                    Spacer()
                    Text("Some error occured")
                    Spacer()
                }
            }
    }
}
