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
    @State var hospitalNumber: Int = 123
    
    var body: some View {
        VStack {
            HStack() {
                Text("Name: \(name)")
                Spacer()
                Text("Age: \(age)")
                Spacer()
                Text("Hospital Number: \(hospitalNumber)")
            }
            .frame(alignment: .top)
            .padding()
            .border(Color.black, width: 1)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        //.border(Color.red, width: 1)
    }
}

struct PatientSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        PatientSummaryView()
    }
}
