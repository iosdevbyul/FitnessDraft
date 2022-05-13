//
//  DayCollectionViewCell.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-05-12.
//

import UIKit

class DayCollectionViewCell: UICollectionViewCell {
    
    let cellLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setting()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setting() {
        cellLabel.textColor = .black
        cellLabel.frame = self.bounds
        self.addSubview(cellLabel)
        
        
    }
}
