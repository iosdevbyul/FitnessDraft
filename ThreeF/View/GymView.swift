//
//  GymView.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-10.
//

import UIKit

class GymView: UIView {

    let gymNameTextField: UITextField = {
        let gntf = UITextField()
        gntf.placeholder = "Do you go to your gym?"
        gntf.textAlignment = .center
        gntf.layer.cornerRadius = 10
        gntf.layer.borderWidth = 1
        return gntf
    }()
    let tableView: UITableView = {
        let tv = UITableView()
        
        return tv
    }()
    
    var confirmBtn: UIButton = {
        let cb = UIButton()
        cb.setTitle("Finish Survey", for: .normal)
        cb.layer.cornerRadius = 10
        cb.layer.borderWidth = 1
        return cb
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
        gymPage()
    }
    
    private func gymPage() {
        self.addSubview(gymNameTextField)
        self.addSubview(tableView)
        self.addSubview(confirmBtn)
        
        let alm = AutolayouutManager()
        alm.setAutolayoutWithHeight(view: self, object: gymNameTextField, height: 50, left: 10, right: 10, top: 20, hCenter: true)
        alm.setAutolayoutFull(view: self, object: tableView, top: 80, bottom: 210, right: 20, left: 20)
        alm.setAutolayoutWithBottom(view: self, object: confirmBtn, height: 50, left: 40, right: 40, bottom: 150, hCenter: true)
        
        confirmBtn.addTarget(self, action: #selector(gotoNext), for: .touchUpInside)
    }
    
    @objc func gotoNext() {
        NotificationCenter.default.post(name: NSNotification.Name("TestNotification"), object: nil, userInfo: nil)
    }

}


extension UITableView: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.detailTextLabel?.text = "Test"
        return cell
    }
    
    
}
