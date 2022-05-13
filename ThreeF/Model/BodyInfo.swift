//
//  BodyInfo.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-05-13.
//

import Foundation

struct BodyInfo {
    var weight: Double {
        willSet {
            if newValue > 10 || newValue < 500{
                self.weight = newValue
            }
        }
    }
    var mMass: Double {
        willSet {
            if newValue > 0 {
                self.mMass = newValue
            }
        }
    }
    var fat: Double {
        willSet {
            if newValue > 0 {
                self.fat = newValue
            }
        }
    }
    var height: Double {
        willSet {
            if newValue > 50 {
                self.height = newValue
            }
        }
    }
    var isWoman: Bool = true
    var birth: Date

    
}
