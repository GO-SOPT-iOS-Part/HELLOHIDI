//
//  SecondSeminarSecondViewController.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/24.
//

import UIKit

import SnapKit
import Then

protocol LoginButtonTapped: AnyObject {
    func dataBindWithDelegatePattern(id: String)
}

final class SecondSeminarSecondViewController: BaseViewController {
    
    //MARK: - Properties
    
    private let rootView = SecondSeminarSecondView()
    
    
    weak var delegate: LoginButtonTapped?
    typealias handler = ((String) -> (Void))
    
    var completionHandler: handler?
    
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
        guard let id = rootView.welcomeLabel.text else { return }
        
        //delegate
        delegate?.dataBindWithDelegatePattern(id: id)
        
        // closure
        completionHandler?(id)
        
        //NotificationCenter
        guard let text = rootView.welcomeLabel.text else { return }
        
        NotificationCenter.default.post(name: NSNotification.Name("name"),
                                        object: text)
        
        
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - TvingWelcomeViewController

extension SecondSeminarSecondViewController {
    func dataBind(id: String?) {
        guard let id else { return }
        rootView.welcomeLabel.text = "\(id) 님 \n 반가워요!"
    }
}

