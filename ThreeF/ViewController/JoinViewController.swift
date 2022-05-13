//
//  JoinViewController.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-08.
//

import UIKit

class JoinViewController: UIViewController {
    var welcomeImage: UIImageView = UIImageView()
    let emailTextField: UITextField = {
        let etf = UITextField()
        etf.placeholder = "Email Address"
        etf.textAlignment = .center
        etf.layer.borderWidth = 1
        return etf
    }()
    let passwordTextField: UITextField = {
        let pwtf = UITextField()
        pwtf.placeholder = "Password"
        pwtf.textAlignment = .center
        pwtf.layer.borderWidth = 1
        return pwtf
    }()
    let confirmPasswordrTextField: UITextField = {
        let cpwtf = UITextField()
        cpwtf.placeholder = "Password"
        cpwtf.textAlignment = .center
        cpwtf.layer.borderWidth = 1
        return cpwtf
    }()
    var nextBtn: UIButton = {
       let nb = UIButton()
        nb.setTitle("JOIN", for: .normal)
        nb.layer.cornerRadius = 10
        nb.layer.borderWidth = 1

        return nb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setting()
    }
    
    private func setting() {
        //need to study Regulat Expression
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(confirmPasswordrTextField)
        self.view.addSubview(nextBtn)
        nextBtn.addTarget(self, action: #selector(confirmInfo), for: .touchUpInside)

        let alm = AutolayouutManager()
        alm.setAutolayoutWithHeight(view: self.view, object: emailTextField, height: 50, left: 30, right: 30, top: 100, hCenter: true)
        alm.setAutolayoutWithHeight(view: self.view, object: passwordTextField, height: 50, left: 30, right: 30, top: 180, hCenter: true)
        alm.setAutolayoutWithHeight(view: self.view, object: confirmPasswordrTextField, height: 50, left: 30, right: 30, top: 260, hCenter: true)
        alm.setAutolayoutWithBottom(view: self.view, object: nextBtn, height: 50, left: 30, right: 30, bottom: 80, hCenter: true)

    }
    

    @objc func confirmInfo() {
        gotoMain()
    }
    
    private func gotoMain() {
        let vc = MainTabBarViewController()
        guard let nc = navigationController else {
            print("fail")
            return
        }

        nc.pushViewController(vc, animated: true)
    }
    

}
