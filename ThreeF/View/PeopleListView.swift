//
//  SummaryView.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-19.
//

import UIKit

class PeopleListView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setting()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setting()
        
    }
    
    private func setting() {
        
        let lbl = UILabel()
        lbl.text = ""
        lbl.frame = CGRect(x: (self.frame.size.width / 2) - 50.0, y: 10, width: 100, height: 30)
        self.addSubview(lbl)
        
//        let moreButton = UIButton()
//        moreButton.setTitle("더보기", for: .normal)
//        moreButton.frame = CGRect(x: self.frame.size.width - 70, y: 10, width: 50, height: 30)
//        self.addSubview(moreButton)
//        moreButton.backgroundColor = .brown
        
        let sdv1 = SummaryDataView(frame: CGRect(x: 5, y: 50, width: self.frame.size.width/4 - 10.0, height: self.frame.size.height - 60.0))
        self.addSubview(sdv1)
        
        let sdv2  = SummaryDataView(frame: CGRect(x: self.frame.size.width/4 + 5, y: 50, width: self.frame.size.width/4 - 10.0, height: self.frame.size.height - 60.0))
        self.addSubview(sdv2)
        
        let sdv3  = SummaryDataView(frame: CGRect(x: self.frame.size.width/2 + 5, y: 50, width: self.frame.size.width/4 - 10.0, height: self.frame.size.height - 60.0))
        self.addSubview(sdv3)
        
        let sdv4  = SummaryDataView(frame: CGRect(x: self.frame.size.width/4*3 + 5, y: 50, width: self.frame.size.width/4 - 10.0, height: self.frame.size.height - 60.0))
        self.addSubview(sdv4)
        
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
    }
    

}
