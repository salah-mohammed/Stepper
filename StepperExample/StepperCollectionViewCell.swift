//
//  StepperCollectionViewCell.swift
//  StepperExample
//
//  Created by Salah on 9/28/20.
//  Copyright © 2020 Salah. All rights reserved.
//

import UIKit

extension UIView{
    public func bs_roundCorners(_ corners: UIRectCorner,_ radius: CGFloat) {
         let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         layer.mask = mask
     }
    public func bs_roundCornersRespectLanauge(_ corners: UIRectCorner,_ radius: CGFloat) {
        var internalCorners=corners
        if UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft {
            if internalCorners.contains(.topRight){
                internalCorners.remove(.topRight)
                internalCorners.insert(.topLeft)
            }
            if internalCorners.contains(.topLeft){
            internalCorners.remove(.topLeft)
            internalCorners.insert(.topRight)
            }
            if  internalCorners.contains(.bottomRight){
                internalCorners.remove(.bottomRight)
                internalCorners.insert(.bottomLeft)
            }
            if  internalCorners.contains(.bottomLeft){
                internalCorners.remove(.bottomLeft)
                internalCorners.insert(.bottomRight)
            }
        }else{

        }
        self.bs_roundCorners(internalCorners, radius);
     }
}
class StepperCollectionViewCell: UICollectionViewCell {
    var item:StepperITem?;
    var stepper:StepperCollectionView?
    var indexPath:IndexPath?

    @IBOutlet weak var viewRadioButton: RoundedView!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var viewTrailingIndicator: UIView!
    @IBOutlet weak var viewLeadingIndicator: UIView!
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblBorderTitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var viewBorderView: RoundedView!
    @IBOutlet weak var layoutConstraintWidthContent: NSLayoutConstraint!
    @IBOutlet weak var imgBorderImage: UIImageView!
    @IBOutlet weak var stackViewIndicator: UIStackView!
    @IBOutlet weak var layoutConstraintHeightOfIndicatorView: NSLayoutConstraint!

