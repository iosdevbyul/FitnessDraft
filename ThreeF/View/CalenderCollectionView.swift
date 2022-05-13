//
//  CalenderCollectionView.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-20.
//

import UIKit

class CalenderCollectionView: UICollectionView {
    
    
    override func draw(_ rect: CGRect) {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        
        
//               self = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
//        self?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
//        self?.backgroundColor = UIColor.white
//               view.addSubview(myCollectionView ?? UICollectionView())
    }

}
