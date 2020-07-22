//
//  ImageListCell.swift
//  ImageImgur
//
//  Created by Anderson F Carvalho on 21/07/20.
//  Copyright © 2020 asfcarvalho. All rights reserved.
//

import UIKit
import MySPM
import Nuke

class ImageListCell: UICollectionViewCell {
    
    private lazy var bodyView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
         view.layer.shadowColor = UIColor.black.cgColor
         view.layer.shadowRadius = 3
         view.layer.shadowOffset = CGSize(width: 2, height: 2)
         view.layer.shadowOpacity = 0.2
        return view
    }()
    
    private lazy var galeryImage: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        
        galeryImage.clipsToBounds = true
        galeryImage.layer.cornerRadius = 6
        
        bodyView.AddSubviews([galeryImage])
        
        AddSubviews([bodyView])
        
        setupAnchors()
    }
    
    private func setupAnchors() {
        bodyView.EdgeToSuperView()
        galeryImage.EdgeToSuperView()
    }
    
    func setupCell(_ image: String?) {
        guard let image = image, let url = URL(string: image) else { return }
        let options = ImageLoadingOptions(
            placeholder: UIImage(named: "placeholder"),
            transition: .fadeIn(duration: 0.33)
        )
        Nuke.loadImage(with: url, options: options, into: galeryImage)
    }
}
