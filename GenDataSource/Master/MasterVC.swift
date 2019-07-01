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
        let flowLayout = UICollectionViewFlowLayout()   //ColumnFlowLayout(minColumnWidth: 150, cellHeight: 80)
        flowLayout.sectionInset.left = 0
        flowLayout.sectionInset.right = 0
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 4
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
        
        collectionView.alwaysBounceVertical = true
        collectionView.indicatorStyle = UICollectionView.IndicatorStyle.default
        
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = viewModel.dataSource
        
        collectionView.register(MasterCell.self, forCellWithReuseIdentifier: MasterCell.cellIdentifier)
        collectionView.register(UINib(nibName: "MasterCell2", bundle: nil), forCellWithReuseIdentifier: MasterCell2.cellIdentifier)
        return collectionView
    }()


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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if collectionView.numberOfItems(inSection: 0) > 0 {
            collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
        }
    }

    
    
    //MARK:  Rotation
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            flowLayout.invalidateLayout()
            collectionView.reloadData()            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//
//extension MasterVC: UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return viewModel.items.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return viewModel.items[section].count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MasterCell2.cellIdentifier, for: indexPath) as! MasterCell2
//
//        cell.configure(item: viewModel.items[indexPath.section][indexPath.row])
//        return cell
//    }
//}
