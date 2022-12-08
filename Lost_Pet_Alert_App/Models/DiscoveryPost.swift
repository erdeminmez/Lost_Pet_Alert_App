//
//  DiscoveryPost.swift
//  Lost_Pet_Alert_App
//
//  Created by Erdem Inmez on 2022-12-08.
//

import Foundation

struct DiscoveryPost : Identifiable {
    var id = UUID()
    var petType : String
    var petKind : String
    var petColor : String
    var description : String
    var isCollected : Bool
    var location : [Double]
    var contactName : String
    var contactNumber : String
}
