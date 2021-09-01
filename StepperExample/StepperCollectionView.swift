//
//  StepperCollectionView.swift
//  StepperExample
//
//  Created by Salah on 9/28/20.
//  Copyright © 2020 Salah. All rights reserved.
//

import UIKit

open class StepperStyle{
    var indicatorCornerRadius:CGFloat=2
    var indicatorSpace:CGFloat=0
    var indicatorHeight:CGFloat=2

    var spaceBetweenItems:CGFloat=UIScreen.main.bounds.width/5;
    var contentSize:CGFloat=50;
    var subtitleFont:UIFont?
    var titleColor:UIColor?
    var subtitleColor:UIColor?
    var selectedColor:UIColor?
    var defaultColor:UIColor?

    var borderTitleColor:UIColor?
    var borderTitleFont:UIFont?

    var selectedIndicatorColor:UIColor?
    var notSelectedIndicatorColor:UIColor?
    
    func indicatorCornerRadius(_ indicatorCornerRadius:CGFloat)->Self{
    self.indicatorCornerRadius=indicatorCornerRadius
    return self;
    }
    func indicatorHeight(_ indicatorHeight:CGFloat)->Self{
    self.indicatorHeight=indicatorHeight
    return self;
    }
    func indicatorSpace(_ indicatorSpace:CGFloat)->Self{
    self.indicatorSpace=indicatorSpace
    return self;
    }
    func contentSize(_ contentSize:CGFloat)->Self{
    self.contentSize=contentSize
    return self;
    }
    func spaceBetweenItems(_ spaceBetweenItems:CGFloat)->Self{
    self.spaceBetweenItems=spaceBetweenItems
    return self;
    }
    func subtitleFont(_ subtitleFont:UIFont)->Self{
    self.subtitleFont=subtitleFont
    return self;
    }
    func titleColor(_ titleColor:UIColor)->Self{
    self.titleColor=titleColor
    return self;
    }
    func subtitleColor(_ subtitleColor:UIColor)->Self{
    self.subtitleColor=subtitleColor
    return self;
    }
    func selectedColor(_ selectedColor:UIColor)->Self{
    self.selectedColor=selectedColor
    return self;
    }
    func defaultColor(_ defaultColor:UIColor)->Self{
    self.defaultColor=defaultColor
    return self;
    }
    func selectedIndicatorColor(_ selectedIndicatorColor:UIColor)->Self{
    self.selectedIndicatorColor=selectedIndicatorColor
    return self;
    }
    func notSelectedIndicatorColor(_ notSelectedIndicatorColor:UIColor)->Self{
    self.notSelectedIndicatorColor=notSelectedIndicatorColor
    return self;
    }
    func borderTitleColor(_ borderTitleColor:UIColor)->Self{
    self.borderTitleColor=borderTitleColor
    return self;
    }
    func borderTitleFont(_ borderTitleFont:UIFont)->Self{
    self.borderTitleFont=borderTitleFont
    return self;
    }
}
enum Coentnt{
  case imageWithTitle(selected:UIImage,notSelected:UIImage,title:String)
  case image(selected:UIImage,notSelected:UIImage)
  case circle
  case radiobutton
  case border(UIImage?=nil,String?=nil)
  case title(String)
}
class StepperITem:NSObject{
    var subtitle:String?
    var content:Coentnt?
    init(_ subtitle:String,_ content:Coentnt?) {
        super.init();
        self.subtitle=subtitle;
        self.content=content;
    }
}

