//
//  ImageDataList.swift
//  ImageImgur
//
//  Created by Anderson F Carvalho on 21/07/20.
//  Copyright © 2020 asfcarvalho. All rights reserved.
//

import Foundation

struct ImageDataList: Codable {
    let data: [ImageData]?
    let success: Bool?
    let status: Int?
}
