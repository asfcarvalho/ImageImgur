//
//  Image.swift
//  ImageImgur
//
//  Created by Anderson F Carvalho on 20/07/20.
//  Copyright © 2020 asfcarvalho. All rights reserved.
//

import Foundation

// MARK: - Image
struct Image: Codable {
    let id, title: String?
    let size, views: Int?
    let link: String?
}
