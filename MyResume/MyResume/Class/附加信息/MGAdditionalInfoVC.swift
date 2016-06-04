//
//  MGAdditionalInfoVC.swift
//  MyResume
//
//  Created by ming on 16/4/21.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGAdditionalInfoVC: MGBaseViewController {

    //MARK:- 系统的声明周期方法
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置子控件
        setUpUI()
        
        // 设置各个控件的transform
        titleLabel.transform = CGAffineTransformMakeTranslation(-200, 0)
        titleLabel.alpha = 0.0
        
        additionTextView.transform = CGAffineTransformMakeTranslation(0, 800)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10, options: UIViewAnimationOptions.AllowAnimatedContent, animations: { () -> Void in
            
            self.titleLabel.transform = CGAffineTransformIdentity
            self.titleLabel.alpha = 1
            }) { (_) -> Void in
                
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                        self.additionTextView.transform = CGAffineTransformIdentity
                    }, completion: nil)
        }
    }

    
    // MARK:- 内部控制方法
    private func setUpUI() {
        view.addSubview(titleLabel)
        view.addSubview(additionTextView)
        
        titleLabel.snp_makeConstraints { (make) -> Void in
            make.left.width.equalTo(view)
            make.height.equalTo(30)
            make.top.equalTo(view).offset(25)
        }
        additionTextView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self.view.bounds.width * 0.8)
            make.height.equalTo(self.view.bounds.height * 0.5)
            make.center.equalTo(view.center).offset(0)
        }
    }
    
    // MARK:- lazy
    private var titleLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor.redColor()
        lb.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0)
        lb.text = "附加信息"
        lb.font = UIFont.systemFontOfSize(32)
        lb.textAlignment = NSTextAlignment.Center
        return lb
    }()
    private var additionTextView: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = UIColor.clearColor()
        tv.tintColor = UIColor.whiteColor()
        tv.textColor = UIColor.whiteColor()
        tv.font = UIFont.systemFontOfSize(17)
        tv.text = "                                                                                            这里我想强调下，我要找一份iOS开发的工作，其他的勿扰！谢谢！                                                 目前处于在职状态，一月内可到职！我自己比较喜欢把平时学习到的知识点总结到简书(网址：http://www.jianshu.com/users/57b58a39b70e/latest_articles),这样可以疏通知识并且方便以后忘记了回来查看或者复习，你们可以通过我的博客了解我的专业知识,这些知识基本都是通过自学获得。                                                                                                                                                                                        在软件行业，自学是必不可少的能力。你永远无法熟悉一个领域的所有知识，但是你必须能够通过网络迅速去掌握项目所需的技术。"
        tv.sizeToFit()
        return tv
    }()
}
