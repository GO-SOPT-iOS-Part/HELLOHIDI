//
//  TvingSettingTableHeaderView.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/24.
//

import UIKit

import SnapKit
import Then

final class TvingSettingTableFooterView: UITableViewHeaderFooterView {
    
    //MARK: - UI Components
    
    private let separatorView = UIView()
    
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
        separatorView.do {
            $0.backgroundColor = .tvingGray4
        }
    }
    
    private func hierarchy() {
        self.addSubview(separatorView)
    }
    
    private func layout() {
        separatorView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(359)
            $0.height.equalTo(1)
        }
    }
}
