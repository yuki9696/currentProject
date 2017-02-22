//
//  CustomButton.swift
//  TableViewjerd
//
//  Created by Yuki Yamamoto on 2017/02/12.
//  Copyright © 2017年 yuki yamamoto. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    @IBInspectable var selectedBackgroundColor :UIColor?
    @IBInspectable var nonSelectedBackgroundColor :UIColor?
    
    override var isSelected :Bool {
        didSet {
            self.backgroundColor =  isSelected ? selectedBackgroundColor : nonSelectedBackgroundColor
        }
    }
   
    @IBInspectable var rounded: Bool = false {
        willSet {
            if newValue {
                self.layer.cornerRadius = self.frame.size.height / 2
            }
            else{
                self.layer.cornerRadius = 0
            }
        }
    }
    
    
}
