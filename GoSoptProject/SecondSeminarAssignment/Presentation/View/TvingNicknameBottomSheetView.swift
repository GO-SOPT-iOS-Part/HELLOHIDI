//
//  TvingNicknameBottomSheetView.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/21.
//

import UIKit

import SnapKit
import Then

final class TvingNicknameBottomSheetView: UIView {
    
    private let bottomSheetView = UIView()
    private let contentView = UIView()
    private let nickNameTitleLabel = UILabel()
    private let nickNameTextField = UITextField()
    private let nickNameButton = UIButton()
    
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
        
        contentView.do {
            $0.backgroundColor = .black
            $0.alpha = 0.45
        }
        
        bottomSheetView.do {
            $0.backgroundColor = .tvingWhite
        }
        
        nickNameTitleLabel.do {
            $0.text = "닉네임을 입력해주세요"
            $0.textColor = .tvingBlack
            $0.font = .tvingSubTitle
        }
        
        nickNameTextField.do {
            $0.backgroundColor = .tvingGray2
            $0.makeCornerRadius(ratio: 3)
            $0.addLeftPadding(inset: 25)
        }
        
        nickNameButton.do {
            $0.backgroundColor = .tvingRed
            $0.setTitle("저장하기", for: .normal)
            $0.setTitleColor(.tvingWhite, for: .normal)
            $0.titleLabel?.textAlignment = .center
            $0.titleLabel?.font = .tvingDisplay2
        }
    }
    
    private func hierarchy() {
        self.addSubviews(contentView, bottomSheetView)
        bottomSheetView.addSubviews(nickNameTitleLabel, nickNameTextField, nickNameButton)
    }
    
    private func layout() {
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        bottomSheetView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(384)
            $0.width.equalToSuperview()
            $0.height.equalTo(438)
        }
        
        nickNameTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(25)
        }
        
        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(self.nickNameTitleLabel.snp.bottom).offset(21)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        nickNameButton.snp.makeConstraints {
            $0.top.equalTo(self.nickNameTextField.snp.bottom).offset(214)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(332)
            $0.height.equalTo(52)
        }
    }
}


