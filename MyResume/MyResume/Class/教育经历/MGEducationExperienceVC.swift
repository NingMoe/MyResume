//
//  MGEducationExperienceVC.swift
//  MyResume
//
//  Created by ming on 16/4/21.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGEducationExperienceVC: MGBaseViewController {
    
    var viewWidth:CGFloat!
    
    //MARK:- 系统的声明周期方法
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置子控件
        setUpUI()
        
        // 设置各个控件的transform
        titleLabel.transform =  CGAffineTransformMakeTranslation(0, -100)
        titleLabel.alpha = 0
        viewWidth = self.view.bounds.width
        
        schoolLabel.transform =  CGAffineTransformMakeTranslation(-viewWidth, 0)
        majorlLabel.transform =  CGAffineTransformMakeTranslation(-viewWidth, 0)
        gradeLabel.transform =  CGAffineTransformMakeTranslation(-viewWidth, 0)
    }
        
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: UIViewAnimationOptions.AllowAnimatedContent, animations: { () -> Void in
            
            self.titleLabel.transform = CGAffineTransformIdentity
            self.titleLabel.alpha = 1
            }) { (_) -> Void in
                
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                        self.schoolLabel.transform = CGAffineTransformIdentity
                    }, completion: nil)
                
                UIView.animateWithDuration(0.4, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                        self.majorlLabel.transform = CGAffineTransformIdentity
                    }, completion: nil)
                
                UIView.animateWithDuration(0.3, delay: 0.3, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    self.gradeLabel.transform = CGAffineTransformIdentity
                    }, completion: nil)     
        }
    }
    
    //MARK:- 设置子控件
    private func setUpUI() {
        view.addSubview(titleLabel)
        view.addSubview(schoolLabel)
        view.addSubview(majorlLabel)
        view.addSubview(gradeLabel)
        
        titleLabel.snp_makeConstraints { (make) -> Void in
            make.left.width.equalTo(view)
            make.height.equalTo(50)
            make.top.equalTo(view).offset(25)
        }
        schoolLabel.frame = CGRectMake(0, UIScreen.mainScreen().bounds.height/2 - 50, UIScreen.mainScreen().bounds.width, 30)
        majorlLabel.frame = CGRectMake(0, UIScreen.mainScreen().bounds.height/2, UIScreen.mainScreen().bounds.width, 30)
        gradeLabel.frame = CGRectMake(0, UIScreen.mainScreen().bounds.height/2 + 50, UIScreen.mainScreen().bounds.width, 30)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    // MARK:- lazy
    private var titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "教育经历"
        lb.font = UIFont.systemFontOfSize(32)
        lb.textAlignment = NSTextAlignment.Center
        return lb
    }()
    private var schoolLabel: UILabel = {
        let lb = UILabel()
        lb.text = "嘉应学院(2010.09-2014.06)"
        lb.textAlignment = NSTextAlignment.Center
        return lb
    }()
    private var majorlLabel: UILabel = {
        let lb = UILabel()
         lb.text = "电子信息工程"
        lb.textAlignment = NSTextAlignment.Center
        return lb
    }()
    private var gradeLabel: UILabel = {
        let lb = UILabel()
         lb.text = "统招本科2A院校"
        lb.textAlignment = NSTextAlignment.Center
        return lb
    }()
    
}
