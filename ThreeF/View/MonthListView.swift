//
//  MonthListView.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-05-06.
//

import UIKit



class MonthListView: UIView {
    
    let month = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    func loadView() {
        setting()
    }
    
    private func setting() {
        
        let gap = 10
        let btnWidth = (Int(self.frame.size.width) - (4 * gap)) / 3
        let btnHeight = (Int(self.frame.size.height) - ( 5 * gap)) / 4
        
        for index in 1...12 {
            let btn = UIButton()
            self.addSubview(btn)
            btn.setTitle(month[index-1], for: .normal)
            var xTimes = index%3
            if (xTimes%3 == 0) {
                xTimes = 3
            }
            let yTimesNum = Double(index) / 3
            if(yTimesNum <= 1) {
                btn.frame = CGRect(x: (gap * xTimes) + (btnWidth * (xTimes - 1)), y: gap, width: btnWidth, height: btnHeight)
            }else if(yTimesNum <= 2) {
                btn.frame = CGRect(x: (gap * xTimes) + (btnWidth * (xTimes - 1)), y: (gap * 2) + btnHeight, width: btnWidth, height: btnHeight)
            }else if(yTimesNum <= 3) {
                btn.frame = CGRect(x: (gap * xTimes) + (btnWidth * (xTimes - 1)), y: (gap * 3) + (2 * btnHeight), width: btnWidth, height: btnHeight)
            }else {
                btn.frame = CGRect(x: (gap * xTimes) + (btnWidth * (xTimes - 1)), y: (gap * 4) + (3 * btnHeight), width: btnWidth, height: btnHeight)
            }

            btn.tag = index
            btn.addTarget(self, action: #selector(selected(_:)), for: .touchUpInside)
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.black.cgColor
            btn.layer.cornerRadius = 15
            btn.setTitleColor(.black, for: .normal)
        }
    }
    
    @objc func selected(_ button: UIButton) {
        print(button.tag)
        let monthInfo = MonthInfo.shard
        monthInfo.month = button.tag
        
        NotificationCenter.default.post(name: NSNotification.Name("selectMonth"), object: nil)
        
    }

}
