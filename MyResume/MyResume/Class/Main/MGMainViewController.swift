//
//  MGMainViewController.swift
//  MyResume
//
//  Created by ming on 16/4/17.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit
import SnapKit

class MGMainViewController: UIViewController {
let bgColor = UIColor(red: 00/255, green: 41/255,  blue: 82/255,   alpha: 1.0)
    
    var homeVC: UIViewController?
    var menuVC: MGMenuViewController?
    
    // MARK:- 控制器的生命周期
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.setContentOffset(CGPointMake(CGRectGetWidth(menuVC!.view.bounds), 0), animated: false)
        scrollView.contentSize = CGSizeMake(view.frame.size.width + menuVC!.view.bounds.width, 0)
//        print("menuVC.view.bounds.width = \(CGRectGetWidth(menuVC!.view.bounds))")
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = bgColor
        
        self.navigationController?.navigationBarHidden = true
        
        // 初始化子控件
        setUpUI()
        
        switchChildViewControl()
    }
    
    // MARK:- 内部控制方法
    func setUpUI() {
        // 1.添加子控件
        view.addSubview(scrollView)
        scrollView.addSubview(containView)
        scrollView.addSubview(detailView)
        menuVC = MGMenuViewController.init()
        homeVC = MGBaseInfoViewController.init()
        addChildViewController(menuVC!)
        addChildViewController(homeVC!)
        
        detailView.addSubview(homeVC!.view)
        scrollView.addSubview(menuVC!.view)
        
        // 2.布局子控件
//        containView.snp_makeConstraints { (make) -> Void in
//            make.left.right.top.bottom.equalTo(scrollView)
//        }
        detailView.snp_makeConstraints { (make) -> Void in
            make.right.top.bottom.equalTo(scrollView)
            make.left.equalTo(menuVC!.view.snp_right)
        }
        menuVC!.view.snp_makeConstraints { (make) -> Void in
            make.left.top.bottom.equalTo(containView)
            make.width.equalTo(70)
        }
        homeVC!.view.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(0)
        }
//        homeVC!.view.snp_makeConstraints { (make) -> Void in
//            make.right.top.bottom.equalTo(scrollView)
//            make.left.equalTo(menuVC!.view.snp_right)
//        }
    }
    
    //MARK:- 切换控制器(可以不看)
    func switchChildViewControl(){
        if let menuVC = menuVC {
            menuVC.showDetail =
                { v in
                    self.toggleMenu()
                    let myV = v as! MGItemView
                    for otV in (myV.superview?.subviews)!
                    {
                        if let otV = otV as? MGItemView
                        {
                            if otV == myV
                            {
                                otV.isSelected = true
                            }else {
                                otV.isSelected = false
                            }
                        }
                    }
                    
                    
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        myV.center = CGPointMake(self.view.frame.width/2, -100)
                        myV.transform = CGAffineTransformMakeScale(0.5, 0.5)
                        }, completion: { (_) -> Void in
                            myV.transform = CGAffineTransformIdentity
                            myV.center.x = myV.originalX
                            myV.center.y = myV.originalY
                            
                            var details: MGBaseViewController!
                            switch(myV.titleString) {
                                case ResumeInfomation.BaseInfo.rawValue: // 基本信息
                                    details = MGBaseInfoViewController()
                                case ResumeInfomation.OccupationalIntent.rawValue: // 职业意向
                                    details = MGOccupationalVC()
                                case ResumeInfomation.PersonalProfile.rawValue:  // 个人优势
                                    details = MGPersonalProfileVC()
                                case ResumeInfomation.EducationExperience.rawValue: // 教育经历 
                                    details = MGEducationExperienceVC()
                                case ResumeInfomation.LanguageSkill.rawValue: // 语言能力
                                    details = MGLanguageSkillVC()
                                case ResumeInfomation.WorkExperience.rawValue: // 工作经历
                                    details = MGWorkExperienceVC()
                                case ResumeInfomation.ProjectExperience.rawValue: // 项目经验
                                    details = MGProjectExperienceVC()
                                case ResumeInfomation.Skills.rawValue: // 技巧
                                    details = MGSkillsVC()
                                case ResumeInfomation.AdditionalInfo.rawValue: // 附加信息
                                    details = MGAdditionalInfoVC()
                               
                                default:
                                    break
                            }
                            
                            details.view.backgroundColor = myV.backgroundColor
                            self.menuVC?.view.backgroundColor = myV.backgroundColor
                            self.addChildViewController(details)
                            
                            self.transitionFromViewController(self.homeVC!, toViewController: details, duration: 0.4 , options: UIViewAnimationOptions.TransitionCurlDown, animations: { () -> Void in
                                
                                
                                }, completion: { (_) -> Void in
                                    self.homeVC!.removeFromParentViewController()  //每次都把前一个移除
                                    self.homeVC = details
                            })

//                            self.detailView.backgroundColor = myV.backgroundColor
//                            details.view.frame = (self.homeVC?.view.bounds)!

//                            UIView.transitionFromView((self.menuVC?.view)!, toView: details.view, duration: 2.0, options: UIViewAnimationOptions.TransitionCurlDown,  completion: { (_) -> Void in
//                                self.homeVC!.view.removeFromSuperview()  //每次都把前一个移除
//                                self.homeVC = details
//                            })
                    })
            }
        }
    }
    
    // 界面切换时负责滚动到合适位置
    private func toggleMenu() {
        let menuOffsetX = CGRectGetWidth(menuVC!.view.bounds)
        scrollView.contentOffset = CGPointMake((scrollView.contentInset.left == 0 ? menuOffsetX : 0), 0)
//        print(menuOffsetX)
    }
    
    // MARK:- lazy 懒加载
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView(frame: UIScreen.mainScreen().bounds)
        sv.delegate = self
        sv.bounces = false
        sv.pagingEnabled = true
        sv.showsHorizontalScrollIndicator = false
        sv.showsVerticalScrollIndicator = false
        return sv
    }()
    private lazy var containView: UIView = {
        let sv = UIView(frame: UIScreen.mainScreen().bounds)
        return sv
    }()
    private lazy var detailView: UIView = {
        let sv = UIView(frame: UIScreen.mainScreen().bounds)
        return sv
    }()
}


// MARK:- UIScrollViewDelegate代理方法
extension MGMainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        scrollView.pagingEnabled = scrollView.contentOffset.x < (scrollView.contentSize.width - CGRectGetWidth(scrollView.frame))
        
//        print(self.scrollView.contentOffset.x)
    }
}

//class MGNavController: UINavigationController {
//    override func pushViewController(viewController: UIViewController, animated: Bool) {
//        if self.viewControllers.count == 0 {
//            self.navigationController?.navigationBarHidden = true
//        }else {
//            self.navigationController?.navigationBarHidden = false
//        }
//        print(self.viewControllers.count)
//        self.navigationController?.navigationBar.backgroundColor = UIColor.redColor()
//        super.pushViewController(viewController, animated: true)
//    }
//}

