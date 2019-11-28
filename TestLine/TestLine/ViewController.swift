//
//  ViewController.swift
//  TestLine
//
//  Created by Egor Tereshonok on 11/27/19.
//  Copyright © 2019 Egor Tereshonok. All rights reserved.
//

//MARK: Все работает, нужно только вывести на экран
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button: UIButton!
        
    var tapGestureRecognizer: UITapGestureRecognizer!
    
    var firstCoordinate: CGPoint?
    var secondCoordinate: CGPoint?
    
    var firstPoint: UIBezierPath?
    var secondPoint: UIBezierPath?
    
    var line: UIBezierPath?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragTheView))
        self.view.addGestureRecognizer(panGestureRecognizer)
    }
        
    @objc func dragTheView(recognizer: UIPanGestureRecognizer) {
        
        if recognizer.state == .began {
            print("Gesture began")
            
        } else if recognizer.state == .changed {
            let translation = recognizer.translation(in: view)
            let recognizerStartPoint = recognizer.location(in: self.view)
            if let a = firstCoordinate, let b = secondCoordinate {
            if distance(firstPoint: a, secondPoint: recognizerStartPoint) < distance(firstPoint: b, secondPoint: recognizerStartPoint) {
                
                let newX = a.x + translation.x
                let newY = a.y + translation.y
                firstPoint?.move(to: CGPoint(x: newX, y: newY))
                firstCoordinate = CGPoint(x: newX, y: newY)

                print(firstPoint!.currentPoint)
                print("test")
                firstPoint?.removeAllPoints()
                
            } else {
                
                let newX = b.x + translation.x
                let newY = b.y + translation.y
                secondPoint?.move(to: CGPoint(x: newX, y: newY))
                secondCoordinate = CGPoint(x: newX, y: newY)
                }
            } else if recognizer.state == .ended {
                firstPoint?.reversing()

            }
            
            //recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
    }
    
    func distance(firstPoint a: CGPoint, secondPoint b: CGPoint) -> CGFloat {
        let xDist = a.x - b.x
        let yDist = a.y - b.y
        return CGFloat(sqrt(xDist * xDist + yDist * yDist))
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
        
        guard let _ = firstCoordinate else {
            firstCoordinate = touchPoint
            firstPoint = addPoint(location: touchPoint)
            return
        }
        
        guard let _  = secondCoordinate else {
            secondCoordinate = touchPoint
            secondPoint = addPoint(location: touchPoint)
            addLine(fromPoint: firstCoordinate!, toPoint: secondCoordinate!)
            
            //firstCoordinate = nil
            //secondCoordinate = nil
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
    
    func addPoint(location: CGPoint) -> (UIBezierPath) {
        let circlePath = UIBezierPath(arcCenter: location, radius: CGFloat(3), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 3.0

        view.layer.addSublayer(shapeLayer)
        
        return circlePath
    }
}
