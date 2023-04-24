//
//  TvingProfileView.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/24.
//

import UIKit

import SnapKit
import Then

final class TvingProfileView: UIView {
    
    //MARK: - UI Components
    
    private let profileImage = UIImageView()
    private let profileNameLabel = UILabel()
    private lazy var profileChangeButton = UIButton()
    
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
        profileImage.do {
            $0.image = Image.setting
            $0.makeCornerRadius(ratio: 15)
            $0.clipsToBounds = true
        }
        
        profileNameLabel.do {
            $0.text = "안뇽희디"
            $0.textColor = .tvingWhite
            $0.textAlignment = .center
            $0.font = .tvingProfileDisplay1
        }
        
        profileChangeButton.do {
            $0.setTitle("프로필 전환", for: .normal)
            $0.setTitleColor(.tvingGray1, for: .normal)
            $0.titleLabel?.font = .tvingToastMessage
            $0.makeCornerRadius(ratio: 2)
            $0.makeCornerBorder(borderWidth: 2, borderColor: .tvingGray4)
        }
    }
    
    private func hierarchy() {
        self.addSubviews(profileImage, profileNameLabel, profileChangeButton)
    }
    
    private func layout() {
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(24)
            $0.width.equalTo(72)
            $0.height.equalTo(74)
        }
        
        profileNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.leading.equalTo(self.profileImage.snp.trailing).offset(22)
            $0.width.equalTo(70)
            $0.height.equalTo(25)
        }
        
        profileChangeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().inset(23)
            $0.width.equalTo(70)
            $0.height.equalTo(25)
        }
    }
}
