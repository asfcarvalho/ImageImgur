//
//  ImageListViewModel.swift
//  ImageImgur
//
//  Created by Anderson F Carvalho on 21/07/20.
//  Copyright © 2020 asfcarvalho. All rights reserved.
//

import UIKit

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
                imageList.append(Image(imageUrl: images.first?.link, title: images.first?.title))
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
    
    func getImageSize(_ collectionView: UICollectionView) -> CGSize {
        let orientation = UIApplication.shared.statusBarOrientation
        if(orientation == .landscapeLeft || orientation == .landscapeRight) {
            if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
                return CGSize(width: (collectionView.frame.size.width-24)/4, height: (collectionView.frame.size.height-8) * 0.55)
            } else {
                return CGSize(width: (collectionView.frame.size.width-24)/4, height: (collectionView.frame.size.height-8) * 0.60)
            }
        }
        else {
            if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
                return CGSize(width: (collectionView.frame.size.width-16)/3, height: (collectionView.frame.size.height-8)/3)
            } else {
                return CGSize(width: (collectionView.frame.size.width-8)/2, height: (collectionView.frame.size.height-8)/3)
            }
        }
    }
}
