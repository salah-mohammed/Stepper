//
//  BaseInheritance.swift
//  Jobs
//
//  Created by Salah on 11/14/18.
//  Copyright © 2018 Salah. All rights reserved.
//

import Foundation
import UIKit
 class RoundedLabel: UILabel {
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2.0
    }
}

 class RoundedView: UIView {
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2.0
    }
}

 class RoundedUIImageView: UIImageView {
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2.0
    }
}

 class RoundedUIButton: UIButton {
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2.0
    }
}
