//
//  ViewController.swift
//  StepperExample
//
//  Created by Salah on 9/28/20.
//  Copyright © 2020 Salah. All rights reserved.
//

import UIKit
import Stepper

class ViewController: UIViewController {
    @IBOutlet var firstStepperCollectionView:StepperCollectionView!
    @IBOutlet var secondStepperCollectionView:StepperCollectionView!
    @IBOutlet var thiredStepperCollectionView:StepperCollectionView!
    @IBOutlet var forthStepperCollectionView:StepperCollectionView!

    @IBOutlet weak var fifthStepperCollectionView: StepperCollectionView!
    @IBOutlet weak var sixthStepperCollectionView: StepperCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        setupFirst();
//        setupSecond();
//        setupThired();
//        setupForth();
//        setupFifth();
        setupSixth();
        // Do any additional setup after loading the view.
    }
    func setupFirst(){
        firstStepperCollectionView.objects=[StepperITem("First", .circle),StepperITem("Second",.circle),StepperITem("Thired",.circle),StepperITem("Forth",.circle),StepperITem("Fifth",.circle)]
        firstStepperCollectionView.style=StepperStyle().defaultColor(UIColor.black).selectedColor(UIColor.red).notSelectedIndicatorColor(UIColor.black).selectedIndicatorColor(UIColor.red).notSelectedIndicatorColor(UIColor.black).contentSize(50);
        firstStepperCollectionView.reloadData();
        firstStepperCollectionView.actionHandler = { (item1,item2) in
    
        }
    }
    func setupSecond(){
        secondStepperCollectionView.objects=[StepperITem("First", .title("1")),StepperITem("Second",.title("2")),StepperITem("Thired",.title("3")),StepperITem("Forth",.title("4")),StepperITem("Fifth",.title("4"))]
        secondStepperCollectionView.style=StepperStyle().defaultColor(UIColor.black).selectedColor(UIColor.red).notSelectedIndicatorColor(UIColor.black).selectedIndicatorColor(UIColor.red).notSelectedIndicatorColor(UIColor.black).contentSize(50).defaultTitleColor(UIColor.white).defaultSubtitleColor(UIColor.orange)
        secondStepperCollectionView.reloadData();
        secondStepperCollectionView.actionHandler = { (item1,item2) in
    
            
        }
    }
    func setupThired(){
        thiredStepperCollectionView.objects=[
            StepperITem("First",.image(selected:UIImage.init(named:"ic_checked")!, notSelected: UIImage.init(named:"ic_notChecked")!)),
            StepperITem("Second",.image(selected:UIImage.init(named:"ic_checked")!, notSelected: UIImage.init(named:"ic_notChecked")!)),
            StepperITem("Thired",.image(selected:UIImage.init(named:"ic_checked")!, notSelected: UIImage.init(named:"ic_notChecked")!)),
            StepperITem("Forth",.image(selected:UIImage.init(named:"ic_checked")!, notSelected: UIImage.init(named:"ic_notChecked")!)),
            StepperITem("Fifth",.image(selected:UIImage.init(named:"ic_checked")!, notSelected: UIImage.init(named:"ic_notChecked")!))]
        thiredStepperCollectionView.style=StepperStyle().defaultColor(UIColor.clear).selectedColor(UIColor.clear).notSelectedIndicatorColor(UIColor.clear).selectedIndicatorColor(UIColor.clear).notSelectedIndicatorColor(UIColor.clear).contentSize(30).selectedTitleColor(UIColor.red)
        thiredStepperCollectionView.reloadData();
        thiredStepperCollectionView.actionHandler = { (item1,item2) in
    
        }
    }
    func setupForth(){
        forthStepperCollectionView.objects=[StepperITem("First", .radiobutton),StepperITem("Second",.radiobutton),StepperITem("Thired",.radiobutton),StepperITem("Forth",.radiobutton),StepperITem("Fifth",.radiobutton)]
        forthStepperCollectionView.style=StepperStyle().defaultColor(UIColor.black).selectedColor(UIColor.red).notSelectedIndicatorColor(UIColor.black).selectedIndicatorColor(UIColor.red).notSelectedIndicatorColor(UIColor.black).contentSize(50);
        forthStepperCollectionView.reloadData();
        forthStepperCollectionView.actionHandler = { (item1,item2) in
    
        }
    }
    func setupFifth(){
        fifthStepperCollectionView.objects=[StepperITem("First", .border(nil,"1")),StepperITem("Second",.border(nil,"2")),StepperITem("Thired",.border(nil,"3")),StepperITem("Forth",.border(nil,"4")),StepperITem("Fifth",.border())]
        fifthStepperCollectionView.style=StepperStyle().defaultColor(UIColor.black).selectedColor(UIColor.red).notSelectedIndicatorColor(UIColor.black).selectedIndicatorColor(UIColor.red).notSelectedIndicatorColor(UIColor.black).contentSize(50).borderTitleColor(.orange)
        fifthStepperCollectionView.reloadData();
        fifthStepperCollectionView.actionHandler = { (item1,item2) in
    
        }
    }
    func setupSixth(){
        var selectedImage = UIImage.init(named:"ic_checked")!;
        var notSelectedImage = UIImage.init(named:"ic_notChecked")!;
       
        var first = Coentnt.imageWithTitle(selected: selectedImage, notSelected: notSelectedImage, current:nil, title:"1");
        var second = Coentnt.imageWithTitle(selected: selectedImage, notSelected: notSelectedImage, current:nil, title:"2");
        var thired = Coentnt.imageWithTitle(selected: selectedImage, notSelected: notSelectedImage, current:nil, title:"3");
        var forth = Coentnt.imageWithTitle(selected: selectedImage, notSelected: notSelectedImage, current:nil, title:"4");
        var fifth = Coentnt.imageWithTitle(selected: selectedImage, notSelected: notSelectedImage, current:nil, title:"5");

        sixthStepperCollectionView.objects=[
            StepperITem("First",first),
            StepperITem("Second",second),
            StepperITem("Thired",thired),
            StepperITem("Forth",forth),
            StepperITem("Fifth",fifth)]
        sixthStepperCollectionView.style=StepperStyle().indicatorCornerRadius(5).indicatorHeight(6).indicatorSpace(5).defaultColor(UIColor.clear).selectedColor(UIColor.clear).notSelectedIndicatorColor(UIColor.init(named:"#B5D5ED")!).selectedIndicatorColor(UIColor.init(named:"#3AB000")!).contentSize(30).currentColor(UIColor.init(named:"#3AB000")!).selectedTitleColor(UIColor.init(named:"#B5D5ED")!).currentTitleColor(UIColor.white).defaultSubtitleColor(UIColor.init(named:"#B5D5ED")!).selectedSubtitleColor(UIColor.init(named:"#3AB000")!).currentSubtitleColor(UIColor.init(named:"#3AB000")!)
        sixthStepperCollectionView.reloadData();
        sixthStepperCollectionView.actionHandler = { (item1,item2) in
    
        }
        sixthStepperCollectionView.selectedIndex=1;
    }
}

