//
//  PhotoListViewRouter.swift
//  Photobooth
//
//  Created by Murtuza Saify on 28/04/2021.
//

import SwiftUI

enum PhotoListRoute {
    case photoDetails(index: Int)
}

class PhotoListViewRouter: RouterInterface {}

extension PhotoListViewRouter: PhotoListRouterInputInterface {

}
