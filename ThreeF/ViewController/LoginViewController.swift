//
//  LoginViewController.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-08.
//

import UIKit

class LoginViewController: UIViewController {

    var emailLabel: UILabel = {
        let el = UILabel()
        
        
        return el
    }()
    
    var emailTextField: UITextField = {
        let etf = UITextField()
        
        return etf
    }()
    
    var passwordLabel: UILabel = {
       let pl = UILabel()
        
        return pl
    }()
    
    var passwordTextField: UITextField = {
       let ptf = UITextField()
        
        return ptf
    }()
    
    var forgotAccountButton: UIButton = {
       let fab = UIButton()
        
        return fab
    }()
    
    var loginButton: UIButton = {
       let lb = UIButton()
        
        return lb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(moveToMain(_:)), name: NSNotification.Name("moveToMain"), object: nil)

        setting()
    }
    
    private func setting() {
        
        let loginView = LoginView()
        self.view.addSubview(loginView)
        let alm = AutolayouutManager()
        alm.setAutolayoutFull(view: self.view, object: loginView, top: 100, bottom: 100, right: 0, left: 0)
    }

    @objc func moveToMain(_ notification: Notification) {
        let vc = JoinViewController()
        guard let nc = navigationController else {
            print("fail")
            return
        }

        nc.pushViewController(vc, animated: true)
    }

}
