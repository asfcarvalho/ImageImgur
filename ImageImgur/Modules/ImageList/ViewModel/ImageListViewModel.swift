//
//  ImageListViewModel.swift
//  ImageImgur
//
//  Created by Anderson F Carvalho on 21/07/20.
//  Copyright © 2020 asfcarvalho. All rights reserved.
//

import Foundation

class ImageListViewModel {
    var imageList: [Image] = []
    
    struct Image {
        let imageUrl: String?
        let title: String?
    }
    
    private func setupData(_ imageDataList: ImageDataList?) {
        guard let imageDataList = imageDataList?.data else { return }
        
        imageDataList.forEach { imageData in
            if let images = imageData.images {
                images.forEach {
                    imageList.append(Image(imageUrl: $0.link, title: $0.title))
                }
            }
        }
    }
    
    func fetchData(_ success: @escaping (Bool) -> Void) {
        ImageListDataSource.shared.galleryFetch("cats") { [weak self] result in
            switch result {
            case .success(let imageDataList):
                self?.setupData(imageDataList)
                success(true)
                break
            case .failure(let error):
                print(error.localizedDescription)
                success(false)
                break
            }
        }
    }
    
    func getNumberOfRows() -> Int {
        return imageList.count
    }
}
