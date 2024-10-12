//
//  StartView.swift
//  imcUI
//
//  Created by Jeanpiere Laura on 2/10/24.
//

import SwiftUI


struct StartView: View {
    
    @StateObject var conexion: UserMV = UserMV()
    
    @State var heightValueTxt = ""
    @State var weightValueTxt = ""
    @State var weightValue: weightValueCase = .kg
    @State var heightValue: heightValueCase = .meter
    
    @State private var allowAccess: Bool = false
    
    var body: some View {
        
        NavigationStack{
            VStack {
                
                Form {
                    
                    Section("Main data") {
                        
                        HStack {
                            TextField("Height", text: $heightValueTxt)
                                .keyboardType(.decimalPad)
                            Picker(selection: $heightValue) {
                                ForEach(heightValueCase.allCases, id: \.self) {i in
                                    Text(i.rawValue)
                                }
                            } label: {EmptyView()}
                        }
                        
                        HStack {
                            TextField("Weight", text: $weightValueTxt)
                                .keyboardType(.decimalPad)
                            Picker(selection: $weightValue) {
                                ForEach(weightValueCase.allCases, id: \.self) {i in
                                    Text(i.rawValue)
                                }
                            }
                            label: {EmptyView()}
                        }
                    } //end section 1
                    
                    Section {
                        Button {
                            let (_, allow) = conexion.createdUser(
                                height: heightValueTxt,
                                weight: weightValueTxt,
                                hU: heightValue,
                                wU: weightValue)
                            
                            allowAccess = allow

                        } label: {Text("Go")}
                        
                        
                    }//end section 2
                }//end form
            }//end main Vstack
            .navigationTitle("Hola")
            .navigationDestination(isPresented: $allowAccess) {
                ImcView(DataUser: conexion.userClientData)
            }
            
        }//end nav stack
    }
}

#Preview {
    StartView()
}