class StepperCollectionView: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var selectedIndex:Int=0;
    typealias ActionHandler = (Int,StepperITem)->Void
    var actionHandler:ActionHandler?
    var style:StepperStyle=StepperStyle();
    var objects:[StepperITem]=[StepperITem]();
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objects.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"StepperCollectionViewCell", for: indexPath);
        var stepperItem = self.objects[indexPath.row];
        (cell as? StepperCollectionViewCell)?.config( indexPath, stepperItem, self);
        return cell;
    }
    override func awakeFromNib() {
        super.awakeFromNib();
        self.delegate=self;
        self.dataSource=self;
        self.register(UINib.init(nibName:"StepperCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:"StepperCollectionViewCell");
//        let layout = KTCenterFlowLayout()
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
//        layout.scrollDirection = .horizontal;
//        self.setCollectionViewLayout(layout, animated: false)
//        UICollectionViewController(collectionViewLayout: layout)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width:self.style.spaceBetweenItems, height:self.frame.size.height);
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}



//
//  CenteredCollectionViewFlowLayout.swift
//  CenteredCollectionView
//
//  Created by Benjamin Emdon on 2016-09-05.
//  Copyright © 2016 Benjamin Emdon.
//
import UIKit

public extension UICollectionView {
    /// A convenient way to create a UICollectionView and configue it with a CenteredCollectionViewFlowLayout.
    ///
    /// - Parameters:
    ///   - frame: The frame rectangle for the collection view, measured in points. The origin of the frame is relative to the superview in which you plan to add it. This frame is passed to the superclass during initialization.
    ///   - centeredCollectionViewFlowLayout: The `CenteredCollectionViewFlowLayout` for the `UICollectionView` to be configured with.
    convenience init(frame: CGRect = .zero, centeredCollectionViewFlowLayout: CenteredCollectionViewFlowLayout) {
        self.init(frame: frame, collectionViewLayout: centeredCollectionViewFlowLayout)
        decelerationRate = UIScrollView.DecelerationRate.fast
    }
}

/// A `UICollectionViewFlowLayout` that _pages_ and keeps its cells centered, resulting in the _"carousel effect"_ 🎡
open class CenteredCollectionViewFlowLayout: UICollectionViewFlowLayout {
    private var lastCollectionViewSize: CGSize = CGSize.zero
    private var lastScrollDirection: UICollectionView.ScrollDirection!
    private var lastItemSize: CGSize = CGSize.zero
    var pageWidth: CGFloat {
        switch scrollDirection {
        case .horizontal:
            return itemSize.width + minimumLineSpacing
        case .vertical:
            return itemSize.height + minimumLineSpacing
        default:
            return 0
        }
    }
    
    /// Calculates the current centered page.
    public var currentCenteredPage: Int? {
        guard let collectionView = collectionView else { return nil }
        let currentCenteredPoint = CGPoint(x: collectionView.contentOffset.x + collectionView.bounds.width/2, y: collectionView.contentOffset.y + collectionView.bounds.height/2)
        
        return collectionView.indexPathForItem(at: currentCenteredPoint)?.row
    }
    
    public override init() {
        super.init()
        scrollDirection = .horizontal
        lastScrollDirection = scrollDirection
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        scrollDirection = .horizontal
        lastScrollDirection = scrollDirection
    }
    
    override open func invalidateLayout(with context: UICollectionViewLayoutInvalidationContext) {
        super.invalidateLayout(with: context)
        guard let collectionView = collectionView else { return }
        
        // invalidate layout to center first and last
        let currentCollectionViewSize = collectionView.bounds.size
        if !currentCollectionViewSize.equalTo(lastCollectionViewSize) || lastScrollDirection != scrollDirection || lastItemSize != itemSize {
            switch scrollDirection {
            case .horizontal:
                let inset = (currentCollectionViewSize.width - itemSize.width) / 2
                collectionView.contentInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
                collectionView.contentOffset = CGPoint(x: -inset, y: 0)
            case .vertical:
                let inset = (currentCollectionViewSize.height - itemSize.height) / 2
                collectionView.contentInset = UIEdgeInsets(top: inset, left: 0, bottom: inset, right: 0)
                collectionView.contentOffset = CGPoint(x: 0, y: -inset)
            default:
                collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                collectionView.contentOffset = .zero
            }
            lastCollectionViewSize = currentCollectionViewSize
            lastScrollDirection = scrollDirection
            lastItemSize = itemSize
        }
    }
    
    override open func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return proposedContentOffset }
        
        let proposedRect: CGRect = determineProposedRect(collectionView: collectionView, proposedContentOffset: proposedContentOffset)
        
        guard let layoutAttributes = layoutAttributesForElements(in: proposedRect),
            let candidateAttributesForRect = attributesForRect(
                collectionView: collectionView,
                layoutAttributes: layoutAttributes,
                proposedContentOffset: proposedContentOffset
            ) else { return proposedContentOffset }
        
        var newOffset: CGFloat
        let offset: CGFloat
        switch scrollDirection {
        case .horizontal:
            newOffset = candidateAttributesForRect.center.x - collectionView.bounds.size.width / 2
            offset = newOffset - collectionView.contentOffset.x
            
            if (velocity.x < 0 && offset > 0) || (velocity.x > 0 && offset < 0) {
                let pageWidth = itemSize.width + minimumLineSpacing
                newOffset += velocity.x > 0 ? pageWidth : -pageWidth
            }
            return CGPoint(x: newOffset, y: proposedContentOffset.y)
            
        case .vertical:
            newOffset = candidateAttributesForRect.center.y - collectionView.bounds.size.height / 2
            offset = newOffset - collectionView.contentOffset.y
            
            if (velocity.y < 0 && offset > 0) || (velocity.y > 0 && offset < 0) {
                let pageHeight = itemSize.height + minimumLineSpacing
                newOffset += velocity.y > 0 ? pageHeight : -pageHeight
            }
            return CGPoint(x: proposedContentOffset.x, y: newOffset)
            
        default:
            return .zero
        }
    }
    
    /// Programmatically scrolls to a page at a specified index.
    ///
    /// - Parameters:
    ///   - index: The index of the page to scroll to.
    ///   - animated: Whether the scroll should be performed animated.
    public func scrollToPage(index: Int, animated: Bool) {
        guard let collectionView = collectionView else { return }
        
        let proposedContentOffset: CGPoint
        let shouldAnimate: Bool
        switch scrollDirection {
        case .horizontal:
            let pageOffset = CGFloat(index) * pageWidth - collectionView.contentInset.left
            proposedContentOffset = CGPoint(x: pageOffset, y: collectionView.contentOffset.y)
            shouldAnimate = abs(collectionView.contentOffset.x - pageOffset) > 1 ? animated : false
        case .vertical:
            let pageOffset = CGFloat(index) * pageWidth - collectionView.contentInset.top
            proposedContentOffset = CGPoint(x: collectionView.contentOffset.x, y: pageOffset)
            shouldAnimate = abs(collectionView.contentOffset.y - pageOffset) > 1 ? animated : false
        default:
            proposedContentOffset = .zero
            shouldAnimate = false
        }
        collectionView.setContentOffset(proposedContentOffset, animated: shouldAnimate)
    }
}

