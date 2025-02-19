//
//  ColorBlendDrawer.swift
//  Maps
//
//  Created by Mohaned Benmesken on 12/31/19.
//  Copyright © 2019 Mohaned Benmesken. All rights reserved.
//

import Foundation
import UIKit
public class ColorBlendDrawer:AdvancedPageControlDrawerParentWithIndicator, AdvancedPageControlDraw {

    var scaleFactor:CGFloat = 8

   public func draw(_ rect: CGRect) {
        drawIndicators(rect)
    }

    func drawIndicators(_ rect: CGRect) {
        for i in 0..<numberOfPages{

            let progress = currentItem - (floor(currentItem))
            let centeredYPosition = getCenteredYPosition(rect, dotSize: height)
            let y =  rect.origin.y + centeredYPosition
            let x = getCenteredXPosition(rect,itemPos: CGFloat(i), dotSize: width, space: space, numberOfPages: numberOfPages)
            if Int(floor(currentItem)) != i{
                if i ==  Int(floor(currentItem) + 1 ) {

                    drawItem(CGRect(x: x, y:  y, width: CGFloat(width ) , height: CGFloat(height) )
                        , raduis:radius,color: (indicatorColor * Double(progress) ) + (dotsColor * Double(1 - progress) ),borderWidth: borderWidth,borderColor: borderColor,index: i)
                }else{

                    drawItem(CGRect(x: x, y:  y, width: CGFloat(width ), height: CGFloat(height))
                        , raduis:radius,color: dotsColor,borderWidth: borderWidth,borderColor: borderColor,index: i)
                }
            }else{

                drawItem(CGRect(x: x, y:  y, width: CGFloat(width ) , height: CGFloat(height) )
                    , raduis:radius,color: (dotsColor * Double(progress) ) + (indicatorColor * Double(1 - progress) ),borderWidth: borderWidth,borderColor: borderColor,index: i)
            }
        }
    }
}

