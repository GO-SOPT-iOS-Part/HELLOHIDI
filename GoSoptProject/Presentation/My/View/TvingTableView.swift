//
//  TvingSettingTableView.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/24.
//

import UIKit

import SnapKit
import Then

final class TvingTableView: UIView {
    
    //MARK: - UI Components
    
    public let tableView = UITableView()
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        register()
        
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func register() {
        tableView.register(
            TvingSettingTableViewCell.self,
            forCellReuseIdentifier: TvingSettingTableViewCell.cellIdentifier
        )
        
        tableView.register(
            TvingInfoTableViewCell.self,
            forCellReuseIdentifier: TvingInfoTableViewCell.cellIdentifier)
        
        tableView.register(
            TvingSettingTableFooterView.self,
            forHeaderFooterViewReuseIdentifier: TvingSettingTableFooterView.cellIdentifier)
        
        tableView.register(
            TvingInfoTableFooterView.self,
            forHeaderFooterViewReuseIdentifier: TvingInfoTableFooterView.cellIdentifier
        )
    }
    
    private func style() {
        tableView.do {
            $0.backgroundColor = .tvingBlack
            $0.isScrollEnabled = false
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    private func hierarchy() {
        self.addSubview(tableView)
    }
    
    private func layout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
    

