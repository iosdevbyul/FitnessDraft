//
//  LoginView.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-08.
//

import UIKit

class LoginView: UIView {
    var loginBtn1: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Apple ID", for: .normal)
        return btn
    }()
    var loginBtn2: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Facebook ID", for: .normal)
//        btn.addTarget(self, action: #selector(loginBtnAction), for: .touchUpInside)
        return btn
    }()
    var loginBtn3: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Email", for: .normal)
//        btn.addTarget(self, action: #selector(loginBtnAction), for: .touchUpInside)
        return btn
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    private func loadView() {
        
        
        addSubview(loginBtn1)
        addSubview(loginBtn2)
        addSubview(loginBtn3)
        let alm = AutolayouutManager()
        alm.setAutolayoutWithHeight(view: self, object: loginBtn1, height: 50, left: 30, right: 30, top: 30, hCenter: true)
        alm.setAutolayoutWithHeight(view: self, object: loginBtn2, height: 50, left: 30, right: 30, top: 110, hCenter: true)
        alm.setAutolayoutWithHeight(view: self, object: loginBtn3, height: 50, left: 30, right: 30, top: 190, hCenter: true)

        loginBtn1.layer.borderWidth = 1
        loginBtn2.layer.borderWidth = 1
        loginBtn3.layer.borderWidth = 1
        loginBtn1.layer.cornerRadius = 10
        loginBtn2.layer.cornerRadius = 10
        loginBtn3.layer.cornerRadius = 10
        loginBtn3.addTarget(self, action: #selector(clickLoginBtn), for: .touchUpInside)


    }
    
    private func createBtn() {
        
    }
    
    @objc func clickLoginBtn() {
        NotificationCenter.default.post(name: NSNotification.Name("moveToMain"), object: nil, userInfo: nil)
    }

}
