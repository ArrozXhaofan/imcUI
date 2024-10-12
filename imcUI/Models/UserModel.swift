//
//  UserModel.swift
//  imcUI
//
//  Created by Jeanpiere Laura on 2/10/24.
//

import Foundation

struct UserModel: Hashable {
    
    let altura: Double
    let peso: Double
    var imc: Double
}

enum weightValueCase: String, CaseIterable {
    case kg
    case lb
}

enum heightValueCase: String, CaseIterable {
    case meter
    case feet
    case inch
}

extension Double {
    
    func standardWeight( weightU: weightValueCase) -> Double {
                
        switch weightU {
        case .kg:
            return self
        case .lb:
            return self / 2.20462
        }
    }
    
     func standardHeight(heightU: heightValueCase) -> Double {
                
        switch heightU {
        case .meter:
            return self
        case .feet:
            return self / 3.28084
        case .inch:
            return self * 0.0254
        }
    }
}
