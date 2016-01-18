//
//  Curve.swift
//  Curves
//
//  Created by Saad Umar on 1/15/16.
//  Copyright © 2016 PlutoLabs. All rights reserved.
//

import UIKit

@IBDesignable class Curve: UIView {
    
    @IBInspectable var layerColor: UIColor = UIColor.whiteColor() 
    @IBInspectable var layerHeight: CGFloat = 30.0
    @IBInspectable var controlPoints: CGFloat = 20.0
   
    
    override func drawRect(rect: CGRect) {
        // Drawing code
        addLayer(rect)
    }
    
    //Adds the layer to self
    func addLayer(rect:CGRect) {
        let layer = CAShapeLayer()
        layer.path = drawCurvesInRect(rect)
        layer.fillColor = layerColor.CGColor
        self.layer.addSublayer(layer)
    }
    
    //Sets the actual path
    func drawCurvesInRect(rect:CGRect)->CGMutablePathRef {
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, 0, rect.height)
        CGPathAddLineToPoint(path, nil, 0, rect.height - layerHeight)
        CGPathAddCurveToPoint(path, nil, rect.width/4.92, rect.height - (layerHeight + controlPoints), rect.width/1.25, rect.height - (layerHeight + controlPoints), rect.width , rect.height - layerHeight)
        CGPathAddLineToPoint(path, nil, rect.width , rect.height)
        CGPathCloseSubpath(path)
        return path
    }
    
}