    @IBAction func btnAction(_ sender: Any) {
        if let item:StepperITem=item,let indexPath:IndexPath=indexPath{
            stepper?.actionHandler?(indexPath.row,item)
            self.stepper?.selectedIndex=indexPath.row;
            stepper?.reloadData();
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews();
        DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
            self.viewLeadingIndicator.bs_roundCornersRespectLanauge([.topRight,.bottomRight], self.stepper?.style.indicatorCornerRadius ?? 0)
            self.viewTrailingIndicator.bs_roundCornersRespectLanauge([.topLeft,.bottomLeft], self.stepper?.style.indicatorCornerRadius ?? 0)
            self.viewLeadingIndicator.clipsToBounds=true
            self.viewTrailingIndicator.clipsToBounds=true
        }
    }
    open func config(_ indexPath:IndexPath,_ item:StepperITem,_ stepper:StepperCollectionView){
        self.indexPath=indexPath;
        self.item=item;
        self.stepper=stepper;
        self.lblSubTitle.text=item.subtitle ?? "";
        self.lblSubTitle.font=stepper.style.subtitleFont;
        self.lblSubTitle.textColor=stepper.style.subtitleColor
        self.stackViewIndicator.spacing = stepper.style.indicatorSpace;
        self.viewContent.layer.borderWidth=0
        self.layoutConstraintHeightOfIndicatorView.constant = stepper.style.indicatorHeight;

        switch item.content!{
  
        case .imageWithTitle(selected: let selected, notSelected: let notSelected, title: let title):
            self.style(selectedHanadler: {
                self.img.image=selected
                self.viewContent.backgroundColor=stepper.style.selectedColor;
                self.lblTitle.text=title;

            }) {
                self.img.image=notSelected
                self.viewContent.backgroundColor=stepper.style.defaultColor;
                self.lblTitle.text=title;

            }
            self.lblTitle.isHidden=false;
            self.img.isHidden=false;
            self.viewBorderView.isHidden=true;
            self.viewRadioButton.isHidden=true;
            break;
        case .image(selected: let selected, notSelected: let notSelected):
            self.style(selectedHanadler: {
                self.img.image=selected
                self.viewContent.backgroundColor=stepper.style.selectedColor;

            }) {
                self.img.image=notSelected
                self.viewContent.backgroundColor=stepper.style.defaultColor;

            }
            self.lblTitle.isHidden=true;
            self.img.isHidden=false;
            self.viewBorderView.isHidden=true;
            self.viewRadioButton.isHidden=true;
           
            break;
        case .circle:
            self.lblTitle.isHidden=true;
            self.img.isHidden=true;
            self.viewBorderView.isHidden=true;
            self.viewRadioButton.isHidden=true;
            self.style(selectedHanadler: {
                self.viewContent.backgroundColor=stepper.style.selectedColor;
            }) {
                self.viewContent.backgroundColor=stepper.style.defaultColor;
            }
            break;
        case .title(let title):
            self.lblTitle.text=title;
            self.lblTitle.textColor=self.stepper?.style.titleColor
            self.lblTitle.isHidden=false;
            self.img.isHidden=true;
            self.viewBorderView.isHidden=true;
            self.viewRadioButton.isHidden=true;
            self.style(selectedHanadler: {
                self.viewContent.backgroundColor=stepper.style.selectedColor;
            }) {
                self.viewContent.backgroundColor=stepper.style.defaultColor;
            }
            break;
        case .radiobutton:
            self.viewBorderView.isHidden=true;
            self.img.isHidden=true;
            self.lblTitle.isHidden=true;
            self.viewRadioButton.isHidden=false;
            
            self.viewContent.layer.borderWidth=2
            self.style(selectedHanadler: {
            self.viewRadioButton.backgroundColor=stepper.style.selectedColor;
            self.viewContent.layer.borderColor=stepper.style.selectedColor?.cgColor
            }) {
            self.viewRadioButton.backgroundColor=stepper.style.defaultColor;
            self.viewContent.layer.borderColor=stepper.style.defaultColor?.cgColor
            }
            self.viewContent.backgroundColor=UIColor.clear;
            break;
        case .border(let image,let title):
            self.viewBorderView.isHidden=false;
            self.img.isHidden=true;
            self.lblTitle.isHidden=true;
            self.viewRadioButton.isHidden=true;
            self.imgBorderImage.image=image;
            self.lblBorderTitle.text=title;
            self.lblBorderTitle.textColor=stepper.style.borderTitleColor;
            self.lblBorderTitle.font=stepper.style.borderTitleFont;
            self.style(selectedHanadler: {
                self.viewContent.backgroundColor=stepper.style.selectedColor;
            }) {
                self.viewContent.backgroundColor=stepper.style.defaultColor;
            }
            break;
        }
        
    

        self.layoutConstraintWidthContent.constant=stepper.style.contentSize;
        indicatorStyle();
    }
    func indicatorStyle(){
        if let indexPath:IndexPath=self.indexPath,let item:StepperITem=self.item,let stepper:StepperCollectionView=self.stepper{
        let index = self.indexPath?.row
        self.viewLeadingIndicator.isHidden=false
        self.viewTrailingIndicator.isHidden=false
        if index == 0 {
        self.viewLeadingIndicator.isHidden=true
        }else
        if index == stepper.objects.count - 1{
        self.viewTrailingIndicator.isHidden=true
        }
        // indicators
        if stepper.selectedIndex == self.indexPath?.row ?? 0  && stepper.selectedIndex == 0{
        self.viewLeadingIndicator.backgroundColor=stepper.style.notSelectedIndicatorColor;
        self.viewTrailingIndicator.backgroundColor=stepper.style.notSelectedIndicatorColor;
        }else
        if index == stepper.objects.count - 1 && stepper.selectedIndex == index{
        self.viewLeadingIndicator.backgroundColor=stepper.style.selectedIndicatorColor;
        self.viewTrailingIndicator.backgroundColor=stepper.style.selectedIndicatorColor;
        }else
        if stepper.selectedIndex < self.indexPath?.row ?? 0 {
        self.viewLeadingIndicator.backgroundColor=stepper.style.notSelectedIndicatorColor;
        self.viewTrailingIndicator.backgroundColor=stepper.style.notSelectedIndicatorColor;
        }else if stepper.selectedIndex == self.indexPath?.row ?? 0 {
        self.viewLeadingIndicator.backgroundColor=stepper.style.selectedIndicatorColor;
        self.viewTrailingIndicator.backgroundColor=stepper.style.notSelectedIndicatorColor;
        }else{
        self.viewLeadingIndicator.backgroundColor=stepper.style.selectedIndicatorColor;
        self.viewTrailingIndicator.backgroundColor=stepper.style.selectedIndicatorColor;
        }
        }
    }
    func style(selectedHanadler:()->Void,unselectedHanadler:()->Void){
        if self.stepper?.selectedIndex ?? 0 < self.indexPath?.row ?? 0 {
        unselectedHanadler();
        }else{
        selectedHanadler();
        }
    }
}
