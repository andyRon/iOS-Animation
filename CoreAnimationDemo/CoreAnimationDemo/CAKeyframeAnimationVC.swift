//
//  CAKeyframeAnimationVC.swift
//  CoreAnimationDemo
//
//  Created by andyron<http://andyron.com> on 2018/5/28.
//  Copyright © 2018年 andyron. All rights reserved.
//

import UIKit

class CAKeyframeAnimationVC: UIViewController {

    var animView = UIView(frame: CGRect(x: 50, y: 150, width: 70, height: 80))
    
    override func viewDidLoad() {
        super.viewDidLoad()


        view.backgroundColor = UIColor.white
        
        animView.backgroundColor = UIColor.red
        view.addSubview(animView)
        
        
    }

    @IBAction func btn1(_ sender: UIButton) {
        let anima = CAKeyframeAnimation(keyPath: "transform.rotation")
        anima.values = [-Double.pi/180*4,Double.pi/180*4, -Double.pi/180*4]
        anima.repeatCount = Float.infinity
        animView.layer.add(anima, forKey: "shake")
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        let anima = CAKeyframeAnimation(keyPath: "position")
        anima.path = UIBezierPath.init(ovalIn: CGRect(x: SCREEN_WIDTH/2 - 100, y: SCREEN_HEIGHT/2 - 100, width: 200, height: 200)).cgPath
        anima.duration = 2.0
        animView.layer.add(anima, forKey: "pathAnimation")

    }
    
    @IBAction func btn3(_ sender: UIButton) {
        let tempView = UIView(frame: CGRect(x: 50, y: 100, width: 250, height: 500))
        let bezierPath = UIBezierPath(ovalIn: tempView.frame)
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
    }
    

}
