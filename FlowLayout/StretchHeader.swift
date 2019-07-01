//
//  StretchHeaderFlowLayout.swift
//  NavBarAndHeader
//
//  Created by Mike Saradeth on 6/24/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

//MARK: UICollectionViewLayoutAttributes
class StretchHeader: UICollectionViewFlowLayout {
    
    var contentBounds = CGRect.zero
    var cachedAttributes = [UICollectionViewLayoutAttributes]()
    var numberOfColumns: CGFloat {
        return UIDevice.current.orientation.isPortrait ? 1 : 2
    }
    override func prepare() {
        
        guard let collectionView = collectionView else { return }
        
        // Reset cached information.
        cachedAttributes.removeAll()
        contentBounds = CGRect(origin: .zero, size: collectionView.bounds.size)
        
        // For every item in the collection view:
        //  - Prepare the attributes.
        //  - Store attributes in the cachedAttributes array.
        //  - Combine contentBounds with attributes.frame.
        let count = collectionView.numberOfItems(inSection: 0)
        
        var currentIndex = 0
        var segment = self.numberOfColumns  //MosaicSegmentStyle = .fullWidth
        var lastFrame: CGRect = .zero
        
        let cvWidth = collectionView.bounds.size.width
        
        
        
        
        while currentIndex < count {
            let segmentFrame = CGRect(x: 0, y: lastFrame.maxY + 1.0, width: cvWidth, height: 200.0)
            
//            var segmentRects = [CGRect]()
//            if segment == 1 {
//                segmentRects = [segmentFrame]
//            }else {
//                let horizontalSlices = segmentFrame.dividedIntegral(fraction: 0.5, from: .minXEdge)
//                segmentRects = [horizontalSlices.first, horizontalSlices.second]
//            }
        }
        
//        // Create and cache layout attributes for calculated frames.
//        for rect in segmentRects {
//            let attributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: currentIndex, section: 0))
//            attributes.frame = rect
//
//            cachedAttributes.append(attributes)
//            contentBounds = contentBounds.union(lastFrame)
//
//            currentIndex += 1
//            lastFrame = rect
//        }
//
//        // Determine the next segment style.
//        if segment == 1 {
//            segmentRects = [segmentFrame]
//        }else {
//            let horizontalSlices = segmentFrame.dividedIntegral(fraction: 0.5, from: .minXEdge)
//            segmentRects = [horizontalSlices.first, horizontalSlices.second]
//        }
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect),
            let contentOffset = collectionView?.contentOffset else { return nil }

        for attribute in attributes {
            guard attribute.representedElementKind == UICollectionView.elementKindSectionHeader
                && attribute.indexPath.section == 0 else { continue }

            //Stretch Header base on collectionview contentOffset.y
            if contentOffset.y < 0 {    //scrolling up
                let offset = abs(contentOffset.y)
                let x = -offset * 0.5  //move left => Take half of offset
                let y = -offset        //move down
                let width = attribute.frame.width + offset      //add width
                let height = attribute.frame.height + offset    //add height
                
                attribute.frame = CGRect(x: x, y: y, width: width, height: height)
            }
        }
        return attributes
    }
    
    
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
}
