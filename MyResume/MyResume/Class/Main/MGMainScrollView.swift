//
//  MGMainScrollView.swift
//  MyResume
//
//  Created by ming on 16/4/23.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGMainScrollView: UIScrollView {
    override func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer.isKindOfClass(UIPanGestureRecognizer) {
            let pan:UIPanGestureRecognizer = gestureRecognizer as! UIPanGestureRecognizer
            if pan.translationInView(self).x > 0.0 && self.contentOffset.x == 0.0 {
                return false
            }
        }
        return super.gestureRecognizerShouldBegin(gestureRecognizer)
    }
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        let offset = point.x
        if offset < 70 {
            return nil
        }

        return super.hitTest(point, withEvent: event)
    }
}
