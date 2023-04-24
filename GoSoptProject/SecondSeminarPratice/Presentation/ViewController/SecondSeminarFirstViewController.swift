//
//  SecondSeminarFirstViewController.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/24.
//

import UIKit

import SnapKit
import Then

final class SecondSeminarFirstViewController: BaseViewController {
    
    //MARK: - Properties
    
    private let rootView = SecondSeminarFirstView()
    
    //MARK: - Life Cycles
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
    }
    
    //MARK: - Custom Method
    
    private func target() {
        rootView.loginButton.addTarget(self, action: #selector(pushToTvingWelcomeView), for: .touchUpInside)
    }
}

//MARK: - Extension

private extension SecondSeminarFirstViewController {
    
    @objc func pushToTvingWelcomeView() {
        let secondSeminarSecondViewController = SecondSeminarSecondViewController()
        secondSeminarSecondViewController.dataBind(id: rootView.idTextField.text)
        
        //delegate 패턴
        secondSeminarSecondViewController.delegate = self
        
        // closure
        secondSeminarSecondViewController.completionHandler = { [weak self] text in
            print(#function)
            guard let self else { return }
            self.rootView.idLabel.text = text
        }
        
        //NotificationCenter
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(dataReceived),
                                               name: NSNotification.Name("name"),
                                               object: nil)
        
        self.navigationController?.pushViewController(secondSeminarSecondViewController, animated: true)
    }
    
    @objc
    func dataReceived(notification: NSNotification) {
        guard let text = notification.object as? String else { return }
        rootView.idTextField.text = text
    }
}

extension SecondSeminarFirstViewController: LoginButtonTapped {
    func dataBindWithDelegatePattern(id: String) {
        print(#function)
        rootView.idLabel.text = "\(id)로 받아옴~"
    }
}


