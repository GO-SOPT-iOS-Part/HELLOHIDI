//
//  LoginView.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/09.
//

import UIKit

import SnapKit
import Then

final class TvingLoginView: UIView {
    
    private lazy var backButton = UIButton()
    private let titleLabel = UILabel()
    private lazy var idTextField = UITextField()
    private lazy var passwordTextField = UITextField()
    private lazy var loginButton = UIButton()
    private lazy var findIDButton = UIButton()
    private lazy var findPasswordButton = UIButton()
    private let describeSignUpLabel = UILabel()
    private lazy var signUpButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        target()
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func target() {}
    
    
    private func style() {
        backButton.do {
            $0.setImage(Image.back, for: .normal)
        }
        
        titleLabel.do {
            $0.text = "TVING ID 로그인"
            $0.textColor = .tvingGray2
            $0.font = .tvingTitle
        }
        
        idTextField.do {
            $0.placeholder = "아이디"
            $0.textColor = .tvingGray2
//            $0.font = .tvingDisplay1
            $0.addLeftPadding(inset: 22)
        }
        
        passwordTextField.do{
            $0.placeholder = "비밀번호"
            $0.textColor = .tvingGray2
//            $0.font = .tvingDisplay1
            $0.addLeftPadding(inset: 22)
        }
        
        loginButton.do {
            $0.setTitle("로그인하기", for: .normal)
            $0.setTitleColor(.tvingWhite, for: .normal)
//            $0.titleLabel?.font = .tvingDisplay2
            $0.backgroundColor = .tvingRed
        }
        
        findIDButton.do {
            $0.setTitle("아이디 찾기", for: .normal)
            $0.setTitleColor(.tvingGray2, for: .normal)
//            $0.titleLabel?.font = .tvingDisplay2
        }
        
        findPasswordButton.do {
            $0.setTitle("비밀번호 찾기", for: .normal)
            $0.setTitleColor(.tvingGray2, for: .normal)
        }
        
        describeSignUpLabel.do {
            $0.text = "아이디가 아직 없으신가요?"
        }
        
        signUpButton.do {
            $0.setTitle("아이디 만들러 가기", for: .normal)
            $0.setTitleColor(.tvingGray2, for: .normal)
        }
    }
    
    private func hierarchy() {
        self.addSubviews(
            backButton,
            titleLabel,
            idTextField,
            passwordTextField,
            loginButton,
            findIDButton,
            findPasswordButton,
            describeSignUpLabel,
            signUpButton
        )
    }
    
    private func layout() {
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(63)
            $0.leading.equalToSuperview().offset(19)
            $0.width.equalTo(8)
            $0.height.equalTo(15)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(90)
        }
        
        idTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(31)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.idTextField.snp.bottom).offset(7)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.passwordTextField.snp.bottom).offset(21)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        findIDButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(85)
            $0.top.equalTo(self.loginButton.snp.bottom).offset(31)
            $0.width.equalTo(62)
            $0.height.equalTo(22)
        }
        
        findPasswordButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(86)
            $0.top.equalTo(self.loginButton.snp.bottom).offset(31)
            $0.width.equalTo(73)
            $0.height.equalTo(22)
        }
        describeSignUpLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(51)
            $0.top.equalTo(self.findPasswordButton.snp.bottom).offset(28)
            $0.width.equalTo(129)
            $0.height.equalTo(22)
        }
        signUpButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(51)
            $0.top.equalTo(self.findPasswordButton.snp.bottom).offset(28)
            $0.width.equalTo(129)
            $0.height.equalTo(22)
        }
    }
}
    
