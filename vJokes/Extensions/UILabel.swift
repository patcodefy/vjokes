//
//  UILabel.swift
//  vJokes
//
//  Created by Patrick Iradukunda on 3/6/20.
//  Copyright © 2020 pat. All rights reserved.
//

import UIKit

extension UILabel {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
}
