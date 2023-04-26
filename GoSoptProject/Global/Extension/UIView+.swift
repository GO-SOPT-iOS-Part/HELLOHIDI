//
//  UIView+.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/09.
//

import UIKit

extension UIView{
    func addSubviews(_ views: UIView...){
        views.forEach { self.addSubview($0) }
    }
    
    func makeShadow(
        color: UIColor,
        offset : CGSize,
        radius : CGFloat,
        opacity : Float)
    {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
    
    func makeCornerRadius(ratio: CGFloat){
        layer.cornerRadius = ratio
        layer.masksToBounds = false
        clipsToBounds = true
    }
    
    func makeCornerBorder(borderWidth: CGFloat, borderColor: UIColor) {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
    
    func setGradient(color1:UIColor,color2:UIColor){
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [color1.cgColor,color2.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
}

