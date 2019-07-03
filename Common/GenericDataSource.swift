//
//  GenericDataSource.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 6/28/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit



public typealias DidSelectItemCallback = (IndexPath) -> Void
public typealias ConfigurableHeader = ((UICollectionReusableView, String)->())

//Generic DataSource Class
open class GenericDataSource<Element, CellType:UICollectionViewCell>: NSObject, UICollectionViewDataSource
    where CellType: CellProtocol, Element == CellType.DataType {
    
    fileprivate var cellIdentifierHeader: String
    fileprivate var configureHeader: ConfigurableHeader?
    
    //MARK: init and setup
    var items: [[Element]]
    
    public init(values2: [[Element]], configureHeader: ConfigurableHeader? = nil, cellIdentifierHeader: String = "HeaderId") {
        self.items = values2
        self.cellIdentifierHeader = cellIdentifierHeader
        self.configureHeader = configureHeader
    }    
    convenience public init(values: [Element], configureHeader: ConfigurableHeader? = nil, cellIdentifierHeader: String = "HeaderId") {
        self.init(values2: [values], configureHeader: configureHeader, cellIdentifierHeader: cellIdentifierHeader)
    }



    ///MARK: UICollectionViewDataSource
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items[section].count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellType.cellIdentifier, for: indexPath) as? CellType
            else { fatalError("CellType.Element Not Equall GenericDataSource.Element") }
        
        cell.configure(item: items[indexPath.section][indexPath.row])
        return cell
    }
    

    //MARK: header and footer
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: cellIdentifierHeader, for: indexPath)
        
        let title = "Section: \(indexPath.section)"
        configureHeader?(header, title)        
        return header
    }
}



