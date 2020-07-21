//
//  ImageData.swift
//  ImageImgur
//
//  Created by Anderson F Carvalho on 20/07/20.
//  Copyright © 2020 asfcarvalho. All rights reserved.
//

import Foundation

// MARK: - ImageData
struct ImageData: Codable {
    let id, title: String?
    let images: [Image]?
}
