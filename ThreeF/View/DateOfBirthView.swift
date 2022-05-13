//
//  DateOfBirthView.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-10.
//

import UIKit

class DateOfBirthView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    private func loadView() {
        dateOfBirthPage()
    }
    
    private func dateOfBirthPage() {
        let label = UILabel()
        label.text = "What's your date of Birth?"
        label.textAlignment = .center
        label.font = label.font.withSize(25)

        let datePicker = UIDatePicker()
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
        let calendar = Calendar(identifier: .gregorian)

        let currentDate = Date()
        var components = DateComponents()
        components.calendar = calendar

        components.year = -10
        components.month = 12
        let maxDate = calendar.date(byAdding: components, to: currentDate)!

        components.year = -100
        let minDate = calendar.date(byAdding: components, to: currentDate)!

        datePicker.minimumDate = minDate
        datePicker.maximumDate = maxDate

        let nextBtn = UIButton()
        nextBtn.setTitle("NEXT", for: .normal)
        nextBtn.addTarget(self, action: #selector(selectedGender), for: .touchUpInside)
        nextBtn.layer.borderWidth = 1
        nextBtn.layer.cornerRadius = 25
        
        self.addSubview(label)
        self.addSubview(datePicker)
        
        let alm = AutolayouutManager()
        alm.setAutolayoutWithHeight(view: self, object: label, height: 50, left: 10, right: 10, top: 20, hCenter: true)
        alm.setAutolayoutFull(view: self, object: datePicker, top: 80, bottom: 40, right: 20, left: 20)
 
        
    }
    
    @objc func selectedGender() {
        print("selected")
    }
    
    @objc func datePickerValueChanged(){
            
            // Create date formatter
            let dateFormatter: DateFormatter = DateFormatter()
            
            // Set date format
            dateFormatter.dateFormat = "MM/dd/yyyy"
            
            // Apply date format
//            let selectedDate: String = dateFormatter.string(from: sender.date)
            
//            print("Selected value \(selectedDate)")
        }

}
