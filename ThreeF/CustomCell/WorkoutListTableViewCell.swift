//
//  WorkoutListTableViewCell.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-05-06.
//

import UIKit

class WorkoutListTableViewCell: UITableViewCell {
    
    private var workOutNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
        setUpLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpCell()
        setUpLabel()
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell() {
        
    }
    func setUpLabel() {
        
    }

}
