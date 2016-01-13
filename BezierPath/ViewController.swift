//
//  ViewController.swift
//  BezierPath
//
//  Created by C on 16/1/6.
//  Copyright © 2016年 YoungKook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var layerView: UIView!
  var layer: CAShapeLayer!
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    let startPoint = CGPointMake(50, 300)
//    let endPoint = CGPointMake(300, 300)
//    let controlPoint1 = CGPointMake(100, 200)
//    let controlPoint2 = CGPoint(x: 200, y: 400)
//    let layer1 = CALayer()
//    layer1.frame = CGRect(x: startPoint.x, y: startPoint.y, width: 5, height: 5)
//    layer1.backgroundColor = UIColor.redColor().CGColor
//    
//    let layer2 = CALayer()
//    layer2.frame = CGRect(x: endPoint.x, y: endPoint.y, width: 5, height: 5)
//    layer2.backgroundColor = UIColor.yellowColor().CGColor
//    
//    let layer3 = CALayer()
//    layer3.frame = CGRect(x: controlPoint1.x, y: controlPoint1.y, width: 5, height: 5)
//    layer3.backgroundColor = UIColor.grayColor().CGColor
//    
//    let path = UIBezierPath()
//    layer = CAShapeLayer()
//    
//    path.moveToPoint(startPoint)
//    path.addCurveToPoint(endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
//    
//    layer.path = path.CGPath
//    layer.fillColor = UIColor.clearColor().CGColor
//    layer.strokeColor = UIColor.blackColor().CGColor
//    
//    view.layer.addSublayer(layer)
//    view.layer.addSublayer(layer1)
//    view.layer.addSublayer(layer2)
//    view.layer.addSublayer(layer3)
    
//    animation1()
//    animation2()
//    animation3()
    
    layerView = UIView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 200))
    layerView.backgroundColor = UIColor.grayColor()
    view.addSubview(layerView)
    
    let finalSize = CGSize(width: CGRectGetWidth(layerView.frame), height: layerView.frame.height)
    let layerHeight = finalSize.height * 0.2
    layer = CAShapeLayer()
    let path = UIBezierPath()
    path.moveToPoint(CGPoint(x: 0, y: finalSize.height - layerHeight))
    path.addLineToPoint(CGPoint(x: 0, y: finalSize.height - 1))
    path.addLineToPoint(CGPoint(x: finalSize.width, y: finalSize.height - 1))
    path.addLineToPoint(CGPoint(x: finalSize.width, y: finalSize.height - layerHeight))
    path.addQuadCurveToPoint(CGPoint(x: 0, y: finalSize.height - layerHeight), controlPoint: CGPoint(x: finalSize.width/2, y: finalSize.height - layerHeight - 60))
    layer.path = path.CGPath
    layer.fillColor = UIColor.clearColor().CGColor
    layer.strokeColor = UIColor.blackColor().CGColor
    layerView.layer.addSublayer(layer)
    
  }
  
  private func animation1() {
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    animation.fromValue = 0
    animation.toValue = 1
    animation.duration = 2
    layer.addAnimation(animation, forKey: "")
  }
  
  private func animation2() {
    layer.strokeStart = 0
    layer.strokeEnd = 1
    
    let animation = CABasicAnimation(keyPath: "strokeStart")
    animation.fromValue = 0.5
    animation.toValue = 0
    animation.duration = 2
    
    let animation2 = CABasicAnimation(keyPath: "strokeEnd")
    animation2.fromValue = 0.5
    animation2.toValue = 1
    animation2.duration = 2
    
    layer.addAnimation(animation, forKey: "")
    layer.addAnimation(animation2, forKey: "")
  }
  
  private func animation3() {
    let animation = CABasicAnimation(keyPath: "lineWidth")
    animation.fromValue = 1
    animation.toValue = 10
    animation.duration = 2
    layer.addAnimation(animation, forKey: "")
  }
}

