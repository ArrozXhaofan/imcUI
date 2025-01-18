//
//  UserMV.swift
//  imcUI
//
//  Created by Jeanpiere Laura on 2/10/24.
//

import Foundation

enum SystemUnits: String, CaseIterable {
    case metric
    case imperial
}

@Observable
final class UserMV {
    
    var userClientData: UserModel
    
    init() {
        self.userClientData = UserModel(unit: .metric,
                                        altura: 172,
                                        peso: 64)
    }
    
    func refreshUserData(_ unit: SystemUnits, peso: Double, altura: Double) {
        self.userClientData.unit = unit
        self.userClientData.peso = peso
        self.userClientData.altura = altura
    }
    
    func resetData() {
        self.userClientData.altura = 0
        self.userClientData.peso = 0
    }
    
}


