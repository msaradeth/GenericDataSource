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
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = viewModel.dataSource
        collectionView.register(MasterCell.self, forCellWithReuseIdentifier: MasterCell.cellIdentifier)
        return collectionView
    }()
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        return flowLayout
    }()
    var cellWidth: CGFloat {
        let width = (collectionView.superview?.bounds.width ?? UIScreen.main.bounds.width) - 40
        print("width: ", width)
        return width
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
        flowLayout.estimatedItemSize.width = cellWidth
    }
    
    
    //MARK:  Rotation
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        flowLayout.estimatedItemSize.width = cellWidth
        flowLayout.invalidateLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

