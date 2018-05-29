//
//  CAAnimationGroupVC.swift
//  CoreAnimationDemo
//
//  Created by andyron<http://andyron.com> on 2018/5/28.
//  Copyright © 2018年 andyron. All rights reserved.
//

import UIKit

class CAAnimationGroupVC: UIViewController {

    var animView: UIView = UIView(frame: CGRect(x: 50, y: 150, width: 70, height: 80))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animView.backgroundColor = UIColor.red
        view.addSubview(animView)
        
        // 位移
        let anima1 = CABasicAnimation(keyPath: "position")
        anima1.fromValue = NSValue(cgPoint: CGPoint(x: 40, y: 240))
        anima1.toValue = NSValue(cgPoint: CGPoint(x: 300, y: 240))
        // 缩放
        let anima2 = CABasicAnimation(keyPath: "transform.scale")
        anima2.fromValue = NSNumber.init(value: 0.8)
        anima2.toValue = NSNumber.init(value: 2.0)
        // 旋转
        let anima3 = CABasicAnimation(keyPath: "transform.rotation")
        anima3.toValue = Double.pi*4
        // 组合
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [anima1, anima2, anima3]
        groupAnimation.duration = 3.0
        
        animView.layer.add(groupAnimation, forKey: nil)
          
    }

    
    @IBAction func tongshi(_ sender: UIButton) {
        // 位移
        let anima1 = CABasicAnimation(keyPath: "position")
        anima1.fromValue = NSValue(cgPoint: CGPoint(x: 40, y: 240))
        anima1.toValue = NSValue(cgPoint: CGPoint(x: 300, y: 240))
        // 缩放
        let anima2 = CABasicAnimation(keyPath: "transform.scale")
        anima2.fromValue = NSNumber.init(value: 0.8)
        anima2.toValue = NSNumber.init(value: 2.0)
        // 旋转
        let anima3 = CABasicAnimation(keyPath: "transform.rotation")
        anima3.toValue = Double.pi*4
        // 组合
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [anima1, anima2, anima3]
        groupAnimation.duration = 3.0
        
        animView.layer.add(groupAnimation, forKey: nil)

    }
    


}
