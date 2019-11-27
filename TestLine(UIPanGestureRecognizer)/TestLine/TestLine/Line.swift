//
//  Line.swift
//  TestLine
//
//  Created by Egor Tereshonok on 11/27/19.
//  Copyright © 2019 Egor Tereshonok. All rights reserved.
//

import Foundation
import UIKit

class Line: UIView {
    
    let vc = ViewController()
    
    
    
    override func draw(_ rect: CGRect) {
        var aPath = UIBezierPath()

        aPath.move(to: CGPoint(x:0, y:300))

          aPath.addLine(to: CGPoint(x:300, y:500))

            //Keep using the method addLineToPoint until you get to the one where about to close the path

          aPath.close()

            //If you want to stroke it with a red color
          UIColor.red.set()
            aPath.stroke()
            //If you want to fill it as well
            aPath.fill()
      }
    
}
