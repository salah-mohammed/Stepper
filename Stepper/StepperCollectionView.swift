//
//  StepperCollectionView.swift
//  StepperExample
//
//  Created by Salah on 9/28/20.
//  Copyright © 2020 Salah. All rights reserved.
//

import UIKit
open class StepperStyle:NSObject{
    open var indicatorCornerRadius:CGFloat=2
    open var indicatorSpace:CGFloat=0
    open var indicatorHeight:CGFloat=2

    open var spaceBetweenItems:CGFloat?;
    open var contentSize:CGFloat=50;
    open var subtitleFont:UIFont?
    // titleColor
    open var defaultTitleColor:UIColor?
    open var selectedTitleColor:UIColor?
    open var currentTitleColor:UIColor?
    // subtitleColor
    open var defaultSubtitleColor:UIColor?
    open var selectedSubtitleColor:UIColor?
    open var currentSubtitleColor:UIColor?

    //background of element
    open var selectedColor:UIColor?
    open var currentColor:UIColor?
    open var defaultColor:UIColor?
    open var borderTitleColor:UIColor?
    open var borderTitleFont:UIFont?
    open var selectedIndicatorColor:UIColor?
    open var notSelectedIndicatorColor:UIColor?
    
    public override init() {
        super.init();
    }
    open func indicatorCornerRadius(_ indicatorCornerRadius:CGFloat)->Self{
    self.indicatorCornerRadius=indicatorCornerRadius
    return self;
    }
    open func indicatorHeight(_ indicatorHeight:CGFloat)->Self{
    self.indicatorHeight=indicatorHeight
    return self;
    }
    open func indicatorSpace(_ indicatorSpace:CGFloat)->Self{
    self.indicatorSpace=indicatorSpace
    return self;
    }
    open func contentSize(_ contentSize:CGFloat)->Self{
    self.contentSize=contentSize
    return self;
    }
    open func spaceBetweenItems(_ spaceBetweenItems:CGFloat)->Self{
    self.spaceBetweenItems=spaceBetweenItems
    return self;
    }
    open func subtitleFont(_ subtitleFont:UIFont)->Self{
    self.subtitleFont=subtitleFont
    return self;
    }
    open func defaultTitleColor(_ defaultTitleColor:UIColor)->Self{
    self.defaultTitleColor=defaultTitleColor
    return self;
    }
    open func selectedSubtitleColor(_ selectedSubtitleColor:UIColor)->Self{
    self.selectedSubtitleColor=selectedSubtitleColor
    return self;
    }
    open func currentSubtitleColor(_ currentSubtitleColor:UIColor)->Self{
    self.currentSubtitleColor=currentSubtitleColor
    return self;
    }
    open func selectedTitleColor(_ selectedTitleColor:UIColor)->Self{
    self.selectedTitleColor=selectedTitleColor
    return self;
    }
    open func currentTitleColor(_ currentTitleColor:UIColor)->Self{
    self.currentTitleColor=currentTitleColor
    return self;
    }
    open func defaultSubtitleColor(_ defaultSubtitleColor:UIColor?)->Self{
    self.defaultSubtitleColor=defaultSubtitleColor
    return self;
    }
    open func selectedColor(_ selectedColor:UIColor)->Self{
    self.selectedColor=selectedColor
    return self;
    }
    open func currentColor(_ currentColor:UIColor)->Self{
    self.currentColor=currentColor
    return self;
    }
    open func defaultColor(_ defaultColor:UIColor)->Self{
    self.defaultColor=defaultColor
    return self;
    }
    open func selectedIndicatorColor(_ selectedIndicatorColor:UIColor)->Self{
    self.selectedIndicatorColor=selectedIndicatorColor
    return self;
    }
    open func notSelectedIndicatorColor(_ notSelectedIndicatorColor:UIColor)->Self{
    self.notSelectedIndicatorColor=notSelectedIndicatorColor
    return self;
    }
    open func borderTitleColor(_ borderTitleColor:UIColor)->Self{
    self.borderTitleColor=borderTitleColor
    return self;
    }
    open func borderTitleFont(_ borderTitleFont:UIFont)->Self{
    self.borderTitleFont=borderTitleFont
    return self;
    }
}
public enum Coentnt{
  case imageWithTitle(selected:UIImage,notSelected:UIImage,current:UIImage?,title:String)
  case image(selected:UIImage,notSelected:UIImage)
  case circle
  case radiobutton
  case border(UIImage?=nil,String?=nil)
  case title(String)
}
public class StepperITem:NSObject{
    open  var subtitle:String?
    open var content:Coentnt?
    public init(_ subtitle:String,_ content:Coentnt?) {
        super.init();
        self.subtitle=subtitle;
        self.content=content;
    }
}

open class StepperCollectionView: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    public var selectedIndex:Int=0;
    public typealias ActionHandler = (Int,StepperITem)->Void
    public var actionHandler:ActionHandler?
    public var style:StepperStyle=StepperStyle();
    public var objects:[StepperITem]=[StepperITem]();
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objects.count;
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"StepperCollectionViewCell", for: indexPath);
        var stepperItem = self.objects[indexPath.row];
        (cell as? StepperCollectionViewCell)?.config( indexPath, stepperItem, self);
        return cell;
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           
           // Translated from Objective-C version at: http://stackoverflow.com/a/27656363/309736
           
        let cellCount = CGFloat(self.objects.count)
           
           if cellCount > 0 {
               let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
               let cellWidth = flowLayout.itemSize.width + flowLayout.minimumInteritemSpacing
               let totalCellWidth = self.cellWidth() * cellCount
               let contentWidth = collectionView.frame.size.width - collectionView.contentInset.left - collectionView.contentInset.right
               
               if (totalCellWidth < contentWidth) {
                   let padding = (contentWidth - totalCellWidth) / 2.0
                   return UIEdgeInsets.init(top: 0, left: padding, bottom: 0, right: padding)
               }
           }
           
        return UIEdgeInsets.zero
       }
    open override func awakeFromNib() {
        super.awakeFromNib();
        self.delegate=self;
        self.dataSource=self;
        self.register(UINib.init(nibName:"StepperCollectionViewCell", bundle:Bundle.module), forCellWithReuseIdentifier:"StepperCollectionViewCell");
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal;
        self.setCollectionViewLayout(layout, animated: false)
        (self.collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize = UICollectionViewFlowLayout.automaticSize
    }
    func cellWidth()->CGFloat{
        let value = (Float.lessNumberAbleToDivideIt(upper:Float(self.frame.width), lower: Float(self.objects.count))/Float(self.objects.count))
        return (self.style.spaceBetweenItems ?? CGFloat(value))
    }
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width:self.cellWidth(), height:self.frame.size.height);
    }
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
    return 0
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
    return 0
    }
}

extension Float{
   static func lessNumberAbleToDivideIt(upper:Float,lower:Float)->Float{
        // a,b are ints
        var value = upper;
        var reminder:Float=0
       if upper.remainder(dividingBy:lower) != 0{
       repeat {
            reminder = upper.remainder(dividingBy:lower)
            if  reminder == 0 {
                break;
            }else{
                value = value-1
                //All non-integer values go here
            }
            
        }while (value > 0) && (reminder == 0)
        return value;
       }else{
        return upper;
       }
    }
}
