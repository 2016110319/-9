//
//  CircleView.swift
//  Gesture
//
//  Created by liyuting on 2018/12/5.
//  Copyright © 2018年 2016110319. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {
    
    @IBInspectable var color: UIColor?
    
    func setup() {
        
        self.layer.cornerRadius = 20
        //设置阴影
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowOpacity = 0.8
        //设置视图的内容模式为重绘
        self.contentMode = .redraw
        
        //pan移动
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        self.addGestureRecognizer(panRecognizer)
        
        //pinch缩放
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognizer:)))
        self.addGestureRecognizer(pinchRecognizer)
        
        //tap删除
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
        self.addGestureRecognizer(tapRecognizer)
        tapRecognizer.numberOfTapsRequired = 2
        
        //rotation旋转
        let rotationRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(rotation(recognizer:)))
        self.addGestureRecognizer(rotationRecognizer)
        
    }
    
    //pan移动
    @objc func pan(recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .changed  || recognizer.state == .ended {
            let translation = recognizer.translation(in: self)
            self.center.x += translation.x
            self.center.y += translation.y
            recognizer.setTranslation(.zero, in: self)
        }
    }
    
    //pinch缩放
    @objc func pinch(recognizer: UIPinchGestureRecognizer) {
        if recognizer.state == .changed  || recognizer.state == .ended {
            bounds = CGRect(x: 0, y: 0, width: bounds.width * recognizer.scale, height: bounds.height * recognizer.scale)
            recognizer.scale = 1
            
        }
    }
    //tap删除
    @objc func tap(recognizer: UITapGestureRecognizer) {
        if recognizer.state == .recognized {
            print("tap recognized")
            
        }
    }
    
    //rotation旋转
    @objc func rotation(recognizer: UIRotationGestureRecognizer) {
        let rotation = recognizer.rotation
        self.transform = self.transform.rotated(by: rotation)
        recognizer.rotation = 0
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        color?.setFill()
        path.fill()
    }
    
    
}
