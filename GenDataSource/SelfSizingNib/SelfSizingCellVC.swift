//
//  SelfSizingCellVC.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 7/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//


import UIKit

//
//  SelfSizingCellNibfileVC.swift
//  NavBarAndHeader
//
//  Created by Mike Saradeth on 6/27/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit




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
        collectionView.register(UINib(nibName: "MasterCell2", bundle: nil), forCellWithReuseIdentifier: MasterCell2.cellIdentifier)
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



//MARK:  UICollectionViewDataSource
//extension SelfSizingCellVC {
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return listOfItems.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        item.description = listOfItems[indexPath.row]
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCell2.cellIdentifier, for: indexPath) as! DetailCell2
//        cell.configure(item: item)
//        return cell
//    }
//
//}

//MARK: UICollectionViewDelegateFlowLayout
//extension SelfSizingCellVC: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: DetailHeader.defaultHeight)
//    }
//
//}




//
//class SelfSizingCellVC: UIViewController {
//    var cellWidth: CGFloat {
//        if UIDevice.current.orientation.isLandscape {
//            return (collectionView.bounds.width - 40) / 3
//        }else {
//            return collectionView.bounds.width - 40
//        }
//    }
//    lazy var collectionView: UICollectionView = {
//        //setup flowlayout
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.sectionInset.left = 0
//        flowLayout.sectionInset.right = 0
//        flowLayout.minimumInteritemSpacing = 10
//        flowLayout.minimumLineSpacing = 4
//        flowLayout.sectionInsetReference = UICollectionViewFlowLayout.SectionInsetReference.fromSafeArea
//
//        //setup CollectionView
//        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
//        collectionView.alwaysBounceVertical = true
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.backgroundColor = .white
//        collectionView.dataSource = viewModel.dataSource
//        collectionView.register(UINib(nibName: "MasterCell2", bundle: nil), forCellWithReuseIdentifier: MasterCell2.cellIdentifier)
//        return collectionView
//    }()
//
//    //MARK: viewModel
//    var viewModel: SelfSizingCellViewModel
//
//    //MARK: init and setup
//    init(title: String, viewModel: SelfSizingCellViewModel) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//        self.title = title
//        setupViews()
//    }
//    func setupViews() {
//        view.addSubview(collectionView)
//        collectionView.fillsuperView()
//        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.estimatedItemSize = CGSize(width: cellWidth, height: 100)
//        }
//    }
//
//    //MARK:  Rotation
//    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        super.traitCollectionDidChange(previousTraitCollection)
//        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.estimatedItemSize = CGSize(width: cellWidth, height: 100)
//            flowLayout.invalidateLayout()
//        }
//    }
//
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//}

//
//extension SelfSizingCellVC: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MasterCell.cellIdentifier, for: indexPath) as! MasterCell
//
//        let numberOfColumns = UIDevice.current.orientation.isPortrait ? 1 : 4
//        //        let size = collectionView.getCellSize(cell: cell, item: viewModel[indexPath], numberOfColumns: numberOfColumns)
//        let size = cell.getCellSize(collectionView: collectionView, item: viewModel[indexPath], numberOfColumns: numberOfColumns)
//
//        return size
//    }
//}

