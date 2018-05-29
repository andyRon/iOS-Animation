//
//  CATransitionVC.swift
//  CoreAnimationDemo
//
//  Created by andyron<http://andyron.com> on 2018/5/28.
//  Copyright © 2018年 andyron. All rights reserved.
//

import UIKit

class CATransitionVC: UIViewController {

    var showView: UIView?
    var showLabel: UILabel?
    
    var index:NSInteger = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showView = UIView(frame: CGRect(x: SCREEN_WIDTH/2 - 90, y: SCREEN_HEIGHT/2 - 200, width: 180, height: 260))
        self.view.addSubview(showView!)

        showLabel = UILabel(frame: CGRect(x: (showView?.frame.width)!/2 - 10, y: (showView?.frame.width)!/2 - 20, width: 20, height: 40))
        showLabel?.textAlignment = .center
        showLabel?.font = UIFont.init(name: "", size: 40)
        showView?.addSubview(showLabel!)

        self.changeView(isUp: true)
        
        

    }

    @IBAction func clickBtn(_ sender: UIButton) {
        
        switch sender.titleLabel?.text! {
        case "fade":
            self.fade()
        case "moveIn":
            self.moveIn()
        case "push":
            self.push()
        case "reveal":
            self.reveal()
        case "cube":
            self.cube()
        case "suck":
            self.suck()
        case "oglFlip":
            self.oglFlip()
        case "ripple":
            self.ripple()
        case "curl":
            self.curl()
        case "UnCurl":
            self.unCurl()
        default:
            return
        }
    }
    
    func fade() {
        self.changeView(isUp: true)
        let anima = CATransition()
        anima.type = kCATransitionFade
        anima.subtype = kCATransitionFromRight
        anima.duration = 1.0
        showView?.layer.add(anima, forKey: "fade")
        
    }
    func moveIn() {
        self.changeView(isUp: true)
        let anima = CATransition()
        anima.type = kCATransitionMoveIn
        anima.subtype = kCATransitionFromRight
        anima.duration = 1.0
        showView?.layer.add(anima, forKey: "moveIn")
    }
    func push() {
        self.changeView(isUp: true)
        let anima = CATransition()
        anima.type = kCATransitionPush
        anima.subtype = kCATransitionFromRight
        anima.duration = 1.0
        showView?.layer.add(anima, forKey: "push")
        
    }
    func reveal() {
        self.changeView(isUp: true)
        let anima = CATransition()
        anima.type = kCATransitionReveal
        anima.subtype = kCATransitionFromRight
        anima.duration = 1.0
        showView?.layer.add(anima, forKey: "reveal")
    }
    func cube() {
        self.changeView(isUp: true)
        let anima = CATransition()
        anima.type = "cube"
        anima.subtype = kCATransitionFromRight
        anima.duration = 1.0
        showView?.layer.add(anima, forKey: "cube")
        
    }
    func suck() {
        self.changeView(isUp: true)
        let anima = CATransition()
        anima.type = "suckEffect"
        anima.subtype = kCATransitionFromRight
        anima.duration = 1.0
        showView?.layer.add(anima, forKey: "suckEffect")
    }
    func oglFlip() {
        self.changeView(isUp: true)
        let anima = CATransition()
        anima.type = "oglFlip"
        anima.subtype = kCATransitionFromRight
        anima.duration = 1.0
        showView?.layer.add(anima, forKey: "oglFlip")
    }
    func ripple() {
        self.changeView(isUp: true)
        let anima = CATransition()
        anima.type = "rippleEffect"
        anima.subtype = kCATransitionFromRight
        anima.duration = 1.0
        showView?.layer.add(anima, forKey: "rippleEffect")
    }
    func curl() {
        self.changeView(isUp: true)
        let anima = CATransition()
        anima.type = "pageCurl"
        anima.subtype = kCATransitionFromRight
        anima.duration = 1.0
        showView?.layer.add(anima, forKey: "pageCurl")
    }
    func unCurl() {
        self.changeView(isUp: true)
        let anima = CATransition()
        anima.type = "pageUnCurl"
        anima.subtype = kCATransitionFromRight
        anima.duration = 1.0
        showView?.layer.add(anima, forKey: "pageUnCurl")
    }

    
    func changeView(isUp: Bool) {
        if index>3 {
            index = 0
        }
        if index<0 {
            index=3
        }
        let colors = [UIColor.cyan, UIColor.magenta, UIColor.orange, UIColor.purple]
        let titles = ["1", "2", "3", "4"]
        showView?.backgroundColor = colors[index]
        showLabel?.text = titles[index]
        if isUp {
            index = index + 1
        } else {
            index = index - 1
        }
        
        
    }

}
