//
//  UITextField.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/09.
//

import UIKit

extension UITextField {
    
    func addLeftPadding(inset: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: inset, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    func addRightPadding(inset: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: inset, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = ViewMode.always
    }
    
    func isEmpty() -> Bool {
        if let text = self.text, !text.isEmpty {
            return false
        } else {
            return true
        }
    }
}

