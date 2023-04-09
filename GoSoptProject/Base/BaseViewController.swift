//
//  BaseViewController.swift
//  GoSoptProject
//
//  Created by 류희재 on 2023/04/09.
//

import UIKit

import SnapKit
import Then

class BaseViewController : UIViewController{
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        dismissKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //MARK: - Custom Method
    
    private func setUI(){
        view.backgroundColor = .tvingBlack
    }
    
    private func setLayout(){
        
    }
    
    //MARK: - Keyboard 관련 처리
   
    
    //MARK: - Action Method
    
}

