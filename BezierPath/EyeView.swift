//
//  EyeView.swift
//  BezierPath
//
//  Created by C on 16/1/6.
//  Copyright © 2016年 YoungKook. All rights reserved.
//

import UIKit

class EyeView: UIView {

  private var _eyefirst: CAShapeLayer!
  var eyeFirstLayer: CAShapeLayer! {
    get {
      if _eyefirst == nil {
        _eyefirst = CAShapeLayer()
        let center = CGPoint(x: CGRectGetWidth(self.frame)/2, y: CGRectGetHeight(self.frame)/2)
        let path = UIBezierPath(arcCenter: center, radius: CGRectGetWidth(self.frame) * 0.2, startAngle: CGFloat(230/180 * M_PI) , endAngle: CGFloat(265/180 * M_PI), clockwise: true)
        _eyefirst.borderColor = UIColor.blackColor().CGColor
        _eyefirst.lineWidth = 5
        _eyefirst.path = path.CGPath
        _eyefirst.fillColor = UIColor.clearColor().CGColor
        _eyefirst.strokeColor = UIColor.whiteColor().CGColor
      }
      return _eyefirst
    }
  }
  
  
  private var _eyesecond: CAShapeLayer!
  var eyeSecondLayer: CAShapeLayer! {
    get {
      if _eyesecond == nil {
        _eyesecond = CAShapeLayer()
        let center = CGPoint(x: CGRectGetWidth(self.frame)/2, y: CGRectGetHeight(self.frame)/2)
        let path = UIBezierPath(arcCenter: center, radius: CGRectGetWidth(self.frame) * 0.2, startAngle: CGFloat(211/180 * M_PI), endAngle: CGFloat(220/180 * M_PI), clockwise: true)
        _eyesecond.borderColor = UIColor.blackColor().CGColor
        _eyesecond.lineWidth = 5
        _eyesecond.path = path.CGPath
        _eyesecond.fillColor = UIColor.clearColor().CGColor
        _eyesecond.strokeColor = UIColor.whiteColor().CGColor
      }
      return _eyesecond
    }
  }
  
  
  private var _eyeball: CAShapeLayer!
  var eyeballLayer: CAShapeLayer! {
    get {
      if _eyeball == nil {
        _eyeball = CAShapeLayer()
        let center = CGPoint(x: CGRectGetWidth(self.frame)/2, y: CGRectGetHeight(self.frame)/2)
        let path = UIBezierPath(arcCenter: center, radius: CGRectGetWidth(self.frame) * 0.3, startAngle: CGFloat(0/180 * M_PI), endAngle: CGFloat(360/180 * M_PI), clockwise: true)
        _eyeball.borderColor = UIColor.blackColor().CGColor
        _eyeball.lineWidth = 1
        _eyeball.path = path.CGPath
        _eyeball.fillColor = UIColor.clearColor().CGColor
        _eyeball.strokeColor = UIColor.whiteColor().CGColor
        _eyeball.anchorPoint = CGPoint(x: 0.5, y: 0.5)
      }
      return _eyeball
    }
  }
  
  
  private var _topeye: CAShapeLayer!
  var topEyeLayer: CAShapeLayer! {
    get {
      if _topeye == nil {
        _topeye = CAShapeLayer()
        let center = CGPoint(x: CGRectGetWidth(self.frame)/2, y: CGRectGetHeight(self.frame)/2)
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: center.y))
        path.addQuadCurveToPoint(CGPoint(x: CGRectGetWidth(self.frame), y: center.y), controlPoint: CGPoint(x: center.x, y: center.y - center.y - 20))
        _topeye.borderColor = UIColor.blackColor().CGColor
        _topeye.lineWidth = 1
        _topeye.path = path.CGPath
        _topeye.fillColor = UIColor.clearColor().CGColor
        _topeye.strokeColor = UIColor.whiteColor().CGColor
      }
      return _topeye
    }
  }
  
  private var _bottomeye: CAShapeLayer!
  var bottomEyeLayer: CAShapeLayer! {
    get {
      if _bottomeye == nil {
        _bottomeye = CAShapeLayer()
        let center = CGPoint(x: CGRectGetWidth(self.frame)/2, y: CGRectGetHeight(self.frame)/2)
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: center.y))
        path.addQuadCurveToPoint(CGPoint(x: CGRectGetWidth(self.frame), y: center.y), controlPoint: CGPoint(x: center.x, y: center.y + center.y + 20))
        _bottomeye.borderColor = UIColor.blackColor().CGColor
        _bottomeye.lineWidth = 1
        _bottomeye.path = path.CGPath
        _bottomeye.fillColor = UIColor.clearColor().CGColor
        _bottomeye.strokeColor = UIColor.whiteColor().CGColor
      }
      return _bottomeye
    }
  }

  func setupDefaultValue() {
    self.eyeFirstLayer.lineWidth = 0
    self.eyeSecondLayer.lineWidth = 0
    self.eyeballLayer.opacity = 0
    self.bottomEyeLayer.strokeStart = 0.5
    self.bottomEyeLayer.strokeEnd = 0.5
    self.topEyeLayer.strokeStart = 0.5
    self.topEyeLayer.strokeEnd = 0.5
  }
  
  func animationWith(y: CGFloat) {
    let flag: CGFloat = self.frame.origin.y * 2 - 20
    print("flag--->\(flag) y--->\(y)")
    if y < flag {
      if self.eyeFirstLayer.lineWidth < 5 {
        self.eyeFirstLayer.lineWidth += 1
        self.eyeSecondLayer.lineWidth += 1
      }
    }
    
    if y < flag - 20 {
      if self.eyeballLayer.opacity <= 1 {
        self.eyeballLayer.opacity += 0.1
      }
    }
    
    if y < flag - 40 {
      if self.topEyeLayer.strokeEnd < 1 && self.topEyeLayer.strokeStart > 0 {
        self.topEyeLayer.strokeEnd += 0.1
        self.topEyeLayer.strokeStart -= 0.1
        self.bottomEyeLayer.strokeEnd += 0.1
        self.bottomEyeLayer.strokeStart -= 0.1
      }
    }
    
    if y > flag - 40 {
      if self.topEyeLayer.strokeEnd != 0.5 {
        self.topEyeLayer.strokeEnd -= 0.1
        self.topEyeLayer.strokeStart += 0.1
        self.bottomEyeLayer.strokeEnd -= 0.1
        self.bottomEyeLayer.strokeStart += 0.1
      }
    }
    
    if y > flag - 20 {
      if self.eyeballLayer.opacity >= 0 {
        self.eyeballLayer.opacity -= 0.1
      }
    }
    
    if y > flag {
      if self.eyeFirstLayer.lineWidth > 0 {
        self.eyeFirstLayer.lineWidth -= 1
        self.eyeSecondLayer.lineWidth -= 1
      }
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
}
