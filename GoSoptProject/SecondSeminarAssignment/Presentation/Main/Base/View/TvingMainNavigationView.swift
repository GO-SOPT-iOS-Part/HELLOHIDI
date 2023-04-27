//
//  TvingNavigationView.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/27.
//

import UIKit

import SnapKit
import Then

final class TvingMainNavigationView: UIView {
    
    //MARK: - UI Components
    
    private let logoImageView = UIImageView()
    private lazy var mainPageButton = UIButton()
    
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
        self.backgroundColor = .clear
        
        logoImageView.do {
            $0.image = Image.logo
        }
        
        mainPageButton.do {
            $0.setImage(Image.profile, for: .normal)
        }
    }
    
    private func hierarchy() {
        self.addSubviews(logoImageView, mainPageButton)
    }
    
    private func layout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(11)
            $0.width.equalTo(99)
            $0.height.equalTo(25)
        }
        
        mainPageButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(3)
            $0.trailing.equalToSuperview().inset(9)
            $0.width.equalTo(33)
            $0.height.equalTo(31)
        }
    }
}

