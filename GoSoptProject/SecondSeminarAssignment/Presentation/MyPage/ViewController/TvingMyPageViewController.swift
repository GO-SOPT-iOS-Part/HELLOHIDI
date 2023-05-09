//
//  TvingMyPageViewController.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/24.
//

import UIKit

import SnapKit
import Then

final class TvingMyPageViewController: BaseViewController {
    
    //MARK: - Properties
    
    private let settingDummy = Setting.dummy()
    private let infoDummy = Info.dummy()
    
    private lazy var rootView = TvingMyPageView()
    private let tvingNavigationBar = TvingNavigationBar()
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.isNavigationBarHidden.toggle()
    }
    
    //MARK: - Custom Method
    
    private func target() {
        rootView.tvingTableView.tableView.delegate = self
        rootView.tvingTableView.tableView.dataSource = self
        
        tvingNavigationBar.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        
    }
    
    //MARK: - Action Method
    
    @objc func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension TvingMyPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 54
        case 1:
            return 54
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 32
        case 1:
            return 205
        default:
            return 0
        }
    }
}
extension TvingMyPageViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return settingDummy.count
        case 1:
            return infoDummy.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TvingSettingTableViewCell.cellIdentifier, for: indexPath) as? TvingSettingTableViewCell else { return UITableViewCell()}
            cell.configureCell(settingDummy[indexPath.row])
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TvingInfoTableViewCell.cellIdentifier, for: indexPath) as? TvingInfoTableViewCell else { return UITableViewCell()}
            cell.configureCell(infoDummy[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch section {
        case 0:
            guard let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: TvingSettingTableFooterView.cellIdentifier) as? TvingSettingTableFooterView else { return UIView()}
            return footer
        case 1:
            guard let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: TvingInfoTableFooterView.cellIdentifier) as? TvingInfoTableFooterView else { return UIView()}
            return footer
        default:
            return UIView()
        }
    }
}

extension TvingMyPageViewController {
    private func setNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.isTranslucent = false
        
        
        let rightButtonStackView = UIStackView.init(arrangedSubviews: [tvingNavigationBar.alarmButton, tvingNavigationBar.settingButton])
        rightButtonStackView.do {
            $0.distribution = .equalSpacing
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 17
        }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: tvingNavigationBar.backButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButtonStackView)
    }
}
