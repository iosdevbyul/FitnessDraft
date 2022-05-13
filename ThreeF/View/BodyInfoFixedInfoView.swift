//
//  BodyInfoFixedInfoView.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-05-05.
//

import UIKit

class BodyInfoFixedInfoView: UIView {

    let weightLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        let title = "키\n\n"
        var unit = "cm"
        lbl.text = title+"180"+unit
        lbl.textAlignment = .center
        lbl.layer.borderColor = UIColor.black.cgColor
        lbl.layer.borderWidth = 1
        lbl.layer.cornerRadius = 15
        return lbl
    }()
    
    let mMassLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        let title = "성별\n\n"
        lbl.text = title+"여성"
        lbl.textAlignment = .center
        lbl.layer.borderColor = UIColor.black.cgColor
        lbl.layer.borderWidth = 1
        lbl.layer.cornerRadius = 15
        return lbl
    }()
    
    let fatLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        let title = "생년월일\n\n"
        lbl.text = title+"1999.09.09"
        lbl.textAlignment = .center
        lbl.layer.borderColor = UIColor.black.cgColor
        lbl.layer.borderWidth = 1
        lbl.layer.cornerRadius = 15
        return lbl
    }()

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
        self.addSubview(weightLabel)
        self.addSubview(mMassLabel)
        self.addSubview(fatLabel)
        
        let gapCount = 4
        let gap = 20
        let width = (Int(self.frame.size.width) - (gap * gapCount)) / 3
        
        weightLabel.frame = CGRect(x: gap, y: 50, width: width, height: width)
        mMassLabel.frame = CGRect(x: (gap*2) + width, y: 50, width: width, height: width)
        fatLabel.frame = CGRect(x: (gap*3) + (width*2), y: 50, width: width, height: width)
    }

}
