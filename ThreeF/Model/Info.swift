//
//  Info.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-05-13.
//

import Foundation

struct Info {
    var id: String
    var name: String
    var phone: String
    var password: String
    var email: String
    var deteJoined: Date
    
    var isTrainer = false
    var bodyInfo: BodyInfo?
    var profilePhoto: Photo?
    var routine: [Workout]?
    
    
    func createAccount() {
        print("Account created")
    }
    
    func modifyAccount() {
        print("Account Info modified")
    }
    
    func reviewAccount() {
        print("Show Account date")
    }
    
    func leave() {
        print("Bye")
    }
}
