//
//  ProfileTableViewCell.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-14.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    let gap = 10.0
    
    let profileImageView: UIImageView = {
        let piv = UIImageView()
        piv.image = UIImage(named: "profile.jpeg")
        return piv
    }()
    
    let nameLabel: UILabel = {
        let nl = UILabel()
        nl.text = "김땡땡님"
        nl.textAlignment = .center
        
        return nl
    }()
    
    let btn1: UIButton = {
        let btn = UIButton()
        btn.setTitle("Function1", for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.addTarget(ProfileTableViewCell.self, action: #selector(clickFunction1Btn), for: .touchUpInside)
        return btn
    }()
    
    let btn2: UIButton = {
        let btn = UIButton()
        btn.setTitle("개인정보수정", for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.addTarget(ProfileTableViewCell.self, action: #selector(clickFunction2Btn), for: .touchUpInside)
        return btn
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setting()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setting() {
        selectionStyle = .none
        
        contentView.addSubview(profileImageView)
        profileImageView.frame = CGRect(x: (self.frame.width / 2) , y: 10, width: 100.0, height: 100.0)
        profileImageView.contentMode = .scaleAspectFit

        let itemWidth = (Double(contentView.frame.size.width) - (4 * gap)) / 3
        let itemHeight = (itemWidth / 3) * 2
        let totalHeight = (gap * 2) + 100 + itemHeight
        
        contentView.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: gap, y: totalHeight-itemHeight, width: itemWidth, height: itemHeight)
        nameLabel.numberOfLines = 0
        
        contentView.addSubview(btn1)
        btn1.frame = CGRect(x: (gap * 2) + itemWidth , y: totalHeight-itemHeight, width: itemWidth, height: itemHeight)
        
        contentView.addSubview(btn2)
        btn2.frame = CGRect(x: (gap * 3) + (itemWidth*2) , y: totalHeight-itemHeight, width: itemWidth*2, height: itemHeight)
        
        profileImageView.layer.borderColor = UIColor.black.cgColor
        profileImageView.layer.borderWidth = 1
        
        nameLabel.backgroundColor = .white
        btn1.backgroundColor = .white
        btn2.backgroundColor = .white
        
//        nameLabel.layer.borderWidth = 1
        btn1.layer.borderWidth = 1
        btn2.layer.borderWidth = 1
        
//        nameLabel.layer.borderColor = UIColor.black.cgColor
        btn1.layer.borderColor = UIColor.black.cgColor
        btn2.layer.borderColor = UIColor.black.cgColor
        
//        nameLabel.layer.cornerRadius = 15
        btn1.layer.cornerRadius = 15
        btn2.layer.cornerRadius = 15
        
        btn1.setTitleColor(.black, for: .normal)
        btn2.setTitleColor(.black, for: .normal)
        
        
    }
    
    func getImage() -> UIImage {
        return UIImage()
    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
////        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    @objc func clickFunction1Btn() {
        print("111111")
    }
    
    @objc func clickFunction2Btn() {
        print("2222222")
    }

}
