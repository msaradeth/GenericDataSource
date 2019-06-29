//
//  ViewController.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 6/27/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class MasterVC: UIViewController {
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = viewModel.dataSource
        
//        collectionView.register(MasterCell.self, forCellWithReuseIdentifier: MasterCell.cellIdentifier)
        collectionView.register(UINib(nibName: "MasterCell2", bundle: nil), forCellWithReuseIdentifier: MasterCell2.cellIdentifier)
        return collectionView
    }()
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset.left = 0
        flowLayout.sectionInset.right = 0
        flowLayout.minimumInteritemSpacing = 2
        flowLayout.minimumLineSpacing = 4
        return flowLayout
    }()
    
    var estimatedItemSize: CGSize {
//        return UICollectionViewFlowLayout.automaticSize
        
        let numberOfColumns = UIDevice.current.orientation == .portrait ? 1 : 1
        let itemWidth = flowLayout.getItemWidth(width: view.frame.width, numberOfColumns: numberOfColumns)
        print("preferredLayout", itemWidth, collectionView.frame.width, itemWidth)
        return CGSize(width: itemWidth, height: 100)
    }
    var viewModel: MasterViewModel
    
    //MARK: init and setup
    init(title: String, viewModel: MasterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = title
        setupViews()
    }
    func setupViews() {
        view.addSubview(collectionView)
        collectionView.fillsuperView()
        flowLayout.estimatedItemSize = estimatedItemSize
    }
    
    
    //MARK:  Rotation
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        flowLayout.estimatedItemSize = estimatedItemSize
        flowLayout.invalidateLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

