//
//  Tving.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/27.
//

import UIKit

import SnapKit
import Then

final class TvingPopularChannelViewCell: UICollectionViewCell {

    //MARK: - Properties

    //MARK: - UI Components

    private let channelImageView = UIImageView()
    private let rankLabel = UILabel()
    private let channelTitleLabel = UILabel()
    private let contentTitleLabel = UILabel()
    private let ratingLabel = UILabel()

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
        channelImageView.do {
            $0.clipsToBounds = true
        }
        channelTitleLabel.do {
            $0.font = .tvingTopBarDisplay2
            $0.textColor = .tvingWhite
        }
        rankLabel.do {
            $0.font = .tvingTitle2
            $0.textColor = .tvingWhite
            $0.textAlignment = .center
        }
        contentTitleLabel.do {
            $0.font = .tvingTopBarDisplay2
            $0.textColor = .tvingGray2
            $0.textAlignment = .center
        }
        ratingLabel.do {
            $0.font = .tvingTopBarDisplay2
            $0.textColor = .tvingGray2
            $0.textAlignment = .center
        }
    }

    private func hierarchy() {
        contentView.addSubviews(
            channelImageView,
            channelTitleLabel,
            contentTitleLabel,
            ratingLabel
        )
    }

    private func layout() {
        channelImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(160)
            $0.height.equalTo(80)
        }

        channelTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.channelImageView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(24)
            $0.width.equalTo(24)
            $0.height.equalTo(16)
        }
        
        contentTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.channelTitleLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(24)
            $0.width.equalTo(77)
            $0.height.equalTo(16)
        }
        
        ratingLabel.snp.makeConstraints {
            $0.top.equalTo(self.contentTitleLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(24)
            $0.width.equalTo(29)
            $0.height.equalTo(16)
        }
    }

    func dataBind(_ channel: Channel) {
        channelImageView.image = channel.image
        rankLabel.text = channel.rank
        channelTitleLabel.text = channel.title
        contentTitleLabel.text = channel.subTitle
        ratingLabel.text = channel.rating
    }
    //MARK: - Action Method

}

