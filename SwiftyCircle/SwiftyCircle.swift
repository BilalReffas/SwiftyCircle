//
//  SwiftyCircle.swift
//  SwiftyCircle
//
//  Created by Bilal Karim Reffas on 03.12.15.
//  Copyright © 2015 Bilal Karim Reffas. All rights reserved.
//

import UIKit


@IBDesignable public class SwiftyCircle : UIView {
    
    public struct Constants {
        let higherCircle = CAShapeLayer()
        let lowerCircle = CAShapeLayer()
    }
    
    private let constants = Constants()
    

    @IBInspectable public var progress : CGFloat = 0.2{
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var roundCap: Bool = true {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var centerFillColor : UIColor = UIColor.whiteColor(){
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var strokeColor : UIColor = UIColor.whiteColor(){
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var strokeWidth : CGFloat = 7.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var lowerCirlceStrokeColor : UIColor = UIColor.grayColor(){
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var lowerCirlceStrokeWidth : CGFloat = 3.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var lowerCirlceProgress : CGFloat = 1.0{
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var drawlowerCirlce : Bool = false{
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
 
    
    public override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        self.layoutIfNeeded()
        self.backgroundColor = UIColor.clearColor()
        
        let frameSize = self.frame.size
        let arcCenter : CGPoint = CGPoint(x: frameSize.width / 2.0, y: frameSize.height / 2.0)
        let radius : CGFloat = (frameSize.width - 10)/2
        let startAngel : CGFloat = CGFloat(-M_PI_2)
        let endAngel : CGFloat = CGFloat((M_PI * 2.0) - M_PI_2)
        
        /**Draw the HigherCircle**/
        self.constants.higherCircle.path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: startAngel, endAngle: endAngel , clockwise: true).CGPath
        self.constants.higherCircle.lineWidth = self.strokeWidth
        self.constants.higherCircle.strokeStart = 0.0
        self.constants.higherCircle.strokeEnd = self.progress
        self.constants.higherCircle.speed = 0.1
        self.constants.higherCircle.lineCap = self.roundCap == true ? kCALineCapRound  : kCALineCapButt
        self.constants.higherCircle.fillColor = self.centerFillColor.CGColor
        self.constants.higherCircle.strokeColor = self.strokeColor.CGColor
        self.animateCircle(0.2, sender : true)
        
        
        if self.drawlowerCirlce == true {
            /**Draw the LowerCirlcle**/
            self.constants.lowerCircle.path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: startAngel, endAngle: endAngel , clockwise: true).CGPath
            self.constants.lowerCircle.lineWidth = self.lowerCirlceStrokeWidth
                self.constants.lowerCircle.strokeStart = 0.0
            self.constants.lowerCircle.strokeEnd = self.lowerCirlceProgress
            self.constants.lowerCircle.speed = 0.1
            self.constants.lowerCircle.lineCap = self.roundCap == true ? kCALineCapRound  : kCALineCapButt
            self.constants.lowerCircle.fillColor = UIColor.clearColor().CGColor
            self.constants.lowerCircle.strokeColor = self.lowerCirlceStrokeColor.CGColor
            self.layer.addSublayer(self.constants.lowerCircle)
        }
            self.layer.addSublayer(self.constants.higherCircle)
        
        
        
    }
    
    func animateCircle(duration: NSTimeInterval, sender : Bool) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
                animation.duration = duration
                animation.fromValue = 0
        animation.toValue = sender == true ? self.progress : self.lowerCirlceProgress
                animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        self.constants.higherCircle.strokeEnd =  self.progress
        
        self.constants.higherCircle.addAnimation(animation, forKey: "animateHigherCircle")

    }
}