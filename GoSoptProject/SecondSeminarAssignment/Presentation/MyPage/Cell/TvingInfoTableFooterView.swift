//
//  TvingInfoTableHeaderView.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/24.
//

import UIKit

import SnapKit
import Then

final class TvingInfoTableFooterView: UITableViewHeaderFooterView {
    
    //MARK: - UI Components
    
    private let tvingLogoutButton = UIButton()
    
    //MARK: - Life Cycle
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func style() {
        tvingLogoutButton.do {
            $0.backgroundColor = . tvingBlack
            $0.setTitle("로그아웃", for: .normal)
            $0.setTitleColor(.tvingGray2, for: .normal)
            $0.titleLabel?.font = .tvingDisplay2
            $0.makeCornerRadius(ratio: 2)
            $0.makeCornerBorder(borderWidth: 1, borderColor: .tvingGray4)
        }
    }
    
    private func hierarchy() {
        self.addSubview(tvingLogoutButton)
    }
    
    private func layout() {
        tvingLogoutButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(23)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(359)
            $0.height.equalTo(55)
        }
    }
}
    




