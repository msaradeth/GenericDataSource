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
        //init
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
        
        //setup flowLayout
        flowLayout.sectionInset.left = 0
        flowLayout.sectionInset.right = 0
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 4
        flowLayout.sectionInsetReference = UICollectionViewFlowLayout.SectionInsetReference.fromSafeArea
        //setup header
        flowLayout.headerReferenceSize = CGSize(width: collectionView.bounds.width, height: 50)
        flowLayout.sectionHeadersPinToVisibleBounds = true

        //setup CollectionView
        collectionView.alwaysBounceVertical = true
        collectionView.indicatorStyle = UICollectionView.IndicatorStyle.default
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = viewModel.dataSource
        collectionView.delegate = self
        
        //Register cells
        collectionView.register(SelfSizingDelegateCell.self, forCellWithReuseIdentifier: SelfSizingDelegateCell.cellIdentifier)
        collectionView.register(SelfSizingHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SelfSizingHeaderView.cellIdentifier)
        
        return collectionView
    }()
    lazy var searchController: UISearchController = {
//        let resultsTableController = SelfSizingDelegateVC(title: "Search", viewModel: self.viewModel)
//        let searchController = UISearchController(searchResultsController: resultsTableController)
//        searchController.searchResultsUpdater = self
//        searchController.searchBar.autocapitalizationType = .none
//
//
////        searchController.delegate = self
//        searchController.dimsBackgroundDuringPresentation = false // The default is true.
////        searchController.searchBar.delegate = self // Monitor when the search button is tapped.
////
//        /** Search presents a view controller by applying normal view controller presentation semantics.
//         This means that the presentation moves up the view controller hierarchy until it finds the root
//         view controller or one that defines a presentation context.
//         */
//
//        /** Specify that this view controller determines how the search controller is presented.
//         The search controller should be presented modally and match the physical size of this view controller.
//         */
//        definesPresentationContext = true
//
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search"
        searchController.definesPresentationContext = true
        
        return searchController
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
        
        self.navigationItem.searchController = searchController
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

extension SelfSizingDelegateVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        print(searchText)
        print(viewModel.dataSource.items)
//        viewModel.dataSource.items = viewModel.dataSource.items.filter({$0.contains(where: searchText)})
        collectionView.reloadData()
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
