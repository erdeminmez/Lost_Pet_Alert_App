//
//  DisappearanceAlert.swift
//  Lost_Pet_Alert_App
//
//  Created by Erdem Inmez on 2022-12-09.
//

import Foundation

struct DisappearanceAlert: Identifiable {
    var id = UUID()
    
    var petType : String
    var petKind : String
    var petColor : String
    var petDescription : String
    
    var dspTime : Date
    var dspStreet : String
    var dspCity : String
    var dspCountry : String
    
    var contactName : String
    var contactNumber : String
}