private extension CenteredCollectionViewFlowLayout {
    
    func determineProposedRect(collectionView: UICollectionView, proposedContentOffset: CGPoint) -> CGRect {
        let size = collectionView.bounds.size
        let origin: CGPoint
        switch scrollDirection {
        case .horizontal:
            origin = CGPoint(x: proposedContentOffset.x, y: collectionView.contentOffset.y)
        case .vertical:
            origin = CGPoint(x: collectionView.contentOffset.x, y: proposedContentOffset.y)
        default:
            origin = .zero
        }
        return CGRect(origin: origin, size: size)
    }
    
    func attributesForRect(
        collectionView: UICollectionView,
        layoutAttributes: [UICollectionViewLayoutAttributes],
        proposedContentOffset: CGPoint
        ) -> UICollectionViewLayoutAttributes? {
        
        var candidateAttributes: UICollectionViewLayoutAttributes?
        let proposedCenterOffset: CGFloat
        
        switch scrollDirection {
        case .horizontal:
            proposedCenterOffset = proposedContentOffset.x + collectionView.bounds.size.width / 2
        case .vertical:
            proposedCenterOffset = proposedContentOffset.y + collectionView.bounds.size.height / 2
        default:
            proposedCenterOffset = .zero
        }
        
        for attributes in layoutAttributes {
            guard attributes.representedElementCategory == .cell else { continue }
            guard candidateAttributes != nil else {
                candidateAttributes = attributes
                continue
            }
            
            switch scrollDirection {
            case .horizontal where abs(attributes.center.x - proposedCenterOffset) < abs(candidateAttributes!.center.x - proposedCenterOffset):
                candidateAttributes = attributes
            case .vertical where abs(attributes.center.y - proposedCenterOffset) < abs(candidateAttributes!.center.y - proposedCenterOffset):
                candidateAttributes = attributes
            default:
                continue
            }
        }
        return candidateAttributes
    }
}
