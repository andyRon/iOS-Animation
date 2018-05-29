//
//  CASpringAnimationVC.swift
//  CoreAnimationDemo
//
//  Created by andyron<http://andyron.com> on 2018/5/29.
//  Copyright © 2018年 andyron. All rights reserved.
//

import UIKit

class CASpringAnimationVC: UIViewController {

    var jellyView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jellyView.backgroundColor = .red
        jellyView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        jellyView.layer.cornerRadius = 50
        jellyView.layer.masksToBounds = true
        self.view.addSubview(jellyView)

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = touch?.location(in: self.view)
        
        self.springAnimationTextAction(point: point!)
    }
    
    func springAnimationTextAction(point: CGPoint) {
        // 不同的keypath，不同的效果
        let springAnimation = CASpringAnimation(keyPath: "position.y")
        
        if springAnimation.keyPath == "position" {
            springAnimation.fromValue = NSValue.init(cgPoint: self.jellyView.layer.position)
            springAnimation.toValue = NSValue.init(cgPoint: point)
        } else if springAnimation.keyPath == "position.x" {
            springAnimation.fromValue = self.jellyView.layer.position.x
            springAnimation.toValue = point.x
        } else if springAnimation.keyPath == "position.y" {
            springAnimation.fromValue = self.jellyView.layer.position.y
            springAnimation.toValue = point.y
        } else if springAnimation.keyPath == "bounds" {
            springAnimation.fromValue = NSValue.init(cgRect: CGRect(x: point.x, y: point.y, width: 60, height: 60))
            springAnimation.toValue = NSValue.init(cgRect: self.jellyView.frame)
        }
        
        springAnimation.mass = 5
        
        springAnimation.stiffness = 100
        
        springAnimation.damping = 10
        
        springAnimation.initialVelocity = 10
        springAnimation.duration = springAnimation.settlingDuration
        
        springAnimation.isRemovedOnCompletion = false
        
        self.jellyView.layer.add(springAnimation, forKey: "springAnimation")
    }
    
}
