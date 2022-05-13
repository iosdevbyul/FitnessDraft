//
//  ProgessBarView.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-21.
//

import UIKit

class ProgessBarView: UIView {
    
    var bar1 = UIView()
    var bar2 = UIView()
    var bar3 = UIView()
    var bar4 = UIView()
    var bar5 = UIView()
    var bar6 = UIView()
    var bar7 = UIView()
    var barStorage:[UIView] = []
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    func loadView() {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        createBar()
    }
    
    func createBar() {
        barStorage.append(bar1)
        barStorage.append(bar2)
        barStorage.append(bar3)
        barStorage.append(bar4)
        barStorage.append(bar5)
        barStorage.append(bar6)
        barStorage.append(bar7)

        let gap: Double = ( self.frame.width / 2.0 ) / 8.0
        let barWidth: Double = self.frame.width / 2.0 / 7.0
        for i in 0...6 {
            barStorage[i].frame = CGRect(x: (gap * (Double(i) + 1.0)) + (barWidth * Double(i)), y: 10, width: barWidth, height: self.frame.height-CGFloat(40.0))
            
            print(gap)
            print(i)
            print(barWidth)
            
            
            self.addSubview(barStorage[i])
            barStorage[i].backgroundColor = .darkGray
            
            let label = UILabel()
            label.text = String(i)
            label.frame = CGRect(x: barStorage[i].frame.origin.x , y: barStorage[i].frame.origin.y + barStorage[i].frame.size.height, width: barWidth, height: 20)
            self.addSubview(label)
            label.backgroundColor = .red
            label.textAlignment = .center
            
        }
    }

}
