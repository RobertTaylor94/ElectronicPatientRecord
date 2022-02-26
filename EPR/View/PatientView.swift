//
//  PatientView.swift
//  EPR
//
//  Created by Christian Dacres on 26/02/2022.
//

import SwiftUI

struct PatientView: View {
    
    @State private var selectedTab = 1
    var name: String = ""
    var age: Int = 0
//    var hospitalNumber: String = ""
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            PatientSummaryView(name: name, age: age)
                .tabItem { Label("Patient Summary", systemImage: "doc.text.below.ecg") }
                .tag(1)
            ObservationsView()
                .tabItem { Label("Observations", systemImage: "waveform.path.ecg.rectangle") }
                .tag(2)
        }
        .padding()
    }
    
}

struct PatientView_Previews: PreviewProvider {
    static var previews: some View {
        PatientView()
    }
}
