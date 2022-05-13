//
//  BodyViewController.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-06.
//

import UIKit

class DataViewController: UIViewController {
    
    let boardBtn = UIButton()
    let chatBtn = UIButton()
    let functionBar = UIView()
    let boardTb = UITableView()
    let chatTb = UITableView()
    let alm = AutolayouutManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chat"
        self.view.backgroundColor = .white
        
        boardBtn.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        chatBtn.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        boardTb.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        chatTb.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        self.view.addSubview(boardBtn)
        self.view.addSubview(chatBtn)
        self.view.addSubview(boardTb)
        self.view.addSubview(chatTb)
        alm.setAutolayoutWithHeight(view: self.view, object: boardBtn, height: 100, left: 0, right: self.view.frame.size.width/2.0, top: 0, hCenter: false)
        alm.setAutolayoutWithHeight(view: self.view, object: chatBtn, height: 100, left: self.view.frame.size.width/2.0, right: 0, top: 0, hCenter: false)
        boardBtn.setTitle("Board", for: .normal)
        chatBtn.setTitle("Chat", for: .normal)
        
        functionBar.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: 50)
        self.view.addSubview(functionBar)
        alm.setAutolayoutWithHeight(view: self.view, object: functionBar, height: 50, left: 0, right: 0, top: 100, hCenter: true)
        
        alm.setAutolayoutWithBottom(view: self.view, object: boardTb, height: self.view.frame.size.height - 50.0 - 100.0 - 50.0, left: 0, right: 0, bottom: 50, hCenter: true)
        alm.setAutolayoutWithBottom(view: self.view, object: chatTb, height: self.view.frame.size.height - 50.0 - 100.0 - 50.0, left: 0, right: 0, bottom: 50, hCenter: true)
        chatTb.isHidden = true
        
        
        
        boardBtn.backgroundColor = .red
        chatBtn.backgroundColor = .green
        functionBar.backgroundColor = .lightGray
        boardTb.backgroundColor = .brown
        chatTb.backgroundColor = .blue

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension DataViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
