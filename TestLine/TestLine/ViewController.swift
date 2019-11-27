//
//  ViewController.swift
//  TestLine
//
//  Created by Egor Tereshonok on 11/27/19.
//  Copyright © 2019 Egor Tereshonok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button: UIButton!
        
    var tapGestureRecognizer: UITapGestureRecognizer!
    
    var firstPoint: CGPoint?
    var secondPoint: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let viewBounds = self.view.bounds
        button.backgroundColor = UIColor.gray
        button.frame = CGRect(x: (viewBounds.width/10), y: (viewBounds.height/10)*9 - (viewBounds.height/20), width: (viewBounds.width/10)*8, height: viewBounds.height/10)
        
        
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.showMoreActions(touch:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func showMoreActions(touch: UITapGestureRecognizer) {
        let touchPoint = touch.location(in: self.view)
        
        guard let _ = firstPoint else {
            firstPoint = touchPoint
            return
        }
        
        guard let _  = secondPoint else {
            secondPoint = touchPoint
            addLine(fromPoint: firstPoint!, toPoint: secondPoint!)
            
            firstPoint = nil
            secondPoint = nil
            
            return
        }
    }
    
    func addLine(fromPoint start: CGPoint, toPoint end:CGPoint) {
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: start)
        linePath.addLine(to: end)
        line.path = linePath.cgPath
        line.strokeColor = UIColor.red.cgColor
        line.lineWidth = 1
        line.lineJoin = CAShapeLayerLineJoin.round
        self.view.layer.addSublayer(line)
    }
}
