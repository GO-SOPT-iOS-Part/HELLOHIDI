//
//  TvingNavigationView.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/24.
//

import UIKit

import SnapKit
import Then

final class TvingNavigationBar: UINavigationBar {
    
    //MARK: - UI Components
    
    public lazy var backButton = UIButton()
    public lazy var alarmButton = UIButton()
    public lazy var settingButton = UIButton()
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
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
    
    private func layout() {
        backButton.snp.makeConstraints {
            $0.width.equalTo(8)
            $0.height.equalTo(15)
        }
        
        alarmButton.snp.makeConstraints {
            $0.width.equalTo(30)
            $0.height.equalTo(42)
        }
        
        settingButton.snp.makeConstraints {
            $0.width.equalTo(33)
            $0.height.equalTo(31)
        }
    }
}
    

