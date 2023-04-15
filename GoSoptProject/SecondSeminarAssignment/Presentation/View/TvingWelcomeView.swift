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
    public let welcomeLabel = UILabel()
    public lazy var mainButton = UIButton()
    
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
        adImage.do{
            $0.image = Image.adImage
        }
        
        welcomeLabel.do {
            $0.textColor = .tvingGray1
            $0.textAlignment = .center
            $0.font = .tvingTitle
            $0.numberOfLines = 2
        }
        
        mainButton.do {
            $0.makeCornerRadius(ratio: 3)
            $0.backgroundColor = .tvingRed
            $0.setTitle("메인으로", for: .normal)
            $0.titleLabel?.textAlignment = .center
            $0.setTitleColor(.tvingWhite, for: .normal)
        }
    }
    
    private func hierarchy() {
        self.addSubviews(adImage, welcomeLabel, mainButton)
    }
    
    private func layout() {
        adImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(58)
            $0.width.equalToSuperview()
            $0.height.equalTo(210)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(self.adImage.snp.bottom).offset(67)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(74)
        }
        
        mainButton.snp.makeConstraints {
            $0.top.equalTo(self.welcomeLabel.snp.bottom).offset(284)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
    }
}

