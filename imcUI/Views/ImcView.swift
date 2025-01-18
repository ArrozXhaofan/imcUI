//
//  ImcView.swift
//  imcUI
//
//  Created by Jeanpiere Laura on 4/10/24.
//

import SwiftUI


struct ImcView: View {
    
    @State var vm = UserMV()
    
    @State var systemUnit: SystemUnits = .metric
    
    @State var weight: Double = 0
    @State var height: Double = 0
    
    let gradianWeightBar = LinearGradient(colors: [.cyan, .blue, .pink],
                                          startPoint: .leading,
                                          endPoint: .trailing)
    let gradianHeightBar = LinearGradient(colors: [.red, .purple, .orange],
                                          startPoint: .leading,
                                          endPoint: .trailing)
    
    
    func indexBar() -> CFloat {
        if vm.userClientData.imc > 44 {
            return 44
        } else {
            return CFloat(vm.userClientData.imc)
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
            
            VStack(spacing: 35) {
                
                Picker("", selection: $systemUnit) {
                    ForEach(SystemUnits.allCases, id: \.rawValue) { unit in
                        Text(unit.rawValue)
                            .tag(unit)
                    }
                }
                .pickerStyle(.segmented)
                .frame(width: 320)
                .onChange(of: systemUnit) { _, newValue in
                    vm.resetData()
                    height = 0
                    weight = 0
                    print(vm.userClientData)
                }
                
                VStack(spacing: 3) {
                    Text(String(format:"%.1f", weight) + "\(systemUnit == .metric ?  " kg" : " lbs")")
                    ZStack {
                        Slider(value: $weight,
                               in: vm.userClientData.unit == .metric ? 30...150 : 66...330,
                               step: 0.1)
                            .tint(.clear)
                            .frame(width: 320)
                            .opacity(0.5)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(gradianWeightBar)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray, lineWidth: 0.5)
                                    }
                            }
                    }
                }
                VStack(spacing: 3) {
                    Text(String(format:"%.0f", height) + "\(systemUnit == .metric ?  " cm" : " in")")
                    ZStack {
                        Slider(value: $height,
                               in: vm.userClientData.unit == .metric ? 140...230 : 50...120,
                               step: 1)
                            .tint(.clear)
                            .frame(width: 320)
                            .opacity(0.5)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(gradianHeightBar)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray, lineWidth: 0.5)
                                    }
                            }
                    }
                }
            }
 
            Spacer()
            
            Text("Los datos introducidos no se compatiran con ninguna entidad, eso incluyo al creador")
                .font(.caption2)
                .foregroundStyle(.secondary)
                .lineSpacing(0)
                .multilineTextAlignment(.center)
                .frame(width: 300)
            
        }//end main Vstack
        .onChange(of: weight) { _, newValue in
            vm.refreshUserData(systemUnit,
                               peso: newValue,
                               altura: height)
            print(vm.userClientData.imc)
        }
        .onChange(of: height) { _, newValue in
            vm.refreshUserData(systemUnit,
                               peso: weight,
                               altura: newValue)
            print(vm.userClientData.imc)
        }
        .onAppear {
            height = vm.userClientData.altura
            weight = vm.userClientData.peso
        }
    }//en body view
    
    var infoImcIndex: some View {
        HStack {
            Spacer()
            VStack {
                
                Text("Tu IMC")
                    .font(.system(size: 15, weight: .light))
                    .foregroundStyle(.secondary)
                
                Text(String(format: "%.1f", vm.userClientData.imc))
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
    ImcView()
}
