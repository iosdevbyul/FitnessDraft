//
//  TrainerViewModel.swift
//  ThreeF
//
//  Created by COMATOKI on 2022-05-13.
//

import Foundation

struct TrainerListViewModel {
    let trainers: [Trainer]
}

extension TrainerListViewModel {
    var numberOfSection: Int {
        return 1
    }
    
    func numberOfRowsInSection(_section: Int) -> Int {
        return self.trainers.count
    }
    
    func trainerAtIndex(_ index:Int) -> TrainerViewModel {
        let trainer = self.trainers[index]
        return TrainerViewModel(trainer)
    }
}

struct TrainerViewModel {
    private let trainer: Trainer
}

extension TrainerViewModel {
    init(_ trainer:Trainer) {
        self.trainer = trainer
    }
}

extension TrainerViewModel {
    var info: Info {
        return self.trainer.info
    }
//    var bodyInfo: BodyInfo {
//        return self.trainer.bodyInfo
//    }
//    var teachingMembers: [Trainee] {
//        return self.trainer.teachingMembers
//    }
//    var workingPlaces: [Gym] {
//        return self.trainer.workingPlaces
//    }
//    var schedule: Schedule {
//        return self.trainer.schedule
//    }
}
