//
//  InfoViewController.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-06.
//

import UIKit

class InfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let infoTableView: UITableView = {
        let it = UITableView()
        
        return it
    }();

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "INFO"
        self.view.backgroundColor = .white
        setTableView()
    }
    
    // MARK: - TableView
    func setTableView() {
        self.view.addSubview(infoTableView)
        guard let tb = tabBarController else {
            return
        }
        let height = tb.tabBar.frame.size.height;
        let alm = AutolayouutManager()
        alm.setAutolayoutFull(view: self.view, object: infoTableView, top: 50, bottom:  height, right: 0, left: 0)
        infoTableView.backgroundColor = .brown
        
        infoTableView.delegate = self
        infoTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 1
        } else if (section == 1) {
            return 1
        } else if (section == 2) {
            return 100
        } else if (section == 3) {
            return 200
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            let gap = 10.0
            let itemWidth = (Double(self.view.frame.size.width) - (4 * gap)) / 3
            let itemHeight = (itemWidth / 3) * 2
            return (gap * 2) + 100 + itemHeight
        } else if (indexPath.section == 1) {
            return 110
        } else if (indexPath.section == 2) {
            return 100
        } else if (indexPath.section == 3) {
            return 100
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let cell = ProfileTableViewCell()
            return cell
        } else if (indexPath.section == 1) {
            let cell = GymTableViewCell()
            return cell
        } else {
            let cell = UITableViewCell()
            return cell
        }
        
    }

}
