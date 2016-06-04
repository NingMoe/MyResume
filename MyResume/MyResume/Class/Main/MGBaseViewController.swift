//
//  MGBaseViewController.swift
//  MyResume
//
//  Created by ming on 16/4/17.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGBaseViewController: UIViewController {
    
    let bgColor = UIColor(red: 00/255, green: 41/255,  blue: 82/255,   alpha: 1.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置默认背景颜色
        view.backgroundColor = bgColor
        
        
        //粒子下雪效果
        let emitter: CAEmitterLayer = CAEmitterLayer()
//        _emitter = emitter;
        emitter.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height * 0.5);
        self.view.layer.addSublayer(emitter)
        
        emitter.emitterShape = kCAEmitterLayerRectangle;
        emitter.emitterPosition = CGPointMake(self.view.bounds.size.width * 0.5, 0);
        emitter.emitterSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height * 0.3);
        
        let cell: CAEmitterCell = CAEmitterCell()
        cell.birthRate = 20
        cell.lifetime = 8
        
        cell.contents = UIImage(named: "xh")!.scaleImage(40).CGImage
//        let scale: CGFloat = CGFloat((arc4random_uniform(50)/100.0 + 0.01)
//        [cell setValue:@(scale) forKeyPath:@"transform.scale"]
//        var scale = rand_r(50)
//        let x = Random.randomNormal(mean: 0, standardDeviation: 1)!
        let scale = drand48() / 6
        cell.setValue("\(scale)", forKeyPath: "transform.scale")
        
        cell.yAcceleration = 60.0
        cell.xAcceleration = 10.0
        cell.velocity = 20.0
        cell.emissionLongitude = CGFloat(-M_PI);
        cell.velocityRange = 100.0
        cell.emissionRange = CGFloat(M_PI_2)
        
        cell.redRange   = 0.1
        cell.greenRange = 0.1
        cell.blueRange  = 0.1
        cell.scale = 0.8
        cell.scaleRange = 0.8
        cell.scaleSpeed = -0.15
        cell.alphaRange = 0.75
        cell.alphaSpeed = -0.15
        cell.lifetimeRange = 1.0
        
        emitter.emitterCells = [cell]
        self.view.layer.addSublayer(emitter)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("MGMBaseViewController")
    }
    
    func dsad() {
        let rect = CGRect(x: 0.0, y: -70.0, width: view.bounds.width,
            height: 50.0)
        let emitter = CAEmitterLayer()
        emitter.frame = rect
        view.layer.addSublayer(emitter)
        emitter.emitterShape = kCAEmitterLayerRectangle
        
        //kCAEmitterLayerPoint
        //kCAEmitterLayerLine
        //kCAEmitterLayerRectangle
        
        emitter.emitterPosition = CGPointMake(rect.width/2, rect.height/2)
        emitter.emitterSize = rect.size
        
        let emitterCell = CAEmitterCell()
        emitterCell.contents = UIImage(named: "xh")!.scaleImage(30).CGImage
        emitterCell.birthRate = 50  //每秒产生120个粒子
        emitterCell.lifetime = 3    //存活1秒
        emitterCell.lifetimeRange = 3.0
        
        emitter.emitterCells = [emitterCell]  //这里可以设置多种粒子 我们以一种为粒子
        emitterCell.yAcceleration = 30.0  //给Y方向一个加速度
        emitterCell.xAcceleration = 20.0 //x方向一个加速度
        emitterCell.velocity = 20.0 //初始速度
        emitterCell.emissionLongitude = CGFloat(-M_PI) //向左
        emitterCell.velocityRange = 200.0   //随机速度 -200+20 --- 200+20
        emitterCell.emissionRange = CGFloat(M_PI_2) //随机方向 -pi/2 --- pi/2
        //emitterCell.color = UIColor(red: 0.9, green: 1.0, blue: 1.0,
        //   alpha: 1.0).CGColor //指定颜色
        emitterCell.redRange = 0.3
        emitterCell.greenRange = 0.3
        emitterCell.blueRange = 0.3  //三个随机颜色
        
        emitterCell.scale = 0.8
        emitterCell.scaleRange = 0.8  //0 - 1.6
        emitterCell.scaleSpeed = -0.15  //逐渐变小
        
        emitterCell.alphaRange = 0.75   //随机透明度
        emitterCell.alphaSpeed = -0.15  //逐渐消失
    }

}
