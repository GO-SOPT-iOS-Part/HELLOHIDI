//
//  SecondSeminarFirstView.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/24.
//

import UIKit

import SnapKit
import Then

final class SecondSeminarFirstView: UIView {
    
    //MARK: - UI Components
    
    public lazy var idTextField = BaseAuthTextField.init(viewType: .id)
    public lazy var idLabel = UILabel()
    public lazy var loginButton = UIButton()
    
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
        idTextField.do {
            $0.attributedPlaceholder = NSAttributedString(string: "아이디", attributes: [NSAttributedString.Key.foregroundColor : UIColor.tvingGray2])
            $0.textColor = .tvingGray2
            $0.font = .tvingDisplay1
            $0.backgroundColor = .tvingGray4
            $0.makeCornerRadius(ratio: 3)
            $0.makeCornerBorder(borderWidth: 1, borderColor: .tvingGray4)
            $0.addLeftPadding(inset: 22)
        }
        
        loginButton.do {
            $0.setTitle("로그인하기", for: .normal)
            $0.setTitleColor(.tvingWhite, for: .normal)
            $0.titleLabel?.font = .tvingDisplay2
            $0.titleLabel?.textAlignment = .center
            $0.backgroundColor = .tvingBlack
            $0.layer.borderColor = UIColor.tvingGray4.cgColor
            $0.layer.borderWidth = 1
        }
        
        idLabel.do {
            $0.textColor = .white
            $0.textAlignment = .center
            $0.numberOfLines = 2
        }
    }
    
    private func hierarchy() {
        self.addSubviews(idTextField, loginButton, idLabel)
    }
    
    private func layout() {
        idTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.idTextField.snp.bottom).offset(21)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        idLabel.snp.makeConstraints {
            $0.top.equalTo(self.loginButton.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(100)
        }
    }
}
    


