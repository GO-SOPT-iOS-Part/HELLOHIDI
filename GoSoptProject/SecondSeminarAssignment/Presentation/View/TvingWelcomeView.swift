//
//  TvingWelcomeView.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/09.
//

import UIKit

import SnapKit
import Then

final class TvingWelcomeView: UIView {
    
    private let adImage = UIImageView()
    private let welcomeLabel = UILabel()
    private lazy var goMainButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func style() {
//        adImage.do{}
        
        welcomeLabel.do {
            $0.textColor = .tvingGray1
            $0.textAlignment = .center
        }
    }
    
    private func hierarchy() {
        self.addSubviews(adImage, welcomeLabel, goMainButton)
    }
    
    private func layout() {
        
    }
    
    
}

