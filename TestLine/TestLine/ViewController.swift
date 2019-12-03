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
    
    var lineLayers: [CALayer] = [CALayer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragTheView))
        view.addGestureRecognizer(panGestureRecognizer)
        
        button.backgroundColor = UIColor.gray
        
        button.frame = CGRect(x: view.frame.width / 10,
                              y: (view.frame.height / 10) * 9 - view.frame.height / 20,
                              width: (view.frame.width / 10) * 8,
                              height: view.frame.height / 10)
        
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapAction(touch:)))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func dragTheView(recognizer: UIPanGestureRecognizer) {
        
        guard let a = firstPoint, let b = secondPoint else {
            return
        }
        
        let location = recognizer.location(in: view)
        
        if distance(firstPoint: a, secondPoint: location) < distance(firstPoint: b, secondPoint: location) {
            firstPoint = location
        } else {
            secondPoint = location
        }
        
        drawResult()
    }
    
    @objc func tapAction(touch: UITapGestureRecognizer) {
    
        let touchPoint = touch.location(in: view)
            
        if firstPoint == nil {
            firstPoint = touchPoint
            drawResult()
            return
        }
        
        if secondPoint == nil {
            secondPoint = touchPoint
            drawResult()
            return
        }
        
    }
    
    private func drawResult() {
        
        clearSublayers()
        
        guard let firstPoint = firstPoint else {
            return
        }
        
        addPoint(location: firstPoint)
        
        guard let secondPoint = secondPoint else {
            return
        }
        
        addPoint(location: secondPoint)
        
        addLine(fromPoint: firstPoint, toPoint: secondPoint)
        
    }
    
    private func clearSublayers() {
        for layer in lineLayers {
            layer.removeFromSuperlayer()
        }
        lineLayers = []
    }
    
    private func distance(firstPoint a: CGPoint, secondPoint b: CGPoint) -> CGFloat {
        let xDist = a.x - b.x
        let yDist = a.y - b.y
        return sqrt(xDist * xDist + yDist * yDist)
    }
    
    private func addLine(fromPoint start: CGPoint, toPoint end:CGPoint) {
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: start)
        linePath.addLine(to: end)
        line.path = linePath.cgPath
        line.strokeColor = UIColor.red.cgColor
        line.lineWidth = 1
        line.lineJoin = CAShapeLayerLineJoin.round
        lineLayers.append(line)
        view.layer.addSublayer(line)
    }
    
    private func addPoint(location: CGPoint) {
        let circlePath = UIBezierPath(arcCenter: location,
                                      radius: CGFloat(3),
                                      startAngle: CGFloat(0),
                                      endAngle: CGFloat.pi * 2,
                                      clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 3.0
        
        lineLayers.append(shapeLayer)
        view.layer.addSublayer(shapeLayer)
    }
    
    
    @IBAction func clearButton(_ sender: Any) {
        firstPoint = nil
        secondPoint = nil
        drawResult()
    }
    
}
