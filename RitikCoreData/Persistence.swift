//
//  PersistenceController.swift
//  RitikCoreData
//
//  Created by MD SHAFIQ PATEL on 12/11/21.
//

import CoreData



struct PersistenceController{


    static let shared = PersistenceController()

    let container:NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "MyStudents")
        container.loadPersistentStores{ (storeDescription, error) in
            if let error = error as NSError?{
                fatalError("unresolveed Error \(error)")
            }
        }
    }

}
