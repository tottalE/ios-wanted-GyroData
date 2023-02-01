//
//  MotionData.swift
//  GyroData
//
//  Created by jin on 2/1/23.
//

import Foundation

struct MotionData: Identifiable {
    
    let id: UUID
    let type: MotionType
    let motions: [Motion]
    let date: Date
}
