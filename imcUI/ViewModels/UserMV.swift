//
//  UserMV.swift
//  imcUI
//
//  Created by Jeanpiere Laura on 2/10/24.
//

import Foundation

final class UserMV: ObservableObject {
    
    @Published var userClientData: UserModel
    
    init() {
        self.userClientData = UserModel(altura: 0, peso: 0, imc: 0)
    }
    
    func createdUser(height: String, weight: String, hU: heightValueCase, wU: weightValueCase) -> (Double, Bool) {
        
        let h = (Double(height) ?? 0).standardHeight(heightU: hU)
        let w = (Double(weight) ?? 0).standardWeight(weightU: wU)
        let imc = w / pow(h, 2)
        
        if h <= 0 || w <= 0 {
            print("Please fill all fields, or wrong values")
            return (0, false)
            
        } /*else if imc > 44 {
            
            
            return (44, true)
        }*/
        else {
            let newUser = UserModel(altura: h, peso: w, imc: imc)
            self.userClientData = newUser
            return (self.userClientData.imc, true)
        }
    }
    
}


