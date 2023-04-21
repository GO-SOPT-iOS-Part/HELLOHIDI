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
    
    public let bottomSheetView = UIView()
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
        
        bottomSheetView.do {
            $0.backgroundColor = .tvingWhite
            $0.makeCornerRadius(ratio: 20)
        }
        
        nickNameTitleLabel.do {
            $0.text = "닉네임을 입력해주세요"
            $0.textColor = .tvingBlack
            $0.font = .tvingSubTitle
        }
        
        nickNameTextField.do {
            $0.placeholder = "아요짱!"
            $0.attributedPlaceholder = NSAttributedString(string:  "아요짱!", attributes: [NSAttributedString.Key.foregroundColor : UIColor.tvingGray4])
            $0.textColor = .tvingBlack
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
            $0.makeCornerRadius(ratio: 12)
        }
    }
    
    private func hierarchy() {
        self.addSubview(bottomSheetView)
        bottomSheetView.addSubviews(nickNameTitleLabel, nickNameTextField, nickNameButton)
    }
    
    private func layout() {
        
        bottomSheetView.snp.makeConstraints {
            $0.height.equalTo(0)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaInsets)
        }
        
        nickNameTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(30)
        }
        
        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(self.nickNameTitleLabel.snp.bottom).offset(21)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        nickNameButton.snp.makeConstraints {
            $0.bottom.equalTo(self.nickNameTextField.snp.bottom).offset(214)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(332)
            $0.height.equalTo(52)
        }
    }
}


