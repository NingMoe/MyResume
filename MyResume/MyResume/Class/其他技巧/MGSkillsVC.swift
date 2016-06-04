//
//  MGSkillsVC.swift
//  MyResume
//
//  Created by ming on 16/4/25.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGSkillsVC: MGBaseViewController {

    //MARK:- 系统的声明周期方法
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置子控件
        setUpUI()
        
        // 设置各个控件的transform
        titleLabel.transform =  CGAffineTransformMakeTranslation(0, -100)
        titleLabel.alpha = 0
        let viewHeight = self.view.bounds.height
        
        skillView.transform =  CGAffineTransformMakeTranslation(-viewHeight, 0)
        skillView.transform =  CGAffineTransformMakeScale(0, 0)
        skillView.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: UIViewAnimationOptions.AllowAnimatedContent, animations: { () -> Void in
                self.titleLabel.transform = CGAffineTransformIdentity
                self.titleLabel.alpha = 1
            }) { (_) -> Void in
                
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    self.skillView.transform = CGAffineTransformIdentity
                    self.skillView.alpha = 1
                    }, completion: nil)
                
        }
        
    }

    
    // MARK:- 内部控制方法
    private func setUpUI() {
        view.addSubview(titleLabel)
        view.addSubview(skillView)
        skillView.addSubview(label1)
        skillView.addSubview(label2)
        skillView.addSubview(label3)
        skillView.addSubview(label4)
        skillView.addSubview(label5)
        skillView.addSubview(label6)
        skillView.addSubview(label7)
        skillView.addSubview(label8)
        skillView.addSubview(label9)
        
        titleLabel.snp_makeConstraints { (make) -> Void in
            make.left.width.equalTo(view)
            make.height.equalTo(30)
            make.top.equalTo(view).offset(25)
        }
        skillView.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(view)
            make.width.equalTo(self.view.bounds.width * 0.9)
            make.height.equalTo(self.view.bounds.height * 0.5)
        }
        label1.snp_makeConstraints { (make) -> Void in
            make.leading.top.equalTo(skillView).offset(10)
            make.trailing.equalTo(label2.snp_leading).offset(-10)
            make.bottom.equalTo(label4.snp_top).offset(-10)
        }
        label2.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(skillView).offset(10)
            make.bottom.equalTo(label5.snp_top).offset(-10)
            make.width.height.equalTo(label1)
        }
        label3.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(skillView).offset(10)
            make.left.equalTo(label2.snp_right).offset(10)
            make.trailing.equalTo(skillView).offset(-10)
            make.bottom.equalTo(label6.snp_top).offset(-10)
            make.width.height.equalTo(label1)
        }
        
        
        label4.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(skillView).offset(10)
            make.trailing.equalTo(label5.snp_leading).offset(-10)
            make.bottom.equalTo(label7.snp_top).offset(-10)
            make.width.height.equalTo(label1)
        }
        label5.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(label8.snp_top).offset(-10)
            make.width.height.equalTo(label1)
        }
        label6.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(label5.snp_right).offset(10)
            make.trailing.equalTo(skillView).offset(-10)
            make.bottom.equalTo(label9.snp_top).offset(-10)
            make.width.height.equalTo(label1)
        }
        
        
        label7.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(skillView).offset(10)
            make.trailing.equalTo(label8.snp_leading).offset(-10)
            make.bottom.equalTo(skillView).offset(-10)
            make.width.height.equalTo(label1)
        }
        label8.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(skillView).offset(-10)
            make.width.height.equalTo(label1)
        }
        label9.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(label5.snp_right).offset(10)
            make.trailing.equalTo(skillView).offset(-10)
            make.bottom.equalTo(skillView).offset(-10)
            make.width.height.equalTo(label1)
        }
    }

    // MARK:- lazy
    private var titleLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor.redColor()
        lb.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0)
        lb.text = "熟练技巧"
        lb.font = UIFont.systemFontOfSize(32)
        lb.textAlignment = NSTextAlignment.Center
        return lb
    }()
    private var skillView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clearColor()
        return view
    }()
    private var label1: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0)
        lb.text = "C语言"
        lb.font = UIFont.systemFontOfSize(17)
        lb.textAlignment = NSTextAlignment.Center
        lb.backgroundColor = UIColor(red: 23/255.0, green: 23/255.0, blue: 23/255.0, alpha: 1)
        return lb
    }()
    private var label2: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0)
        lb.text = "C++"
        lb.font = UIFont.systemFontOfSize(17)
        lb.textAlignment = NSTextAlignment.Center
        lb.backgroundColor = UIColor(red: 200/255.0, green: 23/255.0, blue: 23/255.0, alpha: 1)
        return lb
    }()
    private var label3: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0)
        lb.text = "Objective-C"
        lb.font = UIFont.systemFontOfSize(17)
        lb.textAlignment = NSTextAlignment.Center
        lb.backgroundColor = UIColor(red: 23/255.0, green: 200/255.0, blue: 23/255.0, alpha: 1)
        return lb
    }()
    private var label4: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0)
        lb.text = "Swift"
        lb.font = UIFont.systemFontOfSize(17)
        lb.textAlignment = NSTextAlignment.Center
        lb.backgroundColor = UIColor(red: 23/255.0, green: 23/255.0, blue: 200/255.0, alpha: 1)
        return lb
    }()
    private var label5: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0)
        lb.text = "JAVA"
        lb.font = UIFont.systemFontOfSize(17)
        lb.textAlignment = NSTextAlignment.Center
        lb.backgroundColor = UIColor(red: 200/255.0, green: 100/255.0, blue: 23/255.0, alpha: 1)
        return lb
    }()
    private var label6: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0)
        lb.text = "HTML"
        lb.font = UIFont.systemFontOfSize(17)
        lb.textAlignment = NSTextAlignment.Center
        lb.backgroundColor = UIColor(red: 200/255.0, green: 100/255.0, blue: 200/255.0, alpha: 1)
        return lb
    }()
    private var label7: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0)
        lb.text = "SQLite"
        lb.font = UIFont.systemFontOfSize(17)
        lb.textAlignment = NSTextAlignment.Center
        lb.backgroundColor = UIColor(red: 80/255.0, green: 50/255.0, blue: 66/255.0, alpha: 1)
        return lb
    }()
    private var label8: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0)
        lb.text = "iOS"
        lb.font = UIFont.systemFontOfSize(17)
        lb.textAlignment = NSTextAlignment.Center
        lb.backgroundColor = UIColor(red: 80/255.0, green: 150/255.0, blue: 166/255.0, alpha: 1)
        return lb
    }()
    private var label9: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0)
        lb.text = "Android"
        lb.font = UIFont.systemFontOfSize(17)
        lb.textAlignment = NSTextAlignment.Center
        lb.backgroundColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1)
        return lb
    }()
}
