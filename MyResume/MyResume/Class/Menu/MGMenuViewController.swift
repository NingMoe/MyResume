//
//  MGMenuViewController.swift
//  MyResume
//
//  Created by ming on 16/4/17.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGMenuViewController: UIViewController {
    /** 背景颜色 */
    let bgColor = UIColor(red: 00/255, green: 41/255,  blue: 82/255,   alpha: 1.0)
    /** item的高度 */
    var itemHeight:CGFloat!
    /** item数组 */
    var menuItems:[MGMenuItem] = []
    /** 宽度固定70 */
    let width: CGFloat = 70
    /** 定义一个动画的闭包,把动画传出去 */
    var showDetail:((v:UIView)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = bgColor
        
        // 初始化menuItems
        initItems()
    }
    
    // MARK:- 初始化menuItems
    func initItems() {
        menuItems = MGMenuItem.sharedItems
        
        itemHeight = (self.view.bounds.height+(CGFloat(menuItems.count)*1))/CGFloat(menuItems.count)
//        print("MGMenuViewController.width = \(self.view.bounds.width)")
        
        // 遍历
        var itemView: MGItemView!
        for i in 0 ..< menuItems.count {
            itemView = MGItemView(frame: CGRectMake(-width - 32, CGFloat(i)*(itemHeight - 1), width * 2 + 30, itemHeight),title: menuItems[i].title,img: menuItems[i].symbol)
            view.addSubview(itemView)
            itemView.backgroundColor = menuItems[i].color
            // 默认选中第一个基本信息按钮
            if menuItems[i].color == self.view.backgroundColor {
                itemView.isSelected = true
            }
            
            // 右移的闭包方法
            itemView.showDetail = { v in
                self.showDetail?(v: v)
            }
        }
    }
    
    deinit {
        print("判断控制器有木有挂了")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
