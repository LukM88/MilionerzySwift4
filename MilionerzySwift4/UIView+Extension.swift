//
//  UIView+Extension.swift
//  MilionerzySwift4
//
//  Created by LM88 on 28/05/2020.
//  Copyright © 2020 LM88. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func setGradient(colorOne: UIColor,colorTwo: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor,colorTwo.cgColor]
        gradientLayer.locations = [0,1]
        gradientLayer.startPoint = CGPoint(x: 0.0,y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0,y: 1.0)
        layer.insertSublayer(gradientLayer,at: 0)
    }
    func setGradient(colorOne: UIColor,colorTwo: UIColor,colorTree: UIColor,colorFour: UIColor,colorFive: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorFour.cgColor,colorTree.cgColor,colorFive.cgColor,colorTwo.cgColor,colorOne.cgColor]
        gradientLayer.locations = [0,0.3,0.5,0.7,1]
        gradientLayer.startPoint = CGPoint(x: 1.0,y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0,y: 0.0)
        layer.insertSublayer(gradientLayer,at: 0)
    }
    func setGradient(colorOne: UIColor,colorTwo: UIColor,colorTree: UIColor,colorFour: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor,colorTwo.cgColor,colorTree.cgColor,colorFour.cgColor]
        gradientLayer.locations = [0,0.45,0.65,1]
        gradientLayer.startPoint = CGPoint(x: 1.0,y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0,y: 0.0)
        layer.insertSublayer(gradientLayer,at: 0)
    }
}

