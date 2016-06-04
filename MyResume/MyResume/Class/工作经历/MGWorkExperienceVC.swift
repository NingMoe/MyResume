//
//  MGWorkExperienceVC.swift
//  MyResume
//
//  Created by ming on 16/4/21.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGWorkExperienceVC: MGBaseViewController {

    
    //MARK:- 系统的声明周期方法
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置子控件
        setUpUI()
        
        // 设置各个控件的transform
        titleLabel.transform =  CGAffineTransformMakeTranslation(0, -100)
        titleLabel.alpha = 0
        
        self.view.layoutIfNeeded()
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: UIViewAnimationOptions.AllowAnimatedContent, animations: { () -> Void in
                self.titleLabel.transform = CGAffineTransformIdentity
                self.titleLabel.alpha = 1
            
            }) { (_) -> Void in
                UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in

                    
                    }){_ in
                        
                        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                            
                            self.view.layoutIfNeeded()
                            
                            }){_ in
                                
                                UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                                    
                                    self.workTextView1.snp_updateConstraints(closure: { (make) -> Void in
                                        make.centerY.equalTo(view.center.y).offset(-20)
                                    })
                                    self.view.layoutIfNeeded()
                                    
                                    }){_ in
                                        
                                        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 80, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                                            self.workTextView2.snp_updateConstraints(closure: { (make) -> Void in
                                               make.centerY.equalTo(view.center.y).offset(180)
                                            })
                                                self.view.layoutIfNeeded()
                                            
                                            }){_ in
  
                                        }
                                }
                                
                        }
                }
        }
    }
    
    // MARK:- 内部控制方法
    private func setUpUI() {
        view.addSubview(titleLabel)
        view.addSubview(workTextView1)
        view.addSubview(workTextView2)
        
        let width = UIScreen.mainScreen().bounds.width - 100
        titleLabel.snp_makeConstraints { (make) -> Void in
            make.left.width.equalTo(view)
            make.height.equalTo(30)
            make.top.equalTo(view).offset(25)
        }
        workTextView1.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.width.equalTo(width)
            make.height.equalTo(300)
            make.centerY.equalTo(view.center.y).offset(-800)
        }
        workTextView2.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.width.equalTo(width)
            make.height.equalTo(300)
            make.centerY.equalTo(view.center.y).offset(800)
        }
    }


    // MARK:- lazy
    private var titleLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor.redColor()
        lb.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0)
        lb.text = "工作经历"
        lb.font = UIFont.systemFontOfSize(32)
        lb.textAlignment = NSTextAlignment.Center
        return lb
    }()
    private var workTextView1: UITextView = {
        let tv = UITextView(frame: CGRectMake(50, 100, UIScreen.mainScreen().bounds.width, 200))
        tv.backgroundColor = UIColor.clearColor()
        tv.tintColor = UIColor.whiteColor()
        tv.textColor = UIColor.whiteColor()
        tv.font = UIFont.systemFontOfSize(17)
        tv.text = "2015年9月 - 2016年3月                                                                       公司：深圳前海辣车科技有限                                                                            公司地点：深圳                                                                        深圳职位：iOS开发工程师                                                                             工作职责：主要负责一个叫辣车库的App。负责界面的搭建，核心代码的编写, 整体架构的搭建以及各个模块的编写"
//        tv.sizeToFit()
        return tv
    }()
    private var workTextView2: UITextView = {
        let tv = UITextView(frame: CGRectMake(50, 400, UIScreen.mainScreen().bounds.width, 200))
        tv.backgroundColor = UIColor.clearColor()
        tv.tintColor = UIColor.whiteColor()
        tv.textColor = UIColor.whiteColor()
        tv.font = UIFont.systemFontOfSize(17)
        tv.text = "2014年3月 - 2015年8月                                                                            公司：广州品星软件科技有限公司                                                                                                                                                       工作地点：广州                                                                                                                                                      职位：iOS实习生/iOS工程师                                                                            工作职责：主要是框架搭建和部分功能模块的开发，负责解决开发过程中的技术问题"
        //        tv.sizeToFit()
        return tv
    }()
}
