//
//  CAKeyframeAnimationVC.swift
//  CoreAnimationDemo
//
//  Created by andyron<http://andyron.com> on 2018/5/28.
//  Copyright © 2018年 andyron. All rights reserved.
//

import UIKit

class CAKeyframeAnimationVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()


        view.backgroundColor = UIColor.white
        let tempView = UIView(frame: CGRect(x: 50, y: 100, width: 250, height: 500))
        let bezierPath = UIBezierPath(ovalIn: tempView.frame)
        
        let animView = UIView(frame: CGRect(x: 50, y: 150, width: 70, height: 80))
        animView.backgroundColor = UIColor.red
        view.addSubview(animView)
        
        let orbitAnim = CAKeyframeAnimation(keyPath: "position")
        orbitAnim.duration = 5
        orbitAnim.path = bezierPath.cgPath
        orbitAnim.calculationMode = kCAAnimationPaced
        orbitAnim.fillMode = kCAFillModeForwards
        orbitAnim.repeatCount = Float.infinity
        orbitAnim.rotationMode = kCAAnimationRotateAutoReverse
        animView.layer.add(orbitAnim, forKey: "orbitAnim")

        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.purple.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 0.5
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.path = bezierPath.cgPath
        view.layer.addSublayer(shapeLayer)
        
        
        
//        let anima = CAKeyframeAnimation(keyPath: "key")
//        let v0 = NSValue.init(cgPoint: CGPoint.init(x: 0, y: SCREEN_WIDTH/2 - 50))
//        let v1 = NSValue.init(cgPoint: CGPoint.init(x: SCREEN_WIDTH/3, y: SCREEN_WIDTH/2 - 50))
//        let v2 = NSValue.init(cgPoint: CGPoint.init(x: SCREEN_WIDTH/3, y: SCREEN_WIDTH/2 + 50))
//        let v3 = NSValue.init(cgPoint: CGPoint.init(x: SCREEN_WIDTH*2/3, y: SCREEN_WIDTH/2 + 50))
//        let v4 = NSValue.init(cgPoint: CGPoint.init(x: SCREEN_WIDTH*2/3, y: SCREEN_WIDTH/2 - 50))
//        let v5 = NSValue.init(cgPoint: CGPoint.init(x: SCREEN_WIDTH, y: SCREEN_WIDTH/2 - 50))
//        anima.values = [v0,v1,v2,v3,v4,v5]
//        anima.duration = 2.0
////        anima.timingFunctions = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
//        animView.layer.add(anima, forKey: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
