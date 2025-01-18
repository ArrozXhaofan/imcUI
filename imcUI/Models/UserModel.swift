//
//  UserModel.swift
//  imcUI
//
//  Created by Jeanpiere Laura on 2/10/24.
//

import Foundation

struct UserModel: Hashable {
    
    var unit: SystemUnits
    var altura: Double
    var peso: Double
    var imc: Double {
        
        if altura == 0 || peso == 0 {
            return 0
        } else {
            switch unit {
            case .imperial:
                return (peso * 703) / pow(altura, 2)
            case .metric:
                return peso / pow(altura / 100, 2)
            }
        }
    }
}
