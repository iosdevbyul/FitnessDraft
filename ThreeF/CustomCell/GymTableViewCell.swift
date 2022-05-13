//
//  GymTableViewCell.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-05-05.
//

import UIKit

class GymTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "현재 등록된 헬스장"
        lbl.textAlignment = .left
        return lbl
    }()
    
    let gymNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Yellow Fitness"
        lbl.textAlignment = .left
        return lbl
    }()
    
    let moveFitnessButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("헬스장 옮기기", for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.addTarget(GymTableViewCell.self, action: #selector(clickMoveFitnessBtn), for: .touchUpInside)
        return btn
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setting() {
        self.selectionStyle = .none
        
        titleLabel.frame = CGRect(x: 10, y: 10, width: 200, height: 40)
        contentView.addSubview(titleLabel)
        
        gymNameLabel.frame = CGRect(x: 30, y: 60, width: 300, height: 40)
        contentView.addSubview(gymNameLabel)
        
        contentView.addSubview(moveFitnessButton)
        moveFitnessButton.frame = CGRect(x: contentView.frame.size.width-20, y: 10, width: 100, height: 40)
        moveFitnessButton.setTitleColor(.gray, for: .normal)
        
    }
    
    @objc func clickMoveFitnessBtn(_ sender:UIButton) {
        print("MOVE")
    }

}
