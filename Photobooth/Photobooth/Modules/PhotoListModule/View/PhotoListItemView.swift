//
//  PhotoListItemView.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import Foundation
import SwiftUI

struct PhotoListItemView: View {

    let photo: PhotoListDisplayItem

    var body: some View {
        HStack() {
            if let image = photo.image {
                Image(uiImage: image).resizable().frame(width: 75, height: 75)
            }
            VStack(alignment: .leading, spacing: 10, content: {
                Text(photo.title ?? "").font(.headline)
                Text(photo.creationDate ?? "").font(.footnote)
            })
        }
    }
}
