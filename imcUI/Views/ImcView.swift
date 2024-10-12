//
//  ImcView.swift
//  imcUI
//
//  Created by Jeanpiere Laura on 4/10/24.
//

import SwiftUI

struct ImcView: View {
    
    let DataUser: UserModel
    
    func indexBar() -> CFloat {
        if DataUser.imc > 44 {
            return 44
        } else {
            return CFloat(DataUser.imc)
        }
        
    }
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                infoImcIndex
                
                Spacer()
                
                legentImcIndex
                
                barImcIndex
                
            }
            
            Spacer()
            
            Text("Los datos introducidos no se compatiran con ninguna entidad, eso incluyo al creador")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .lineSpacing(0)
                .multilineTextAlignment(.center)
                .frame(width: 200)
            
        }//end main Vstack
    }//en body view
    
    var infoImcIndex: some View {
        HStack {
            Spacer()
            VStack {
                
                Text("Tu IMC")
                    .font(.system(size: 15, weight: .light))
                    .foregroundStyle(.secondary)
                
                Text(String(format: "%.1f", DataUser.imc))
                    .font(.system(size: 80, weight: .bold, design: .rounded))
                    .foregroundStyle(.
                                     linearGradient(
                                        colors: [.pink, .cyan, .orange],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing))
            }
            
            Spacer()
        }
    }
    
    var legentImcIndex: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Circle()
                    .frame(width: 5, height: 5)
                    .foregroundStyle(.red)
                Text("Obseidad 3")
            }
            
            HStack {
                Circle()
                    .frame(width: 5, height: 5)
                    .foregroundStyle(.orange)
                Text("Obseidad 2")
            }
            
            HStack {
                Circle()
                    .frame(width: 5, height: 5)
                    .foregroundStyle(.pink)
                Text("Obseidad 1")
            }
            
            HStack {
                Circle()
                    .frame(width: 5, height: 5)
                    .foregroundStyle(.blue)
                Text("Sobrepeso")
            }
            
            HStack {
                Circle()
                    .frame(width: 5, height: 5)
                    .foregroundStyle(.green)
                    .foregroundStyle(.green)
                Text("Normal")
            }
            
            HStack {
                Circle()
                    .frame(width: 5, height: 5)
                    .foregroundStyle(.blue)
                Text("Delgadez leve")
            }
            
            HStack {
                Circle()
                    .frame(width: 5, height: 5)
                    .foregroundStyle(.indigo)
                Text("Delgadez moderada")
            }
            
            HStack {
                Circle()
                    .frame(width: 5, height: 5)
                    .foregroundStyle(.purple)
                Text("Delgadez severa")
            }
            
        }
        .font(.system(size: 10))

    }
    
    var barImcIndex: some View {
        ZStack(alignment: .bottomLeading) {
            VStack(spacing: 0) {
                
                Rectangle()
                    .foregroundStyle(.red)
                    .frame(width: 40, height: 24)
                
                Rectangle()
                    .foregroundStyle(.orange)
                    .frame(width: 40, height: 22)
                
                Rectangle()
                    .foregroundStyle(.pink)
                    .frame(width: 40, height: 22)
                
                Rectangle()
                    .foregroundStyle(.blue)
                    .frame(width: 40, height: 22)
                
                Rectangle()
                    .foregroundStyle(.green)
                    .frame(width: 40, height: 28)
                
                Rectangle()
                    .foregroundStyle(.blue)
                    .frame(width: 40, height: 7)
                
                Rectangle()
                    .foregroundStyle(.indigo)
                    .frame(width: 40, height: 4)
                
                Rectangle()
                    .foregroundStyle(.purple)
                    .frame(width: 40, height: 71)
                
            }
            
            Rectangle()
                .frame(width: 50, height: 1)
                .overlay(alignment: .leading) {
                    Circle()
                        .frame(width: 10, height: 10)
                }
                .offset(x: -10, y: -CGFloat((indexBar())) / 45 * 200)
            
            
        }
        .frame(width: 40, height: 200)
        .shadow(radius: 10)
    }
}

#Preview {
    ImcView(DataUser: UserModel(altura: 1.72, peso: 72, imc: 21.231432))
}
