//
//  ViewController.swift
//  Gesture
//
//  Created by liyuting on 2018/12/5.
//  Copyright © 2018年 2016110319. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
   
    @IBAction func add(_ sender: Any) {
            
            let x = Int(arc4random()) % Int(self.view.bounds.width)
            let y = Int(arc4random()) % Int(self.view.bounds.height)
            
            let label = UILabel(frame: CGRect(x: x, y: y, width: 30, height: 30))
            label.text = "A"
            label.textColor = UIColor.white
            label.textAlignment = .center
            label.backgroundColor = UIColor.black
            
            label.layer.shadowColor = UIColor.gray.cgColor
            label.layer.shadowOffset = CGSize(width: 10, height: 10)
            label.layer.shadowOpacity = 1
            
            let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
            label.addGestureRecognizer(panRecognizer)
            label.isUserInteractionEnabled = true
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
            label.addGestureRecognizer(tapRecognizer)
            tapRecognizer.numberOfTapsRequired = 2
            
            self.view.addSubview(label)
    }
    //pan移动
    @objc func pan(recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .changed  || recognizer.state == .ended {
            let translation = recognizer.translation(in: self.view)
            recognizer.view?.center.x += translation.x
            recognizer.view?.center.y += translation.y
            recognizer.setTranslation(.zero, in: self.view)
        }
    }
    //tap删除
    @objc func tap(recognizer: UITapGestureRecognizer) {
        if recognizer.state == .recognized {
            recognizer.view?.removeFromSuperview()
            
        }
    }
    
    //movet移动
    @IBAction func move(_ sender: Any) {
    
            for label in self.view.subviews {
                if label is UILabel {
                    UIView.animate(withDuration: 1) {
                        let x = Int(arc4random()) % Int(self.view.bounds.width)
                        let y = Int(arc4random()) % Int(self.view.bounds.height)
                        label.center = CGPoint(x: x, y: y)
                    }
                }
            }
    }
    //delete删除

    @IBAction func deleteView(_ sender: Any) {
            
            for label in self.view.subviews {
                if label is UILabel {
                    label.removeFromSuperview()
                }
            }
        }
}



