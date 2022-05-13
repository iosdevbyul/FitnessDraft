//
//  HeightView.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-10.
//

import UIKit




class HeightView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var heightPickerDataForCm: [Int] = []
    var heightPickerDataForMm: [Int] = []
    var heightPickerDataForFt: [Int] = []
    var heightPickerDataForIn: [Int] = []
    let unit = ["cm","ft/in"]
    var isSelectedCm = true
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    private func loadView() {
        heightPage()
    }
    
    private func heightPage() {
        let label = UILabel()
        label.text = "What's your height?"
        label.textAlignment = .center
        self.addSubview(label)
        
        setPickerData()
        let heightPicker = UIPickerView()
        self.addSubview(heightPicker)
        heightPicker.delegate = self
        heightPicker.dataSource = self
        
        let alm = AutolayouutManager()
        alm.setAutolayoutWithHeight(view: self, object: label, height: 50, left: 10, right: 10, top: 20, hCenter: true)
        alm.setAutolayoutFull(view: self, object: heightPicker, top: 80, bottom: 40, right: 20, left: 20)
    }
    
    private func setPickerData() {
        for i in 50...250 {
            heightPickerDataForCm.append(i)
        }
        for i in 0...9 {
            heightPickerDataForMm.append(i)
        }
        for i in 2...9 {
            heightPickerDataForFt.append(i)
        }
        for i in 0...11 {
            heightPickerDataForIn.append(i)
        }
    }
 
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if( !isSelectedCm ) {
            if component == 0 {
                return heightPickerDataForFt.count
            } else if component == 1 {
                return heightPickerDataForIn.count
            } else {
                return 2
            }
        } else {
            if component == 0 {
                return heightPickerDataForCm.count
            } else if component == 1 {
                return heightPickerDataForMm.count
            } else {
                return 2
            }
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("row & componet")
        print(row)
        print(component)
        
        if (component == 2 && row == 1) {
            isSelectedCm = false
            pickerView.reloadAllComponents()

        } else if (component == 2 && row == 0) {
            isSelectedCm = true
            pickerView.reloadAllComponents()
        } else {
            
        }
    }

    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        if( !isSelectedCm) {
            if(component == 0) {
                return "\(heightPickerDataForFt[row])"
            } else if(component == 1) {
                return "\(heightPickerDataForIn[row])"
            } else {
                return unit[row]
            }
        } else {
            if(component == 0) {
                return "\(heightPickerDataForCm[row])"
            } else if(component == 1) {
                return "\(heightPickerDataForMm[row])"
            } else {
                return unit[row]
            }
        }
        
    
    }
}

