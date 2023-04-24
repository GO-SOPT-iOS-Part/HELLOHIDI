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
    
    //MARK: - UI Components
    
    private lazy var backButton = UIButton()
    private let titleLabel = UILabel()
    public lazy var idTextField = BaseAuthTextField.init(viewType: .id)
    public lazy var passwordTextField = BaseAuthTextField.init(viewType: .password)
    public lazy var clearButton = UIButton()
    public lazy var securityButton = UIButton()
    public lazy var loginButton = UIButton()
    public lazy var findIDButton = UIButton()
    public lazy var findPasswordButton = UIButton()
    private var separatorBar = UIView()
    private let describeSignUpLabel = UILabel()
    public lazy var signUpButton = UIButton()
    
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
        
        titleLabel.do {
            $0.text = "TVING ID 로그인"
            $0.textColor = .tvingGray1
            $0.font = .tvingSubTitle
            $0.textAlignment = .center
        }
        
        idTextField.do {
            $0.attributedPlaceholder = NSAttributedString(string: "아이디", attributes: [NSAttributedString.Key.foregroundColor : UIColor.tvingGray2])
            $0.textColor = .tvingGray2
            $0.font = .tvingDisplay1
            $0.backgroundColor = .tvingGray4
            $0.makeCornerRadius(ratio: 3)
            $0.makeCornerBorder(borderWidth: 1, borderColor: .tvingGray4)
            $0.addLeftPadding(inset: 22)
        }
        
        passwordTextField.do{
            $0.isSecureTextEntry = true
            $0.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [NSAttributedString.Key.foregroundColor : UIColor.tvingGray2])
            $0.textColor = .tvingGray2
            $0.font = .tvingDisplay1
            $0.backgroundColor = .tvingGray4
            $0.makeCornerRadius(ratio: 3)
            $0.makeCornerBorder(borderWidth: 1, borderColor: .tvingGray4)
            $0.addLeftPadding(inset: 22)
        }
        
        clearButton.do {
            $0.setImage(Image.close, for: .normal)
            $0.isHidden = true
        }
        
        securityButton.do {
            $0.setImage(Image.eye, for: .normal)
            $0.isHidden = true
        }
        
        loginButton.do {
            $0.setTitle("로그인하기", for: .normal)
            $0.setTitleColor(.tvingWhite, for: .normal)
            $0.titleLabel?.font = .tvingDisplay2
            $0.titleLabel?.textAlignment = .center
            $0.backgroundColor = .tvingBlack
            $0.layer.borderColor = UIColor.tvingGray4.cgColor
            $0.layer.borderWidth = 1
            $0.isEnabled = false
        }
        
        findIDButton.do {
            $0.setTitle("아이디 찾기", for: .normal)
            $0.setTitleColor(.tvingGray2, for: .normal)
            $0.titleLabel?.font = .tvingDisplay2
            $0.titleLabel?.textAlignment = .center
        }
        
        separatorBar.do {
            $0.backgroundColor = .tvingGray4
        }
        
        findPasswordButton.do {
            $0.setTitle("비밀번호 찾기", for: .normal)
            $0.setTitleColor(.tvingGray2, for: .normal)
            $0.titleLabel?.font = .tvingDisplay2
            $0.titleLabel?.textAlignment = .center
        }
        
        describeSignUpLabel.do {
            $0.text = "아직 계정이 없으신가요?"
            $0.font = .tvingDisplay2
            $0.textColor = .tvingGray3
            $0.textAlignment = .center
        }
        
        signUpButton.do {
            $0.setTitle("닉네임 만들러 가기", for: .normal)
            $0.setTitleColor(.tvingGray2, for: .normal)
            $0.titleLabel?.font = .tvingDisplay2
            $0.titleLabel?.textAlignment = .center
            $0.setUnderline()
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
            separatorBar,
            findPasswordButton,
            describeSignUpLabel,
            signUpButton
        )
        
        passwordTextField.addSubviews(
            clearButton,
            securityButton
        )
    }
    
    private func layout() {
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(65)
            $0.leading.equalToSuperview().offset(24)
            $0.width.equalTo(8)
            $0.height.equalTo(15)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(94)
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
            $0.width.equalTo(75)
            $0.height.equalTo(22)
        }
        
        separatorBar.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.loginButton.snp.bottom).offset(36)
            $0.width.equalTo(1)
            $0.height.equalTo(12)
        }
        
        findPasswordButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(86)
            $0.top.equalTo(self.loginButton.snp.bottom).offset(31)
            $0.width.equalTo(90)
            $0.height.equalTo(22)
        }
        
        describeSignUpLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(51)
            $0.top.equalTo(self.findPasswordButton.snp.bottom).offset(28)
            $0.width.equalTo(140)
            $0.height.equalTo(22)
        }
        
        signUpButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(51)
            $0.top.equalTo(self.findPasswordButton.snp.bottom).offset(28)
            $0.width.equalTo(129)
            $0.height.equalTo(22)
        }
        
        clearButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(56)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(20)
        }
        
        securityButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(20)
        }
    }
}
    
