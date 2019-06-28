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
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = viewModel.dataSource
        collectionView.register(MasterCell.self, forCellWithReuseIdentifier: MasterCell.cellIdentifier)
        return collectionView
    }()
    var flowLayout = UICollectionViewFlowLayout()
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
    }
    
    func setCellWidth() {
        var cellWidth = collectionView.bounds.width - 40
        if cellWidth < 0 {
            cellWidth = UIScreen.main.bounds.width
        }
        
        flowLayout.estimatedItemSize = CGSize(width: cellWidth, height: 200)
        print("set CellWidth", cellWidth)
    }
    
    //MARK:  Rotation
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        setCellWidth()
        flowLayout.invalidateLayout()
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setCellWidth()
        flowLayout.invalidateLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCellWidth()
        
    }


}

