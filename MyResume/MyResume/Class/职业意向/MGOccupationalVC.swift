//
//  MGOccupationalVC.swift
//  MyResume
//
//  Created by ming on 16/4/21.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGOccupationalVC: MGBaseViewController {

    //MARK:- 系统的声明周期方法
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置子控件
        setUpUI()
        
        // 设置各个控件的transform
        let width = UIScreen.mainScreen().bounds.width
        let height = UIScreen.mainScreen().bounds.height
        titleLabel.transform =  CGAffineTransformMakeTranslation(0, -100)
        titleLabel.alpha = 0
        handLabel1.transform = CGAffineTransformMakeTranslation(-width, 0)
        textLabel1.transform = CGAffineTransformMakeTranslation(0, -height)
        handLabel2.transform = CGAffineTransformMakeTranslation(-width, 0)
        textLabel2.transform = CGAffineTransformMakeTranslation(0, -height)
        handLabel3.transform = CGAffineTransformMakeTranslation(-width, 0)
        textLabel3.transform = CGAffineTransformMakeTranslation(0, -height)
        handLabel4.transform = CGAffineTransformMakeTranslation(-width, 0)
        textLabel4.transform = CGAffineTransformMakeTranslation(0, -height)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.3, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 8, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.titleLabel.transform = CGAffineTransformIdentity
                self.titleLabel.alpha = 1
            }) { (_) -> Void in
                UIView.animateWithDuration(0.3, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 8, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                        self.handLabel1.transform = CGAffineTransformIdentity
                        self.textLabel1.transform = CGAffineTransformIdentity
                    }) {_ in
                      UIView.animateWithDuration(0.3, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 8, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                            self.handLabel2.transform = CGAffineTransformIdentity
                            self.textLabel2.transform = CGAffineTransformIdentity
                       }) {_ in
                            UIView.animateWithDuration(0.3, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 8, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                                    self.handLabel3.transform = CGAffineTransformIdentity
                                    self.textLabel3.transform = CGAffineTransformIdentity
                                }) {_ in
                                    UIView.animateWithDuration(0.3, delay: 0.4, usingSpringWithDamping: 0.9, initialSpringVelocity: 8, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                                            self.handLabel4.transform = CGAffineTransformIdentity
                                            self.textLabel4.transform = CGAffineTransformIdentity
                                        }, completion: nil)
                            }
                      }
                }
                
        }
        
        
    }
    
    
    // MARK:- 内部控制方法
    private func setUpUI() {
        view.addSubview(titleLabel)
        view.addSubview(handLabel1)
        view.addSubview(textLabel1)
        view.addSubview(handLabel2)
        view.addSubview(textLabel2)
        view.addSubview(handLabel3)
        view.addSubview(textLabel3)
        view.addSubview(handLabel4)
        view.addSubview(textLabel4)
        
       
        titleLabel.snp_makeConstraints { (make) -> Void in
            make.left.width.equalTo(view)
            make.height.equalTo(30)
            make.top.equalTo(view).offset(25)
        }
        handLabel1.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(view).offset(20)
            make.top.equalTo(view).offset(150)
        }
        textLabel1.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(handLabel1.snp_right).offset(15)
            make.centerY.equalTo(handLabel1)
        }
        handLabel2.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(view).offset(20)
            make.top.equalTo(handLabel1).offset(100)
        }
        textLabel2.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(handLabel2.snp_right).offset(15)
            make.centerY.equalTo(handLabel2)
        }
        handLabel3.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(view).offset(20)
            make.top.equalTo(textLabel2).offset(100)
        }
        textLabel3.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(handLabel3.snp_right).offset(15)
            make.centerY.equalTo(handLabel3)
        }
        handLabel4.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(view).offset(20)
            make.top.equalTo(handLabel3).offset(100)
        }
        textLabel4.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(handLabel4.snp_right).offset(15)
            make.centerY.equalTo(handLabel4)
        }
    }
    
    // MARK:- lazy
    private var titleLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFontOfSize(32)
        lb.textColor = UIColor.redColor()
        lb.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0)
        lb.text = "职业意向"
        lb.textAlignment = NSTextAlignment.Center
        return lb
    }()
    private var handLabel1: UILabel = {
        let lb = UILabel()
        lb.text = "☞"
        lb.font = UIFont.systemFontOfSize(36)
        return lb
    }()
    private var textLabel1: UILabel = {
        let lb = UILabel()
        lb.text = "期望行业 → 移动互联网"
        return lb
    }()
    private var handLabel2: UILabel = {
        let lb = UILabel()
        lb.text = "☞"
        lb.font = UIFont.systemFontOfSize(36)
        return lb
        }()
    private var textLabel2: UILabel = {
        let lb = UILabel()
        lb.text = "期望职能 → iOS研发工程师"
        return lb
    }()
    private var handLabel3: UILabel = {
        let lb = UILabel()
        lb.text = "☞"
        lb.font = UIFont.systemFontOfSize(36)
        return lb
        }()
    private var textLabel3: UILabel = {
        let lb = UILabel()
        lb.text = "期望地点 → 广东广州"
        lb.font = UIFont.systemFontOfSize(17)
        return lb
    }()
    private var handLabel4: UILabel = {
        let lb = UILabel()
        lb.text = "☞"
        lb.font = UIFont.systemFontOfSize(36)
        return lb
        }()
    private var textLabel4: UILabel = {
        let lb = UILabel()
        lb.text = "期望月薪 → 面议"
        return lb
    }()
}
