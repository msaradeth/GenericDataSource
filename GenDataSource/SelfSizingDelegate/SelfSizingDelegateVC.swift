//
//  ViewController.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 6/27/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

class SelfSizingDelegateVC: UIViewController {
    lazy var collectionView: UICollectionView = {
        //setup flowLayout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset.left = 0
        flowLayout.sectionInset.right = 0
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 4
        flowLayout.sectionInsetReference = UICollectionViewFlowLayout.SectionInsetReference.fromSafeArea

        //setup CollectionView
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
        collectionView.alwaysBounceVertical = true
        collectionView.indicatorStyle = UICollectionView.IndicatorStyle.default
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = viewModel.dataSource
        collectionView.delegate = self
        collectionView.register(SelfSizingDelegateCell.self, forCellWithReuseIdentifier: SelfSizingDelegateCell.cellIdentifier)
        return collectionView
    }()


    //MARK: viewModel
    var viewModel: SelfSizingDeletateViewModel
    
    //MARK: init and setup
    init(title: String, viewModel: SelfSizingDeletateViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = title
        setupViews()
    }
    func setupViews() {
        view.addSubview(collectionView)
        collectionView.fillsuperView()
    }
    
    
    
    //MARK:  Rotation
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {

            flowLayout.invalidateLayout()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}


extension SelfSizingDelegateVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelfSizingDelegateCell.cellIdentifier, for: indexPath) as! SelfSizingDelegateCell
        
        //calc width base on numberOfColumns
        let numberOfColumns = UIDevice.current.orientation.isPortrait ? 1 : 4
        let cellWidth = collectionView.getCellWidth(numberOfColumns: numberOfColumns)
        //get cell size base on content
        let size = cell.getCellSize(cellWidth: cellWidth, item: viewModel[indexPath])
        
        return size
    }
}
