//
//  ImageListVC.swift
//  ImageImgur
//
//  Created by Anderson F Carvalho on 20/07/20.
//  Copyright © 2020 asfcarvalho. All rights reserved.
//

import UIKit
import MySPM

typealias RowCell = (IndexPath) -> UICollectionViewCell

struct Section {
    var rows: [RowCell]
}

class ImageListVC: UIViewController {
    
    private let imageListViewModel = ImageListViewModel()
    private let cellName = "cell"
    private let cellWidth = (UIScreen.main.bounds.width * 0.5)
    
    private lazy var collectionView: UICollectionView = {
        let layoutCollection = UICollectionViewFlowLayout()
        layoutCollection.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layoutCollection.minimumInteritemSpacing = 8
        layoutCollection.minimumLineSpacing = 8
        let collection = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layoutCollection)
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
        fetchData()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImageListCell.self, forCellWithReuseIdentifier: cellName)
    }
    
    private func setupView() {
        view.backgroundColor = .white
        collectionView.backgroundColor = .clear
        
        setupCollectionView()
        
        view.AddSubviews([collectionView])
        
        setupAnchors()
    }
    
    private func setupAnchors() {
        collectionView
            .TopToSuperview(margin: 16)
            .LeadingToSuperview(margin: 16)
            .TrailingToSuperview(margin: 16)
            .BottomToSuperview(margin: 16)
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
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension ImageListVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageListViewModel.getNumberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as? ImageListCell else {
            return UICollectionViewCell()
        }
        
        cell.awakeFromNib()
        cell.setupCell(imageListViewModel.imageList[indexPath.row].imageUrl)
        
        return cell
    }
}

extension ImageListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return imageListViewModel.getImageSize(collectionView)
    }
}
