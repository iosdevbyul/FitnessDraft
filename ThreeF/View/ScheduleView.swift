//
//  SchedualView.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-19.
//

import UIKit

class ScheduleView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setting()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setting()
    }
    
    private func setting() {
        
        let dateLabel = UILabel()
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d일 EEEE"
        let nameOfMonth = dateFormatter.string(from: now)
        dateLabel.text = nameOfMonth
        dateLabel.textAlignment = .center
        
        self.addSubview(dateLabel)
        dateLabel.frame = CGRect(x: self.frame.width / 2 - 80, y: 10, width: 160, height: 30)
        
        let planLbl = UILabel()
        let trainerName = "Kim"
        let time = "12시 - 12시 50분"
        planLbl.frame = CGRect(x: 10, y: 50, width: self.frame.width - 20, height: 30)
        planLbl.text = "Trainer : "+trainerName+"  |  "+"Time : "+time
        planLbl.textAlignment = .center
        self.addSubview(planLbl)
        planLbl.layer.borderWidth = 1
        planLbl.layer.borderColor = UIColor.black.cgColor


        
    }

}
