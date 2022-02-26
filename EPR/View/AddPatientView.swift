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
    @State var hospitalNumber: Int = 1
    
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        VStack {
            Text("Add Patient")
            TextField("Name", text: $name)
            TextField("Age", text: $age)
            Button("Add") {
                let patient = Patient(context: viewContext)
                patient.name = "\(name)"
                patient.age = Int(age)!
                //patient.hospitalNumber = hospitalNumber
                let indNumber = Int.random(in: 1...5)
                //hospitalNumber = Int.random(in: 111...999)
                //patient.hospitalNumber = hospitalNumber
                patient.index = indNumber
                saveContext()
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
}

struct AddPatientView_Previews: PreviewProvider {
    static var previews: some View {
        AddPatientView()
    }
}
