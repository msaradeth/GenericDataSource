//
//  GenericDataSource.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 6/28/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit

//enum CellType {
//    case CellType1
//    case CellType2
//}
//protocol CollectionViewConfiguration{
//    var sectionCount:Int {get}
//    var itemCount:(Int)->Int {get}
//    var cellConfig:(IndexPath)->CollectionCellConfiguration? {get}
//}
//protocol CollectionCellConfiguration {
//    var configure:(UICollectionViewCell)->Void{get}
//    var identifier:String {get}
//}

//struct ContactCollectionConfiguration:CollectionViewConfiguration{
//    var sectionCount: Int{
//        return 1
//    }
//    
//    var itemCount: (Int) -> Int{
//        return {
//            section in
//            guard section == 0 else {return 0}
//            return self.items.count
//        }
//    }
//    var cellConfig: (IndexPath) -> CollectionCellConfiguration?{
//        return { path in
//            let contact = self.items[path.row]
//            return ContactCellConfig.init(item: contact, delegate: <#T##ViewModelDelegate#>)
//        }
//    }
//    var items:[Contact]
//}
//

//struct ContactCellConfig:CollectionCellConfiguration{
//    var configure: (UICollectionViewCell) -> Void{
//        return {cell in
//            if let cell = cell as? SelfSizingDelegateCell{
//                cell.configure(item: self.item, delelegate: self.delegate)
//            }
//
//        }
//    }
//    var identifier: String{
//        return "Contact"
//    }
//    var item:Contact
//    var delegate:ViewModelDelegate
//}

//public class Datasource:NSObject, UICollectionViewDataSource{
//    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.config.itemCount(section)
//    }
//    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let configuration = self.config.cellConfig(indexPath)!
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: configuration.identifier, for: indexPath)
//        configuration.configure(cell)
//        return cell
//    }
//    public func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return config.sectionCount
//    }
//    var config:CollectionViewConfiguration
//    init(configuration:CollectionViewConfiguration) {
//        self.config = configuration
//    }
//}


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
    
    public init(values3: [[Element]], cellIdentifierHeader: String = "HeaderId", _ configureHeader: ConfigurableHeader? = nil) {
        self.items = values3
        self.cellIdentifierHeader = cellIdentifierHeader
        self.configureHeader = configureHeader
//        self.init(values2: values3, configureHeader: configureHeader, cellIdentifierHeader: cellIdentifierHeader)
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



