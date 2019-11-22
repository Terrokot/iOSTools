//
//  Colors.swift
//  CustomButton
//
//  Created by Egor Tereshonok on 11/22/19.
//  Copyright © 2019 Egor Tereshonok. All rights reserved.
//

import Foundation
import UIKit

func ChangeLabelcolor(rand: Int, label: UILabel!) {
    
    switch rand {
        
    case 1:
        label.backgroundColor = UIColor.red
    case 2:
        label.backgroundColor = UIColor.blue
    case 3:
        label.backgroundColor = UIColor.yellow
    default:
        label.backgroundColor = UIColor.green
    }
}
 
