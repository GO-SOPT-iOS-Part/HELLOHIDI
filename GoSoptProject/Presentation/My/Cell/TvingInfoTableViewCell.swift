//
//  TvingInfoTableViewCell.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/24.
//

import UIKit

import SnapKit
import Then

final class TvingInfoTableViewCell: UITableViewCell {
    
    //MARK: - UI Components
    
    private let infoTitle = UILabel()
    private lazy var infoButton = UIButton()
    
    //MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellStyle()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    func cellStyle() {
        contentView.do {
            $0.backgroundColor = .tvingBlack
        }
        infoTitle.do {
            $0.textColor = .tvingGray2
            $0.font = .tvingDisplay1
        }
        
        infoButton.do {
            $0.setBackgroundImage(Image.next, for: .normal)
        }
    }
    
    func hierarchy() {
        contentView.addSubviews(infoTitle, infoButton)
    }
    
    func layout() {
        infoTitle.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(100)
            $0.height.equalTo(21)
        }
        
        infoButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
            $0.width.equalTo(18)
            $0.height.equalTo(16.5)
        }
    }
    
    func configureCell(_ info: Info) {
        print(#function)
        infoTitle.text = info.title
    }
}

