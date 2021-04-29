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
    @State private var titleText: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
            VStack(alignment: .center, spacing: 30) {
                TextField(TextConstants.textFieldPlaceholder, text: $titleText) { (changed) in
                } onCommit: {
                    
                }.padding()
                if let image = presenter?.image {
                    Image(uiImage: image).resizable().aspectRatio(contentMode: .fit)
                    Button(TextConstants.saveButtonTitle) {
                        let _ = presenter?.saveWith(title: titleText)
                        presentationMode.wrappedValue.dismiss()
                    }.foregroundColor(.white)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(8)
                } else {
                    Spacer()
                    Text(TextConstants.genericErrorMessage)
                    Spacer()
                }
            }
    }
}

private extension RecordPhotoDetailsView {

    struct TextConstants {
        static let textFieldPlaceholder = "Enter image title"
        static let saveButtonTitle = "Save"
        static let genericErrorMessage = "Some error occured"
    }
}
