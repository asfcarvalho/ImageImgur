//
//  ImageListVC.swift
//  ImageImgur
//
//  Created by Anderson F Carvalho on 20/07/20.
//  Copyright © 2020 asfcarvalho. All rights reserved.
//

import UIKit
import MySPM

class ImageListVC: UIViewController {
    
    private let imageListViewModel = ImageListViewModel()
    private let cellName = "cell"
    
    private lazy var collectionView: UICollectionView = {
        let layoutCollection = UICollectionViewFlowLayout()
        layoutCollection.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let viewWidth = view.frame.width / 2 - 18
        layoutCollection.itemSize = CGSize(width: viewWidth , height: viewWidth)
        layoutCollection.minimumInteritemSpacing = 4
        layoutCollection.minimumLineSpacing = 4
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layoutCollection)
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
        fetchData()
    }
    
    private func setupView() {
        view.backgroundColor = .red
        
        view.AddSubviews([collectionView])
        
        setupAnchors()
    }
    
    private func setupAnchors() {
        collectionView.EdgeToSuperView()
    }
    
    private func fetchData() {
        imageListViewModel.fetchData { [weak self] success in
            if success {
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            } else {
                print("DO ALERT")
            }
        }
    }
}

extension ImageListVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageListViewModel.getNumberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        guard let coll = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as? UICollectionViewCell else {
            return UICollectionViewCell()
        }
        
//        let gallery = galleryViewModel?.gallery[indexPath.row]
//
//        coll.setupCell(searchText, gallery?.id ?? "", gallery?.imageData)
        
        return coll
    }
}
