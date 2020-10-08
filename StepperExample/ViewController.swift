//
//  ViewController.swift
//  StepperExample
//
//  Created by Salah on 9/28/20.
//  Copyright © 2020 Salah. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet var firstStepperCollectionView:StepperCollectionView!
    @IBOutlet var secondStepperCollectionView:StepperCollectionView!
    @IBOutlet var thiredStepperCollectionView:StepperCollectionView!
    @IBOutlet var forthStepperCollectionView:StepperCollectionView!

    @IBOutlet weak var fifthStepperCollectionView: StepperCollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFirst();
        setupSecond();
//        setupThired();
        setupForth();
        setupFifth();
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
        secondStepperCollectionView.style=StepperStyle().defaultColor(UIColor.black).selectedColor(UIColor.red).notSelectedIndicatorColor(UIColor.black).selectedIndicatorColor(UIColor.red).notSelectedIndicatorColor(UIColor.black).contentSize(50).titleColor(UIColor.white).subtitleColor(UIColor.orange)
        secondStepperCollectionView.reloadData();
        secondStepperCollectionView.actionHandler = { (item1,item2) in
    
            
        }
    }
//    func setupThired(){
//        thiredStepperCollectionView.objects=[
//            StepperITem("First",.image(selected:UIImage.init(named:"")!, notSelected: UIImage.init(named:"")!)),
//            StepperITem("Second",.image(selected:UIImage.init(named:"")!, notSelected: UIImage.init(named:"")!)),
//            StepperITem("Thired",.image(selected:UIImage.init(named:"")!, notSelected: UIImage.init(named:"")!)),
//            StepperITem("Forth",.image(selected:UIImage.init(named:"")!, notSelected: UIImage.init(named:"")!)),
//            StepperITem("Fifth",.image(selected:UIImage.init(named:"")!, notSelected: UIImage.init(named:"")!))]
//        thiredStepperCollectionView.style=StepperStyle().defaultColor(UIColor.black).selectedColor(UIColor.red).notSelectedIndicatorColor(UIColor.black).selectedIndicatorColor(UIColor.red).notSelectedIndicatorColor(UIColor.black).contentSize(30);
//        thiredStepperCollectionView.reloadData();
//        thiredStepperCollectionView.actionHandler = { (item1,item2) in
//    
//        }
//    }
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
}

