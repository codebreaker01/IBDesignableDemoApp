//
//  DesignableButton.swift
//  IBDesignableDemoApp
//
//  Created by Bhambhwani, Jaikumar (US - Mumbai) on 6/30/14.
//  Copyright (c) 2014 Jaikumar. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableButton: UIButton {

    @IBInspectable
    var fillColor : UIColor = UIColor.redColor() {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var strokeColor : UIColor = UIColor.blackColor() {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var strokeWidth : CGFloat = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var cornerRadius : CGFloat = 10 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        drawButtonWithFrame(rect, cornerRadius: self.cornerRadius, strokeWidth: self.strokeWidth, fillColor: self.fillColor, strokeColor: self.strokeColor)
    }
    
    func drawButtonWithFrame(frame: CGRect, cornerRadius: CGFloat, strokeWidth: CGFloat, fillColor: UIColor, strokeColor: UIColor) {
        
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(roundedRect: CGRectMake(frame.minX + 2.0, frame.minY + 2.0, CGFloat(floor(Double((frame.width - 2) * 0.97297 + 0.5))), CGFloat(floor(Double((frame.height - 2) * 0.85714 + 0.5)))), cornerRadius: cornerRadius)
        fillColor.setFill()
        rectanglePath.fill()
        strokeColor.setStroke()
        rectanglePath.lineWidth = strokeWidth
        rectanglePath.stroke()
    }

}
