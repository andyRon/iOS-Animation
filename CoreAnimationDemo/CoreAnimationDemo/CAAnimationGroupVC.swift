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
          
    }

    @IBAction func tongshi(_ sender: UIButton) {
        let anima1 = CABasicAnimation(keyPath: "position")
        anima1.fromValue = NSValue(cgPoint: CGPoint(x: 40, y: 240))
        anima1.toValue = NSValue(cgPoint: CGPoint(x: 300, y: 240))
        
        let anima2 = CABasicAnimation(keyPath: "transform.scale")
        anima2.fromValue = NSNumber.init(value: 0.8)
        anima2.toValue = NSNumber.init(value: 2.0)
        
        let anima3 = CABasicAnimation(keyPath: "transform.rotation")
        anima3.toValue = Double.pi*4
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [anima1, anima2, anima3]
        groupAnimation.duration = 3.0
        
        animView.layer.add(groupAnimation, forKey: nil)

    }
    
    @IBAction func lianxu(_ sender: UIButton) {
        let anima1 = CABasicAnimation(keyPath: "position")
        anima1.fromValue = NSValue(cgPoint: CGPoint(x: 40, y: 240))
        anima1.toValue = NSValue(cgPoint: CGPoint(x: 300, y: 240))
        anima1.duration = 1
        animView.layer.add(anima1, forKey: nil)
        
        let anima2 = CABasicAnimation(keyPath: "transform.scale")
        anima2.fromValue = NSNumber.init(value: 0.8)
        anima2.toValue = NSNumber.init(value: 2.0)
        anima2.duration = 1
        animView.layer.add(anima2, forKey: nil)
        
        let anima3 = CABasicAnimation(keyPath: "transform.rotation")
        anima3.toValue = Double.pi*4
        anima3.duration = 1
        animView.layer.add(anima3, forKey: nil)
    }
    

}
