//
//  WeightView.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-10.
//

import UIKit

class WeightView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    var weightData:[Int] = []
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    private func loadView() {
        weightPage()
    }
    
    private func weightPage() {
        let label = UILabel()
        label.text = "What's your weight?"
        label.textAlignment = .center
        label.font = label.font.withSize(25)
        
        setWeightData()
        
        let weightPicker = UIPickerView()
        weightPicker.delegate = self
        weightPicker.dataSource = self
        self.addSubview(weightPicker)

        self.addSubview(label)
        let alm = AutolayouutManager()
        alm.setAutolayoutWithHeight(view: self, object: label, height: 50, left: 10, right: 10, top: 20, hCenter: true)
        alm.setAutolayoutFull(view: self, object: weightPicker, top: 80, bottom: 40, right: 20, left: 20)

    }
    
    private func setWeightData() {
        for i in 30...500 {
            weightData.append(i)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weightData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(weightData[row])"
    }

}
