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
    private let rootView = TvingMyPageView()
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
    }
    
    //MARK: - Custom Method
    
    private func target() {
        rootView.tvingSettingTableView.tableView.delegate = self
        rootView.tvingSettingTableView.tableView.dataSource = self
    }
    
    //MARK: - Action Method
    
}

extension TvingMyPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 54
        case 1:
            return 0
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
            return 0
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
            return UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
}

