//
//  ContentView.swift
//  EPR
//
//  Created by Christian Dacres on 26/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \Patient.index, ascending: true)
    ], animation: .default)
    private var items: FetchedResults<Patient>
//    private var patient = Patient()
    
//    @AppStorage("needsAppOnboarding") private var needsAppOnboarding: Bool = true
    
//    @State private var selectedTab = 1
    //@State private var patientsDatabase: [PatientInfo] = PatientModel().patientDemoData
    
    var body: some View {
        
        NavigationView {
            
            List(items) { patient in
                NavigationLink(destination: PatientView(name: patient.name, age: patient.age)) {
                    Text(patient.name)
                }
        
            }
            .onAppear {
                print(items.first?.age ?? "empty")
            }
            .navigationTitle("Patients")
            .toolbar {
                        NavigationLink(destination: AddPatientView()) {
                            Image(systemName: "plus.circle")
                        }
            }
            
        }
        
    
}

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
