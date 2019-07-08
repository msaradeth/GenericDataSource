//
//  MainVC.swift
//  NavBarAndHeader
//
//  Created by Mike Saradeth on 6/27/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

let items = DataSource.getData()
let items2 = DataSource.getData2x2()

class MainVC: UICollectionViewController {
    var items = [
        "Collection View"
    ]

    init(flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()) {
        flowLayout.sectionInset.left = 40
        flowLayout.sectionInset.right = 40
        super.init(collectionViewLayout: flowLayout)
        title = "CollectionView"

        setupViews()
    }
    
    func setupViews() {
        collectionView.backgroundColor = .white
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: MainCell.reuseIdentifier)
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: collectionView.frame.width, height: 100)
            flowLayout.invalidateLayout()
        }
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCell.reuseIdentifier, for: indexPath) as! MainCell
        // Configure the cell
        cell.configure(title: items[indexPath.row])
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
            
        case 0:            
            let dataSource = GenericDataSource<Contact, SelfSizingDelegateCell>(values3: items2, cellIdentifierHeader: SelfSizingHeaderView.cellIdentifier) { (header, title) in
                if let header = header as? SelfSizingHeaderView {
                    header.configure(title: title)
                }             
            }
            let viewModel = SelfSizingDeletateViewModel(dataSource: dataSource)
            let vc = SelfSizingDelegateVC(title: "Contacts", viewModel: viewModel)
            self.navigationController?.pushViewController(vc, animated: true)
            
        default:
            break
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: collectionView.frame.width, height: 100)
            flowLayout.invalidateLayout()
        }
    }
    
    
    
    
    
    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
////        collectionView.reloadData()
//        collectionView.collectionViewLayout.invalidateLayout()
//        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        flowLayout.invalidateLayout()
//    }

    
//    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        //        layout.estimatedItemSize = CGSize(width: view.bounds.size.width, height: 10)
//        //        layout.headerReferenceSize = .init(width: view.bounds.size.width, height: 30)
//        //        layout.invalidateLayout()
//
//        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        flowLayout.invalidateLayout()
//        //        collectionView.collectionViewLayout.invalidateLayout()
//        super.traitCollectionDidChange(previousTraitCollection)
//    }
    
    // MARK: layout - set estimated width to collection view width (minus content inset etc)
    //    lazy var layout: UICollectionViewFlowLayout = {
    //        let layout = EstimatedWidthCellsFlowLayout()
    //        layout.headerReferenceSize = .init(width: view.bounds.size.width, height: 30)
    //        layout.scrollDirection = .vertical
    //        return layout
    //    }()
    //

    

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
