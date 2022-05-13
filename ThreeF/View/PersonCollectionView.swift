//
//  PersonCollectionView.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-19.
//

import UIKit

class PersonCollectionView: UIView  {
//    var personCollectionView: UICollectionView
    let flowLayout = UICollectionViewFlowLayout()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setting()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setting()
    }
    
    
    private func setting() {
        self.backgroundColor = .yellow
        let personCollectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        self.addSubview(personCollectionView)
        personCollectionView.backgroundColor = .red
        
//        let alm = AutolayouutManager()
//        alm.setAutolayoutWithHeight(view: self, object: self, height: 250, left: 0, right: 0, top: 50, hCenter: true)

    }
    
    
}


extension PersonCollectionView: UICollectionViewDelegate, UICollectionViewDataSource{


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
                cell.backgroundColor = UIColor.blue
                return cell
    }
}
