//
//  DiscoveryAlertView.swift
//  Lost_Pet_Alert_App
//
//  Created by Erdem Inmez on 2022-12-08.
//

import SwiftUI

struct DiscoveryAlertView: View {
    
    enum PetType: String, CaseIterable, Identifiable {
        case dog, cat, bird
        var id: Self { self }
    }
    
    @State private var selectedPetType: PetType
    @State private var selectedPetKind: String = ""
    @State private var selectedPetColor: String = ""
    @State private var writtenDescription: String = ""
    @State private var isCollected: Bool = false
    @State private var discoveryLocation: [Double] = [0.0,0.0]
    @State private var contactName: String = ""
    @State private var contactNumber: String = ""
    
    
    
    var body: some View {
        Text("Discovery Alert")
    }
}

//struct DiscoveryAlertView_Previews: PreviewProvider {
//    static var previews: some View {
//        DiscoveryAlertView()
//    }
//}
