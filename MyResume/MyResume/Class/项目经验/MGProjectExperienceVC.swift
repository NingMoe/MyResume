//
//  MGProjectExperienceVC.swift
//  MyResume
//
//  Created by ming on 16/4/25.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGProjectExperienceVC: MGBaseViewController {

    let width = UIScreen.mainScreen().bounds.width - 100
    //MARK:- 系统的声明周期方法
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置子控件
        setUpUI()
        
        // 设置各个控件的transform
        titleLabel.transform =  CGAffineTransformMakeTranslation(0, -100)
        titleLabel.alpha = 0
        
//        projectTextView1.transform = CGAffineTransformMakeTranslation(-self.view.bounds.width, 0)
//        projectTextView2.transform = CGAffineTransformMakeTranslation(self.view.bounds.width, 0)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: UIViewAnimationOptions.AllowAnimatedContent, animations: { () -> Void in
                self.titleLabel.transform = CGAffineTransformIdentity
                self.titleLabel.alpha = 1
            }) { (_) -> Void in
                UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 20, options: UIViewAnimationOptions.TransitionFlipFromLeft, animations: { () -> Void in
                        self.projectTextView1.snp_updateConstraints(closure: { (make) -> Void in
                            make.centerX.equalTo(view.center.x).offset(0)
                        })
                        self.projectTextView2.snp_updateConstraints(closure: { (make) -> Void in
                            make.centerX.equalTo(view.center.x).offset(0)
                        })
//                        print("self.view.center.x\(self.view.center.x)")
//                        print("后projectTextView1\(self.projectTextView1.frame)")
//                        print("后projectTextView2\(self.projectTextView2.frame)")
                        self.view.layoutIfNeeded()
                    
                    }, completion: nil)
        }
    }
   
    // MARK:- 内部控制方法
    private func setUpUI() {
        view.addSubview(titleLabel)
        view.addSubview(projectTextView1)
        view.addSubview(projectTextView2)
        
        titleLabel.snp_makeConstraints { (make) -> Void in
            make.left.width.equalTo(view)
            make.height.equalTo(30)
            make.top.equalTo(view).offset(25)
        }
        projectTextView1.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view.center.x).offset(-width)
            make.width.equalTo(width)
            make.height.equalTo(300)
            make.centerY.equalTo(view.center.y).offset(-100)
        }
        projectTextView2.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view.center.x).offset(width)
            make.width.equalTo(width)
            make.height.equalTo(300)
            make.centerY.equalTo(view.center.y).offset(120)
        }
//        print("前projectTextView1\(self.projectTextView1.frame)")
//        print("前projectTextView2\(self.projectTextView2.frame)")
    }

    // MARK:- lazy
    private var titleLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor.redColor()
        lb.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0)
        lb.text = "项目经验"
        lb.font = UIFont.systemFontOfSize(32)
        lb.textAlignment = NSTextAlignment.Center
        return lb
    }()
    private var projectTextView1: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = UIColor.clearColor()
        tv.tintColor = UIColor.whiteColor()
        tv.textColor = UIColor.whiteColor()
        tv.font = UIFont.systemFontOfSize(17)
        tv.text = "辣车库（2015/09–2016/03                                                                  项目职务: 开发                                                                                         所在公司: 前海辣车                                                                                        项目描述: 辣车库app让你了解更多的汽车动态。辣车库app提供一个提车平台，这里集合了汽车的各种前沿信息，并且还支持自己建立专属的爱车档案。                                                                                           项目职责: 主要负责辣车App"
       tv.sizeToFit()
        return tv
    }()
//    frame: CGRectMake(50, 400, UIScreen.mainScreen().bounds.width, 200)
    private var projectTextView2: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = UIColor.clearColor()
        tv.tintColor = UIColor.whiteColor()
        tv.textColor = UIColor.whiteColor()
        tv.font = UIFont.systemFontOfSize(17)
        tv.text = "芙蓉兴盛（2014/03–2015/08）                                                                  项目职务: 开发                                                                                                              所在公司: 保密                                                                                        项目描述: 芙蓉兴盛是一款高性价比手机网购App。万种物品，随意挑选，确保正品，轻松下单，送货上门。       项目职责: 作为主力开发芙蓉兴盛这款App，负责项目的软件的整体架构负责核心模块代码编写"
        //        tv.sizeToFit()
        return tv
    }()

}
