//
//  UIImageView+.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/09.


import UIKit
import Kingfisher

extension UIImageView{
    func kfSetImage(url : String?){
        
        guard let url = url else {
            print("🙏🙏🙏🙏에러🙏🙏🙏🙏")
            print(url)
            print("🙏🙏🙏🙏에러🙏🙏🙏🙏")
            return }
        
        if let url = URL(string: url) {
            kf.indicatorType = .activity
            kf.setImage(with: url,
                        placeholder: nil,
                        options: [.transition(.fade(1.0))], progressBlock: nil)
        }
    }
}
