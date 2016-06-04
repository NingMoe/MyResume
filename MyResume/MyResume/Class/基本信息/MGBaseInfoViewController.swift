//
//  MGBaseInfoViewController.swift
//  MyResume
//
//  Created by ming on 16/4/17.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit
import SnapKit

class MGBaseInfoViewController: MGBaseViewController {

    var viewWidth:CGFloat!
    //MARK:- 系统的声明周期方法
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewWidth = self.view.bounds.width
        self.automaticallyAdjustsScrollViewInsets = false
        
        setUpLabels()
        
        setUpTranform()
    }
    
    // MARK:- 内部控制方法
    func setUpLabels() {
        view.addSubview(titleLabel)
        view.addSubview(nameLabel)
        view.addSubview(ageLabel)
        view.addSubview(marryLabel)
        view.addSubview(exprLabel)
        view.addSubview(attLabel)
        
        titleLabel.frame = CGRectMake(0, 20, self.view.bounds.width, 50)
        nameLabel.frame = CGRectMake(0, 150, self.view.bounds.width, 50)
        ageLabel.frame = CGRectMake(0, 200, self.view.bounds.width, 50)
        marryLabel.frame = CGRectMake(0, 250, self.view.bounds.width, 50)
        exprLabel.frame = CGRectMake(0, 300, self.view.bounds.width, 50)
        attLabel.frame = CGRectMake(0, 400,self.view.bounds.width, 50)
    }
    
    /// 设置Label的偏移量
    func setUpTranform() {
        titleLabel.transform =  CGAffineTransformMakeTranslation(0, -100)
        titleLabel.alpha = 0
        
        nameLabel.transform =  CGAffineTransformMakeTranslation(viewWidth, 0)
        ageLabel.transform =  CGAffineTransformMakeTranslation(-viewWidth, 0)
        marryLabel.transform =  CGAffineTransformMakeTranslation(viewWidth, 0)
        exprLabel.transform =  CGAffineTransformMakeTranslation(-viewWidth, 0)
        attLabel.transform =  CGAffineTransformMakeTranslation(viewWidth, 0)
    }
    
    /// 动画效果
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: UIViewAnimationOptions.AllowAnimatedContent, animations: { () -> Void in
            
            self.titleLabel.transform = CGAffineTransformIdentity
            self.titleLabel.alpha = 1
            }) { (_) -> Void in
                
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    self.nameLabel.transform = CGAffineTransformIdentity
                    self.exprLabel.transform = CGAffineTransformIdentity
                    self.ageLabel.transform = CGAffineTransformIdentity
                    self.marryLabel.transform = CGAffineTransformIdentity
                    self.attLabel.transform = CGAffineTransformIdentity
                    
                    }, completion: nil)
        }
    }
    
    // MARK:- lazy 
    private var titleLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFontOfSize(32)
        lb.textColor = UIColor.redColor()
        lb.numberOfLines = 0 as Int
        lb.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0)
        lb.text = "基本资料"
        lb.textAlignment = NSTextAlignment.Center
        return lb
    }()
    private var nameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "姓名：保密"
        lb.numberOfLines = 0 as Int
        lb.textAlignment = NSTextAlignment.Center
        return lb
    }()
    private var ageLabel: UILabel = {
        let lb = UILabel()
        lb.text = "年龄：23岁"
        lb.numberOfLines = 0 as Int
        lb.textAlignment = NSTextAlignment.Center
        return lb
    }()
    private var marryLabel: UILabel = {
        let lb = UILabel()
        lb.text = "婚否：未婚"
        lb.numberOfLines = 0 as Int
        lb.textAlignment = NSTextAlignment.Center
        return lb
    }()
    private var exprLabel: UILabel = {
        let lb = UILabel()
        lb.text = "工作经验：2年"
        lb.numberOfLines = 0 as Int
        lb.textAlignment = NSTextAlignment.Center
        return lb
    }()
    private var attLabel: UILabel = {
        let lb = UILabel()
        lb.text = "求职：目前离职，希望找一份iOS相关的工作"
        lb.numberOfLines = 0 as Int
        lb.textAlignment = NSTextAlignment.Center
        return lb
    }()
}

/*
/// 初始化Label
func setUpLabels() {
    view.addSubview(titleLabel)
    view.addSubview(nameLabel)
    view.addSubview(ageLabel)
    view.addSubview(marryLabel)
    view.addSubview(exprLabel)
    view.addSubview(attLabel)
    
    
    titleLabel.snp_makeConstraints { (make) -> Void in
        make.width.equalTo(view)
        make.left.equalTo(view)
        make.height.equalTo(30)
        
        make.top.equalTo(view).offset(25)
    }
    nameLabel.snp_makeConstraints { (make) -> Void in
        make.left.right.equalTo(view)
        make.top.equalTo(titleLabel.snp_bottom).offset(50)
    }
    ageLabel.snp_makeConstraints { (make) -> Void in
        make.left.right.equalTo(view)
        make.top.equalTo(nameLabel.snp_bottom).offset(25)
    }
    marryLabel.snp_makeConstraints { (make) -> Void in
        make.left.right.equalTo(view)
        make.top.equalTo(ageLabel.snp_bottom).offset(25)
    }
    exprLabel.snp_makeConstraints { (make) -> Void in
        make.left.right.equalTo(view)
        make.top.equalTo(marryLabel.snp_bottom).offset(25)
    }
    attLabel.snp_makeConstraints { (make) -> Void in
        make.left.right.equalTo(view)
        make.top.equalTo(exprLabel.snp_bottom).offset(25)
    }
}
*/

