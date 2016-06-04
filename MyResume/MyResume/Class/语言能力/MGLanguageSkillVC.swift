//
//  MGLanguageSkillVC.swift
//  MyResume
//
//  Created by ming on 16/4/21.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGLanguageSkillVC: MGBaseViewController {

    //MARK:- 系统的声明周期方法
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置子控件
        setUpUI()
        
        // 设置各个控件的transform
        titleLabel.transform =  CGAffineTransformMakeTranslation(0, -100)
        titleLabel.alpha = 0
        let width = UIScreen.mainScreen().bounds.width
        
        pthLabel.transform =  CGAffineTransformMakeTranslation(-width, 0)
        englishLabel.transform =  CGAffineTransformMakeTranslation(+width, 0)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.3, delay: 0.2, usingSpringWithDamping: 2, initialSpringVelocity: 20, options: UIViewAnimationOptions.TransitionFlipFromBottom, animations: { () -> Void in
                self.titleLabel.transform = CGAffineTransformIdentity
                self.titleLabel.alpha = 1
            }) { (_) -> Void in
                UIView.animateWithDuration(0.5, delay: 0.2, options: UIViewAnimationOptions.Autoreverse, animations: { () -> Void in
                        self.pthLabel.transform = CGAffineTransformIdentity
                        self.englishLabel.transform = CGAffineTransformIdentity
                    }, completion: nil)
        }
    }
    
    // MARK:- 内部控制方法
    private func setUpUI() {
        view.addSubview(titleLabel)
        view.addSubview(pthLabel)
        view.addSubview(englishLabel)
        
        titleLabel.snp_makeConstraints { (make) -> Void in
            make.left.width.equalTo(view)
            make.height.equalTo(30)
            make.top.equalTo(view).offset(25)
        }
        pthLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(-50)
        }
        englishLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(50)
        }
    }
    
    
    // MARK:- lazy
    private var titleLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFontOfSize(32)
        lb.textColor = UIColor.redColor()
        lb.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0)
        lb.text = "语言能力"
        lb.textAlignment = NSTextAlignment.Center
        return lb
    }()
    private var pthLabel: UILabel = {
        let lb = UILabel()
        lb.text  = "普通话"
        lb.textAlignment = NSTextAlignment.Center
        return lb
    }()
    private var englishLabel: UILabel = {
        let lb = UILabel()
        lb.text  = "外语四级(CET-4)"
        lb.textAlignment = NSTextAlignment.Center
        return lb
    }()
    

}
