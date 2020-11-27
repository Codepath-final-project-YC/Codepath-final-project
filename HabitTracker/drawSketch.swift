//
//  drawSketch.swift
//  HabitTracker
//
//  Created by Yike Li on 11/25/20.
//

import UIKit
import CoreGraphics

class drawSketch: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        print(" Start drawing!")
        
        guard let context = UIGraphicsGetCurrentContext()
        else {
            print("Could not get the context")
            return
        }
        
        self.drawBlueCircle(in: context)


    }
    
    func drawBlueCircle(in context: CGContext) {
      context.setFillColor(UIColor.blue.cgColor)
      context.addEllipse(in: bounds)
      context.drawPath(using: .fill)
    }

}
