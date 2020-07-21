//
//  ImageListDataSource.swift
//  ImageImgur
//
//  Created by Anderson F Carvalho on 21/07/20.
//  Copyright © 2020 asfcarvalho. All rights reserved.
//

import Foundation

class ImageListDataSource {
    
    static let shared = ImageListDataSource()
    
    private let url = "gallery/search/?q=%@"

    func galleryFetch(_ search: String, callBack: @escaping (Result<ImageDataList, Error>) -> Void) {
        
        let urlString = String(format: "\(URLDefault)\(url)", search)
        guard let url = URL(string: urlString) else {
            callBack(.failure(Err.Default))
            return
        }
        let apiRequest = APIRequest(url)
        
        APICalling().fetch(apiRequest: apiRequest, callBack: callBack)
    }
}
