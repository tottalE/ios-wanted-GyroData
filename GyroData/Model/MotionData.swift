//
//  MotionData.swift
//  GyroData
//
//  Created by jin on 2/1/23.
//

import Foundation

struct MotionData: Hashable {
    
    let id: UUID
    let type: MotionType
    let motions: [Motion]
    let date: Date
    let time: Double
    
    static func == (lhs: MotionData, rhs: MotionData) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}
