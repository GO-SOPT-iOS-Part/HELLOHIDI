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
    
    //MARK: - Properties
    
    private let rootView = TvingWelcomeView()
    
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
        rootView.mainButton.addTarget(self, action: #selector(mainButtonDidTap), for: .touchUpInside)
    }
    
    //MARK: - Action Method
    
    @objc func mainButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - TvingWelcomeViewController

extension TvingWelcomeViewController {
    func dataBind(id: String) {
        rootView.welcomeLabel.text = "\(id) 님 \n 반가워요!"
    }
}
