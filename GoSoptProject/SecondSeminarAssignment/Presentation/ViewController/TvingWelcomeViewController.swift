//
//  TvingWelcomeViewController.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/09.
//

import UIKit

import SnapKit
import Then

final class TvingWelcomeViewController: BaseViewController {
    private let rootView = TvingWelcomeView()
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
    }
    
    private func target() {
        let loginViewController = TvingLoginViewController()
        
        rootView.mainButton.addTarget(self, action: #selector(mainButtonDidTap), for: .touchUpInside)
    }
    
    @objc func mainButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension TvingWelcomeViewController {
    func dataBind(id: String) {
        rootView.welcomeLabel.text = "\(id) 님 \n 반가워요!"
    }
}
