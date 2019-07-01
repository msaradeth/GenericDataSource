//
//  MasterCell.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 6/27/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

struct Book {
    var title: String
    var description: String
}


class MasterCell: UICollectionViewCell, CellProtocol, SelfSizingCellProtocol {
    typealias DataType = Contact
    static var cellIdentifier: String = "MasterCell"
    var padding = UIEdgeInsets(top: 0, left:0, bottom: 0, right: 0)
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        titleLabel.numberOfLines = 0
        titleLabel.backgroundColor = UIColor.yellow.withAlphaComponent(0.4)
        return titleLabel
    }()
    lazy var detailLabel: UILabel = {
        let detailLabel = UILabel(frame: .zero)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.numberOfLines = 0
        detailLabel.backgroundColor = UIColor.cyan.withAlphaComponent(0.4)
        return detailLabel
    }()
    lazy var contentViewWidthConstraint: NSLayoutConstraint = {
//        let contentViewWidthConstraint = self.contentView.widthAnchor.constraint(lessThanOrEqualToConstant: max(UIScreen.main.bounds.width, UIScreen.main.bounds.height))
        let contentViewWidthConstraint = self.contentView.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width)
        return contentViewWidthConstraint
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    func configure(item: Contact) {
        titleLabel.text = item.firstName
        detailLabel.text = item.lastName
    }
    
    func setupViews() {
        contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.fillsuperView()
        contentViewWidthConstraint.isActive = true
        
        contentView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding.left).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding.right).isActive = true
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        contentView.addSubview(detailLabel)
        detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding.top).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding.left).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding.right).isActive = true
        detailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding.bottom).isActive = true
    }
    
    
    //MARK: Self sizing cell - Calc Width and Height
//
//    override func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
//        return super.systemLayoutSizeFitting(targetSize)
//    }
//
//    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//        super.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
//        guard let collectionView = superview as? UICollectionView else { return targetSize }
//
//        //calc CellWidth base on number of column
//        let numberofColumns = UIDevice.current.orientation.isPortrait ? 1 : 4
//        let cellWidth = collectionView.getCellWidth(numberOfColumns: numberofColumns)
//
//        //set contentView width Constraint
//        contentViewWidthConstraint.isActive = false
//        contentViewWidthConstraint.constant = cellWidth
//        contentViewWidthConstraint.isActive = true
//        
//        setNeedsLayout()
//        layoutIfNeeded()
//        
//        //calc cellHeight
//        let size = contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
//
//        let cellSize = CGSize(width: cellWidth, height: size.height)
//        print("systemLayoutSizeFitting: cellSize: ", cellSize, "  size:", size)
//
//        contentViewWidthConstraint.isActive = false
//        
//        return cellSize
//    }
//    
    override func prepareForReuse() {
        titleLabel.text = nil
        detailLabel.text = nil
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension MasterCell {
    static public func getCellHeight(item: Contact, cellWidth: CGFloat, numberOfColumns: Int) -> CGFloat {
        //setup cell
        let cell = MasterCell()
        cell.configure(item: item)

        //set contentView width constraint
        cell.contentViewWidthConstraint.constant = cellWidth
                
        //calc cell height
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        let size = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingExpandedSize)
    
        return size.height
    }
}


