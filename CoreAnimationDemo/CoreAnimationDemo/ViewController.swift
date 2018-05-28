//
//  ViewController.swift
//  CoreAnimationDemo
//
//  Created by andyron<http://andyron.com> on 2018/5/28.
//  Copyright © 2018年 andyron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myConstraint: NSLayoutConstraint!
    
    var isSlideMenuHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myConstraint.constant = -140
        
       
    }

    @IBAction func organizeBtnPressed(_ sender: UIBarButtonItem) {
        if isSlideMenuHidden {
            myConstraint.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        } else {
            myConstraint.constant = -140
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        isSlideMenuHidden = !isSlideMenuHidden
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

