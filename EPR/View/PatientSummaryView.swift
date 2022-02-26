//
//  PatientSummaryView.swift
//  EPR
//
//  Created by Christian Dacres on 26/02/2022.
//

import SwiftUI

struct PatientSummaryView: View {
    
    @State var name: String = ""
    @State var age: Int = 0
//    @State var hospitalNumber: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            HStack() {
                Text("Name: \(name)")
                Spacer()
                Text("Age: \(age)")
                Spacer()
//                Text("Hospital Number: \(hospitalNumber)")
            }
            .frame(alignment: .top)
            .padding()
            .border(Color.black, width: 1)
            
            VStack(spacing: 20) {
                HStack {
                    Text("Patient Summary")
                        .font(.title2)
                        .underline()
                    Spacer()
                }
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    .font(.body)
            }
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        //.border(Color.red, width: 1)
    }
}

struct PatientSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        PatientSummaryView()
    }
}
