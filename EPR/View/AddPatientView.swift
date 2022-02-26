//
//  AddPatientView.swift
//  EPR
//
//  Created by Christian Dacres on 26/02/2022.
//

import SwiftUI
import CoreData

struct AddPatientView: View {
    
    @State var name: String = ""
    @State var age: String = ""
//    @State var hospitalNumber: String = ""
    
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        VStack {
            Text("Add Patient")
            TextField("Name", text: $name)
            TextField("Age", text: $age)
            Button("Add") {
                buildPatient()
                saveContext()
                print(viewContext)
            }
        }
        .padding()
    }
}

extension AddPatientView {
    func saveContext() {
        do{
            try viewContext.save()
        } catch {
            print(error)
        }
    }
    
    
    func buildPatient() {
        let patient = Patient(context: viewContext)
        patient.name = "\(name)"
        patient.age = Int(age)!
        patient.index = Int.random(in: 1...10)
    }
}

struct AddPatientView_Previews: PreviewProvider {
    static var previews: some View {
        AddPatientView()
    }
}
