//
//  TvingNavigationView.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/24.
//

import UIKit

import SnapKit
import Then

final class TvingNavigationView: UIView {
    
    //MARK: - UI Components
    
    private lazy var backButton = UIButton()
    private lazy var alarmButton = UIButton()
    private lazy var settingButton = UIButton()
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func style() {
        backButton.do {
            $0.setImage(Image.back, for: .normal)
        }
        
        alarmButton.do {
            $0.setImage(Image.alarm, for: .normal)
        }
        
        settingButton.do {
            $0.setImage(Image.setting, for: .normal)
        }
    }
    
    private func hierarchy() {
        self.addSubviews(backButton,alarmButton,settingButton)
    }
    
    private func layout() {
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().offset(24)
            $0.width.equalTo(8)
            $0.height.equalTo(15)
        }
        
        alarmButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(67)
            $0.width.equalTo(30)
            $0.height.equalTo(42)
        }
        
        settingButton.snp.makeConstraints {
            $0.top.equalTo(self.alarmButton).offset(7)
            $0.trailing.equalToSuperview().inset(25)
            $0.width.equalTo(33)
            $0.height.equalTo(31)
        }
    }
}
    

