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


class SelfSizingDelegateCell: UICollectionViewCell, CellProtocol {
    typealias DataType = Contact
    static var cellIdentifier: String = "SelfSizingDelegateCell"
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
        let contentViewWidthConstraint = self.contentView.widthAnchor.constraint(lessThanOrEqualToConstant: 0)
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
    
    
    override func prepareForReuse() {
        titleLabel.text = nil
        detailLabel.text = nil
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension SelfSizingDelegateCell {
    func getCellSize(cellWidth: CGFloat, item: DataType) -> CGSize {
        //set up cell
        configure(item: item)
        
        //Temporary activate and set contentViewWidthConstraint prior to calc CellHeight
        contentViewWidthConstraint.constant = cellWidth
        contentViewWidthConstraint.isActive = true
        
        //calc cell height
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        
        //Deactive contentViewWidthConstraint
        contentViewWidthConstraint.isActive = false
        
        return CGSize(width: cellWidth, height: size.height)
    }
    
   
}


