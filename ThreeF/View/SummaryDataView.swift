//
//  SummaryDataView.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-19.
//

import UIKit

class SummaryDataView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setting()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setting()
        
    }
    
    private func setting() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        
        let circle = UIImageView()
        circle.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.width)
        circle.image = UIImage(named: "Main.png")
        
        circle.layer.cornerRadius = circle.frame.height/2
        circle.layer.borderWidth = 1
        circle.layer.borderColor = UIColor.clear.cgColor
        circle.clipsToBounds = true
        
        let title = UILabel()
        title.text = "Kim"
        title.textAlignment = .center
        title.frame = CGRect(x: 0, y: self.frame.size.width + 10, width: self.frame.size.width, height: 30)

        self.addSubview(circle)
        self.addSubview(title)
        
//        circle.backgroundColor = .brown
//        title.backgroundColor = .orange
    }
    

}
