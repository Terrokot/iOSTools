//
//  TestLine.swift
//  TestLine
//
//  Created by Egor Tereshonok on 11/27/19.
//  Copyright © 2019 Egor Tereshonok. All rights reserved.
//

import UIKit

class DrawingView: UIView {
    var path = UIBezierPath()
    var initialLocation = CGPoint.zero
    var finalLocation = CGPoint.zero
    var shapeLayer = CAShapeLayer()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

   required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    func setupView(){
        self.layer.addSublayer(shapeLayer)
        self.shapeLayer.lineWidth = 20
        self.shapeLayer.strokeColor = UIColor.blue.cgColor
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let location = touches.first?.location(in: self){
            initialLocation = location
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)

        if let location = touches.first?.location(in: self){
            let dx =  location.x - initialLocation.x
            let dy = location.y - initialLocation.y

            finalLocation = abs(dx) > abs(dy) ? CGPoint(x: location.x, y: initialLocation.y) : CGPoint(x: initialLocation.x, y: location.y)

            path.removeAllPoints()
            path.move(to: initialLocation)
            path.addLine(to: finalLocation)

            shapeLayer.path = path.cgPath

        }
    }
}
