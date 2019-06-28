//
//  ViewController.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 6/27/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .gray
        return collectionView
    }()
    
    init(dataSource: UICollectionViewDataSource) {
        super.init(nibName: nil, bundle: nil)
        collectionView.dataSource = dataSource
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(collectionView)
        collectionView.fillsuperView()
        collectionView.backgroundColor = .white
        
        collectionView.register(MasterCell.self, forCellWithReuseIdentifier: MasterCell.cellIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

