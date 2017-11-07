
//  Created by 藤田麻里 on 2017/10/31.
//  Copyright © 2017年 鯖. All rights reserved.
//

import UIKit

class CoachMarkView: UIView {
    
    open var coachMarkRadius = 60.0 as CGFloat
    open lazy var x : CGFloat = self.bounds.width / 2.0
    open lazy var y : CGFloat = self.bounds.height / 2.0
    
    lazy var coachMarkPoint: CGPoint = {
        return CGPoint(
            x: self.x,
            y: self.y
        )
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let rect = CGRect(
            x: self.coachMarkPoint.x - self.coachMarkRadius,
            y: self.coachMarkPoint.y - self.coachMarkRadius,
            width: self.coachMarkRadius * 2.0,
            height: self.coachMarkRadius * 2.0
        )
        let coachMarkPath = UIBezierPath(roundedRect: rect, cornerRadius: self.coachMarkRadius)
        if !self.bounds.contains(point) || coachMarkPath.contains(point) {
            return nil
        }
        return self
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let coachMarkTargetLayer = CALayer()
        coachMarkTargetLayer.bounds = self.bounds
        coachMarkTargetLayer.position = CGPoint(
            x: self.bounds.width / 2.0,
            y: self.bounds.height / 2.0
        )
        coachMarkTargetLayer.backgroundColor = UIColor.black.cgColor
        coachMarkTargetLayer.opacity = 0.5
        
        let maskLayer = CAShapeLayer()
        maskLayer.bounds = coachMarkTargetLayer.bounds
        
        let ovalRect =  CGRect(
            x: self.coachMarkPoint.x - self.coachMarkRadius,
            y: self.coachMarkPoint.y - self.coachMarkRadius,
            width: self.coachMarkRadius * 2.0,
            height: self.coachMarkRadius * 2.0
        )
        let path =  UIBezierPath(ovalIn: ovalRect)
        path.append(UIBezierPath(rect: maskLayer.bounds))
        
        maskLayer.fillColor = UIColor.black.cgColor
        maskLayer.path = path.cgPath
        maskLayer.position = CGPoint(
        x: coachMarkTargetLayer.bounds.width / 2.0,
        y: coachMarkTargetLayer.bounds.height / 2.0
        )
        
        maskLayer.fillRule = kCAFillRuleEvenOdd
        coachMarkTargetLayer.mask = maskLayer
        
        // サブレイヤー
        self.layer.addSublayer(coachMarkTargetLayer)
    }
        
        
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
