//
//  MGItemView.swift
//  MyResume
//
//  Created by ming on 16/4/17.
//  Copyright © 2016年 ming. All rights reserved.
//


import UIKit

class MGItemView: UIView {
    
    var isAnimating = false
    var originalX: CGFloat = 0
    var originalY: CGFloat = 0
    var isShow = false
    //var isSelected = false
    var titleString:String!
    var isSelected:Bool{
        didSet{
            if isSelected {
                self.layer.cornerRadius = 0
                self.layer.shadowOpacity = 0
            }else{
                UIView.animateWithDuration(0.4, animations: {
                    self.layer.cornerRadius = 20
                    self.layer.shadowOpacity = 0.6
                })
            }
        }
    }
    

    /** 定义一个动画的闭包,这个闭包主要用来切换控制器 */
    var showDetail:((v:UIView)->())?
    
    
    init(frame: CGRect,title:String,img:UIImage) {
        isSelected = false
        super.init(frame: frame)
        
        self.layer.cornerRadius = 20
        self.layer.shadowOffset = CGSizeMake(0, 0)
        self.layer.shadowOpacity = 0.6
        
        titleString = title
        
        originalX = self.center.x
        originalY = self.center.y
        
        // 添加文字
        let titleLabel = UILabel();
        titleLabel.text = title
        titleLabel.frame = CGRectMake(40, 0 , self.bounds.width/2, self.bounds.height)
        //        titleLabel.tintColor = UIColor.whiteColor()
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont(name: "Helvetica", size: 14.0)
        titleLabel.textAlignment = NSTextAlignment.Left
        
        self.addSubview(titleLabel)
        
        // 添加图标
        let imageView = UIImageView(image: img)
        imageView.frame = CGRectMake(112, 14, 45, 45)
        imageView.userInteractionEnabled = true
        self.addSubview(imageView)
        
        //注册点击事件
        let tap = UITapGestureRecognizer(target: self, action: "tapHandle:")
        addGestureRecognizer(tap)
        tap.numberOfTapsRequired = 2
        tap.numberOfTouchesRequired = 1
//        tap.delegate = self
        
        //注册拖拽事件
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "panHandle:"))
    }
    
    
    // MARK:- pan拖拽操作
    @objc func panHandle(pan: UIPanGestureRecognizer){
        
        if  isAnimating || isSelected {
            return
        }
        let p = pan.translationInView(self)
        isShow = false
        if p.x >= 0 {
            self.center.x = originalX + p.x
            self.center.y = originalY + p.y
        }
        
        /// 临界值170，超过170就要切换控制器
        if p.x > 170{
            isShow = true
        }
        /// 拖拽结束
        if pan.state == UIGestureRecognizerState.Ended{
            
            if isShow {
                showDetail?(v: self)
            }else{
                
                UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: UIViewAnimationOptions.AllowAnimatedContent, animations: { () -> Void in
                    
                    self.center.x = self.originalX
                    self.center.y = self.originalY
                    },completion: nil)
            }
        }
    }
    
    // MARK:- tap点击操作
    //点击的动画
    @objc func tapHandle(tap: UITapGestureRecognizer){
        if isAnimating || isSelected{
            return
        }
        
        isAnimating = true
        UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: UIViewAnimationOptions.AllowAnimatedContent, animations: { () -> Void in
            
            self.center.x += 70
            self.transform = CGAffineTransformMakeScale(1, 1.2)
            }) { (_) -> Void in
                //停顿
                Utils.delay(0.5, completion: {
                    self.isAnimating = false
                    UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: UIViewAnimationOptions.AllowAnimatedContent, animations: { () -> Void in
                        
                        self.center.x -= 70
                        self.transform = CGAffineTransformIdentity
                        
                        },completion: nil)
                })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//extension MGItemView: UIGestureRecognizerDelegate {
//    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
//        print(touch.view)
//        return true
//    }
//
//    
//    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        return true
//    }
//}

class Utils {
    
    static var width:CGFloat?
    
    class func delay(seconds: Double, completion:()->()) {
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
        
        dispatch_after(popTime, dispatch_get_main_queue()) {
            completion()
        }
    }
}

