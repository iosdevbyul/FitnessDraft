//
//  Autolayout.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-04-07.
//

import Foundation
import UIKit

class AutolayouutManager {
    
    private var value: CGFloat = 0.0

    func setAutolayoutWithHeight(view: UIView, object: UIView, height: Double, left: Double?, right:Double?, top: Double?, hCenter: Bool) {
        object.translatesAutoresizingMaskIntoConstraints = false
        setTopLeftRight(view, object, top, left, right)
        
        if (hCenter) {
            object.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        }
        object.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setAutolayoutWithBottom(view: UIView, object: UIView, height: Double, left: Double?, right:Double?, bottom:Double?, hCenter: Bool) {
        object.translatesAutoresizingMaskIntoConstraints = false
        setTopLeftRight(view, object, nil, left, right)
        
        if (getValue(bottom)) {
            let v = value * -1
            object.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: v).isActive = true
        }
        if (hCenter) {
            object.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        }
        object.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setAutolayoutFull(view: UIView, object: UIView, top: Double?, bottom:Double?, right:Double?, left:Double?) {
        object.translatesAutoresizingMaskIntoConstraints = false

        setTopLeftRight(view, object, top, left, right)
        if (getValue(bottom)) {
            let v = value * -1
            object.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: v).isActive = true
        }

        
    }
    
    private func setTopLeftRight(_ view: UIView, _ object: UIView, _ top: Double?, _ left: Double?, _ right: Double?) {
        if (getValue(left)) {
            object.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: value).isActive = true
        }
        if (getValue(right)) {
            let v = value * -1
            object.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: v).isActive = true
        }
        if (getValue(top)) {
            object.topAnchor.constraint(equalTo: view.topAnchor, constant: value).isActive = true
        }
    }
    
    private func getValue(_ value: Double?) -> Bool{
        var res = false
        guard let v = value else {
            return res
        }
        self.value = v
        res = true
        return res
    }
}
