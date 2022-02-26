//
//  CoreData.swift
//  EPR
//
//  Created by Christian Dacres on 26/02/2022.
//

import SwiftUI
import CoreData

//MARK: Patient Object

@objc(Patient)
class Patient: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var age: Int
    //@NSManaged var hospitalNumber: Int
    @NSManaged var index: Int
}

extension Patient: Identifiable {
    var id: Int {
        index
    }
}

//MARK: Persistence

class Persistence {
    static let shared = Persistence()
    
    static let previewFull: Persistence = {
        let result = Persistence(inMemory: true)
        let context = result.container.viewContext
        
        return result
    }()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        let taskEntity = NSEntityDescription()
        taskEntity.name = "Patient"
        taskEntity.managedObjectClassName = "Patient"
        
        let attributeName = NSAttributeDescription()
        attributeName.name = "name"
        attributeName.type = .string
        taskEntity.properties.append(attributeName)
        
        let ageAttribute = NSAttributeDescription()
        ageAttribute.name = "age"
        ageAttribute.type = .integer64
        taskEntity.properties.append(ageAttribute)
        
        //let hosNumAttribute = NSAttributeDescription()
        //hosNumAttribute.name = "hospital number"
        //hosNumAttribute.type = .integer64
        //taskEntity.properties.append(hosNumAttribute)
        
        let indexAttribute = NSAttributeDescription()
        indexAttribute.name = "index"
        indexAttribute.type = .integer64
        taskEntity.properties.append(indexAttribute)
        
        let model = NSManagedObjectModel()
        model.entities = [taskEntity]
        
        let container = NSPersistentContainer(name: "TaskModel", managedObjectModel: model)
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Failed with: \(error.localizedDescription)")
            }
        }
        
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        self.container = container
    }
    
}
