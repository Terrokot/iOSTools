//
//  CustomButton.swift
//  CustomButton
//
//  Created by Egor Tereshonok on 11/22/19.
//  Copyright © 2019 Egor Tereshonok. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable
class MyButton: UIButton {

    var path: UIBezierPath!

    override func awakeFromNib() {
        self.backgroundColor = UIColor.gray
        addTarget(self, action: #selector(touchDown), for: .touchDown)
    }
    //MARK: DRAW STAR
    override func draw(_ rect: CGRect) {
        
        let center: CGPoint = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        path = UIBezierPath()

        path.move(to: center)
        path.addLine(to: CGPoint(x: center.x + 10, y: center.y + 20))
        path.addLine(to: CGPoint(x: center.x + 35 , y: center.y + 20))
        path.addLine(to: CGPoint(x: center.x + 15 , y: center.y + 35))
        path.addLine(to: CGPoint(x: center.x + 35 , y: center.y + 60))
        path.addLine(to: CGPoint(x: center.x, y: center.y + 45))
        path.addLine(to: CGPoint(x: center.x - 35 , y: center.y + 60))
        path.addLine(to: CGPoint(x: center.x - 15 , y: center.y + 35))
        path.addLine(to: CGPoint(x: center.x - 35 , y: center.y + 20))
        path.addLine(to: CGPoint(x: center.x - 10, y: center.y + 20))

        path.close()

        // MARK: DROP
               //path.addCurve(to: center, controlPoint1: CGPoint(x: center.x + 100, y: center.x + 150), controlPoint2: CGPoint(x: center.x - 100, y: center.x + 150))

        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
    }

    @objc func touchDown(button: MyButton, event: UIEvent) {
        if let touch = event.touches(for: button)?.first {
            let location = touch.location(in: button)

            if path.contains(location) == false {
                button.cancelTracking(with: nil)
            }
        }
    }
}
