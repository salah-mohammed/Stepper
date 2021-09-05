//
//  StepperEx.swift
//  Stepper
//
//  Created by Salah on 9/5/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import Foundation
extension Bundle{
        static var module: Bundle? = {
            
            //firstBundle -> this will used when libarary used in example
            if let firstBundle = Bundle(path: "\(Bundle.main.bundlePath)/Frameworks/Stepper.framework/Stepper.bundle"),FileManager.default.fileExists(atPath: firstBundle.bundlePath){
            
        return firstBundle
        }else
            //secondBundle -> this will used when libarary used in pods
    if let secondBundle:Bundle = Bundle(path: "\(Bundle.main.bundlePath)/Frameworks/Stepper.framework"),FileManager.default.fileExists(atPath: secondBundle.bundlePath){
                return secondBundle;
        }
          return nil
        }()
}
