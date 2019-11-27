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
    
    
    // var points = [CGPoint]()
    var tapGestureRecognizer: UITapGestureRecognizer!
    
    var firstPoint: CGPoint?
    var secondPoint: CGPoint?
    
    
    var counter = 0
    
    var vcBounds = CGRect(x:0, y:0, width: 0, height: 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        vcBounds = self.view.bounds
        button.backgroundColor = UIColor.gray
        button.frame = CGRect(x: (vcBounds.width/10), y: (vcBounds.height/10)*9 - (vcBounds.height/20), width: (vcBounds.width/10)*8, height: vcBounds.height/10)
        
        // tapObserver()
        
        
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
    @IBAction func clear(_ sender: Any) {
        
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






/*
 func tapObserver() {
 
 let tap = UITapGestureRecognizer(target: self, action: #selector(TapAction))
 tap.numberOfTapsRequired = 1
 self.view.addGestureRecognizer(tap)
 
 
 
 
 }
 
 @objc func TapAction(_ sender: UITapGestureRecognizer) {
 let point = sender.location(in: view)
 points.append(point)
 counter += 1
 if counter == 2 {
 }
 
 
 print(point)
 print(points)
 
 }
 
 */

/*
 override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
 let touch = touches.first!
 switch location.count {
 case 0:
 location.insert(touch.location(in: self.view), at: 0)
 case 1:
 location.insert(touch.location(in: self.view), at: 1)
 default:
 location.removeAll()
 }
 print(location)
 }
 */





