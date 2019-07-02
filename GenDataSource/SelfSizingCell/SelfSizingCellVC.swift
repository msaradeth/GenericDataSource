//
//  SelfSizingCellVC.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 7/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit


//Not working yet
class SelfSizingCellVC: UICollectionViewController {
    var cellWidth: CGFloat {
        if UIDevice.current.orientation.isLandscape {
            return collectionView.getCellWidth(numberOfColumns: 3)
        }else {
            return collectionView.getCellWidth(numberOfColumns: 1)
        }
    }
    
    var viewModel: SelfSizingCellViewModel
    
    //MARK: init and setup
    init(title: String, viewModel: SelfSizingCellViewModel) {
        self.viewModel = viewModel
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset.left = 0
        flowLayout.sectionInset.right = 0
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 4
        flowLayout.sectionInsetReference = UICollectionViewFlowLayout.SectionInsetReference.fromSafeArea
        
        super.init(collectionViewLayout: flowLayout)
        collectionView.dataSource = viewModel.dataSource
        
        self.title = title
        setupViews()
    }
    
    
    func setupViews() {
        collectionView.backgroundColor = .white
        collectionView.register(SelfSizingCell.self, forCellWithReuseIdentifier: SelfSizingCell.cellIdentifier)
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: cellWidth, height: 100)
            flowLayout.invalidateLayout()
        }
    }
    
    
    // MARK: rotation
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: cellWidth, height: 100)
            flowLayout.invalidateLayout()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



//class SelfSizingCellVC: UICollectionViewController {
////    lazy var collectionView: UICollectionView = {
////        //setup flowlayout
////        let flowLayout = UICollectionViewFlowLayout()
////        flowLayout.sectionInset.left = 0
////        flowLayout.sectionInset.right = 0
////        flowLayout.minimumInteritemSpacing = 10
////        flowLayout.minimumLineSpacing = 4
////        flowLayout.sectionInsetReference = UICollectionViewFlowLayout.SectionInsetReference.fromSafeArea
////
////        //setup collectionView
////        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)
////        collectionView.alwaysBounceVertical = true
////        collectionView.translatesAutoresizingMaskIntoConstraints = false
////        collectionView.backgroundColor = .white
////        collectionView.dataSource = viewModel.dataSource
////        collectionView.register(SelfSizingCell.self, forCellWithReuseIdentifier: SelfSizingCell.cellIdentifier)
////
////        return collectionView
////    }()
//    
//    var cellWidth: CGFloat {
//        if UIDevice.current.orientation.isLandscape {
//            return collectionView.getCellWidth(numberOfColumns: 3)
//        }else {
//            return collectionView.getCellWidth(numberOfColumns: 1)
//        }
//    }
//    
//    
//    //MARK: viewModel
//    var viewModel: SelfSizingCellViewModel
//    
//    //MARK: init and setup
//    init(title: String, viewModel: SelfSizingCellViewModel) {
//        self.viewModel = viewModel
//        
//        //setup flowlayout
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.sectionInset.left = 0
//        flowLayout.sectionInset.right = 0
//        flowLayout.minimumInteritemSpacing = 10
//        flowLayout.minimumLineSpacing = 4
//        flowLayout.sectionInsetReference = UICollectionViewFlowLayout.SectionInsetReference.fromSafeArea
//        super.init(collectionViewLayout: flowLayout)
//        self.title = title
//        setupViews()
//    }
//    func setupViews() {
//        collectionView.register(SelfSizingCell.self, forCellWithReuseIdentifier: SelfSizingCell.cellIdentifier)
//        collectionView.dataSource = viewModel.dataSource
//        collectionView.backgroundColor = .white
//        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.estimatedItemSize = CGSize(width: cellWidth, height: 200)
//        }
//    }
//    
//    
//    
//    //MARK:  Rotation
//    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        super.traitCollectionDidChange(previousTraitCollection)
//        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.estimatedItemSize = CGSize(width: cellWidth, height: 200)
//            flowLayout.invalidateLayout()
//        }
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}
//
////
////extension SelfSizingCellVC: UICollectionViewDelegateFlowLayout {
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelfSizingDelegateCell.cellIdentifier, for: indexPath) as! SelfSizingDelegateCell
////
////        let numberOfColumns = UIDevice.current.orientation.isPortrait ? 1 : 4
////        //        let size = collectionView.getCellSize(cell: cell, item: viewModel[indexPath], numberOfColumns: numberOfColumns)
////        let size = cell.getCellSize(collectionView: collectionView, item: viewModel[indexPath], numberOfColumns: numberOfColumns)
////
////        return size
////    }
////}
