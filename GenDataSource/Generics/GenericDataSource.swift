//
//  GenericDataSource.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 6/28/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit


//GenericCell Protocol
public protocol CellProtocol {
    associatedtype Element
    static var cellIdentifier: String {get}
    func configure(item: Element)
}

public typealias DidSelectItemCallback = (IndexPath) -> Void

//Generic DataSource Class
open class GenericDataSource<Element, CellType:UICollectionViewCell>: NSObject, UICollectionViewDataSource
    where CellType: CellProtocol, Element == CellType.Element {
    
    //MARK: init and setup
    var items: [[Element]]
    
    public init(values: [Element]) {
        self.items = [values]
    }
    public init(values2: [[Element]]) {
        self.items = values2
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
    
    
}







//class TestGeneric: UIViewController {
//
//    func test() {
//        var dataSource: GenericDataSource<Contact, MasterCell>
//        let arr: [Contact] = []
//        dataSource = GenericDataSource<Contact, MasterCell>(values: arr)
//
//
//        let arr2: [[Contact]] = []
//        var dataSource2: GenericDataSource<Contact, MasterCell>
//        dataSource2 = GenericDataSource<Contact, MasterCell>(values2: arr2)
//    }
//}








////Generic DataSource Protocol
//public protocol DataSourceProtocol {
//    func numberOfSections() -> Int
//    func numberOfItemsInSection(section: Int) -> Int
//    func cellForItemAt(indexPath: IndexPath) -> UICollectionViewCell?
//}


////Generic DataSource Class
//open class GenericDataSource<DataSource: DataSourceProtocol, Cell: UICollectionViewCell>: NSObject, UICollectionViewDataSource, UICollectionViewDelegate
//    where Cell: CellProtocol, DataSource.T == Cell.T  {
//
//    //MARK: Did select item callback delegate
//    public var didSelectItemCallback: DidSelectItemCallback?
//
//    //MARK: setup and init
//    var dataSource: DataSource
//
//    init(dataSource: DataSource) {
//        self.dataSource = dataSource
//        super.init()
//    }
//
//    //MARK: UICollectionViewDataSource
//    public func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return dataSource.numberOfSections()
//    }
//
//    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dataSource.numberOfItemsInSection(section: section)
//    }
//
//    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.cellIdentifier, for: indexPath) as? Cell else { return UICollectionViewCell() }
//
//        if let item = dataSource.cellForItemAt(indexPath: indexPath) {
//            cell.configure(item: item, indexPath: indexPath)
//        }
//        return cell
//    }
//
//
//    //MARK: UICollectionViewDelegates
//    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        didSelectItemCallback?(indexPath)
//    }
//
//}

