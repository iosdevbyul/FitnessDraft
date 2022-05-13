//
//  SurveyView.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-10.
//

import UIKit

class SurveyView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    private func loadView() {
        genderPage()
    }
    
    private func genderPage() {
        let label = UILabel()
        label.text = "What's your gender?"
        label.textAlignment = .center
        label.font = label.font.withSize(25)

        
        let femaleBtn = UIButton()
        femaleBtn.setTitle("FEMALE", for: .normal)
        femaleBtn.addTarget(self, action: #selector(selectedGender), for: .touchUpInside)
        femaleBtn.layer.borderWidth = 1
        femaleBtn.layer.cornerRadius = 20
        
        let maleBtn = UIButton()
        maleBtn.setTitle("MALE", for: .normal)
        maleBtn.addTarget(self, action: #selector(selectedGender), for: .touchUpInside)
        maleBtn.layer.borderWidth = 1
        maleBtn.layer.cornerRadius = 20
        
        self.addSubview(label)
        self.addSubview(femaleBtn)
        self.addSubview(maleBtn)
        
        let alm = AutolayouutManager()
        alm.setAutolayoutWithHeight(view: self, object: label, height: 50, left: 10, right: 10, top: 20, hCenter: true)
        alm.setAutolayoutWithHeight(view: self, object: femaleBtn, height: 100, left: 20, right: 20, top: 100, hCenter: true)
        alm.setAutolayoutWithHeight(view: self, object: maleBtn, height: 100, left: 20, right: 20, top: 250, hCenter: true)

        
    }
    
    @objc func selectedGender() {
        print("selected")
    }

}
