//
//  WorkoutRatioView.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-05-06.
//

import UIKit

class WorkoutRatioView: UIView {
    
    var wrvTitle: String = ""
    var occupiedDataCount: Int = 0
    var totalCount: Int = 0
    
    let wrvlabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        return lbl
    }()
    
    let backgroundView: UIView = {
        let bv = UIView()
        return bv
    }()
    
    let progressView: UIView = {
        let pv = UIView()
        
        return pv
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
        self.addSubview(wrvlabel)
        self.addSubview(backgroundView)
        backgroundView.backgroundColor = .lightGray
        backgroundView.addSubview(progressView)
        progressView.backgroundColor = .systemBlue
    }
    
    func setData(_ title:String, _ dataCount: Int, _ totCount: Int) {
        if ( title == "" ) {
            wrvTitle = "Data"
        } else {
            wrvTitle = title
        }
        occupiedDataCount = dataCount
        totalCount = totCount
        
        drawChart()
    }
    
    func drawChart() {
        let widthForOneDataCount = (Double(self.frame.width) - 60.0) / Double(totalCount)
        wrvlabel.text = wrvTitle
        wrvlabel.frame = CGRect(x: 10, y: 10, width: 200, height: 40)
        backgroundView.frame = CGRect(x: 30, y: 60, width: self.frame.width - 60, height: 40)
        progressView.frame = CGRect(x: 0, y: 0, width: 0, height: 40)
        
        print(widthForOneDataCount)
        print(occupiedDataCount)
        print(widthForOneDataCount * Double(self.occupiedDataCount))
        
        UIView.animate(withDuration: 2.0, delay: 0.1, options: .curveEaseOut) { [self] in
            self.progressView.frame = CGRect(x: 0, y: 0, width: widthForOneDataCount * Double(self.occupiedDataCount), height: 40.0)
        } completion: { finished in
            print("Done")
        }
        
        

    }

}
