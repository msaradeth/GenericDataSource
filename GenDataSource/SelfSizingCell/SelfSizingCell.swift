//
//  SelfSizingCell.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 7/2/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation

//
//  SelfSizingCell.swift
//  GenDataSource
//
//  Created by Mike Saradeth on 6/27/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit



class SelfSizingCell: UICollectionViewCell, CellProtocol {
    typealias DataType = Contact
    static var cellIdentifier: String = "SelfSizingCell"
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
    
    //MARK: Self sizing cell - call height
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        super.preferredLayoutAttributesFitting(layoutAttributes)
//        guard let collectionView = superview as? UICollectionView else { return layoutAttributes }
        
//        let cellWidth = collectionView.getCellWidth(numberOfColumns: SelfSizingCellVC.numberOfColumns)
//        contentViewWidthConstraint.constant = cellWidth
//        if !contentViewWidthConstraint.isActive {
//            contentViewWidthConstraint.isActive = true
//        }
        
        //calc height
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        
        //set height
//        layoutAttributes.frame.size = CGSize(width: cellWidth, height: size.height)
        layoutAttributes.frame.size.height = size.height
        
        return layoutAttributes
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




