//
//  DiscoveryAlertView.swift
//  Lost_Pet_Alert_App
//
//  Created by Erdem Inmez on 2022-12-08.
//

import SwiftUI

struct DiscoveryAlertView: View {
    
    enum PetType: String, CaseIterable, Identifiable {
        case dog, cat
        var id: Self { self }
    }
    
    @State private var selectedPetType: PetType = PetType.dog
    @State private var selectedPetKind: String = ""
    @State private var selectedPetColor: String = ""
    @State private var writtenDescription: String = ""
    @State private var isCollected: Bool = false
    @State private var locationPermission: Bool = false
    @State private var streetAddress: String = ""
    @State private var cityAddress: String = ""
    @State private var countryAddress: String = ""
    @State private var contactName: String = ""
    @State private var contactNumber: String = ""
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isEntryValid = false
    
    var body: some View {
        
        Form {
            Section (header: Text("Pet Info")) {
                Picker("Pet Type", selection: $selectedPetType) {
                    Text("Dog").tag(PetType.dog)
                    Text("Cat").tag(PetType.cat)
                }
                
                TextField("Pet Kind", text: self.$selectedPetKind)
                TextField("Pet Color", text: self.$selectedPetColor)
                TextField("Description", text: self.$writtenDescription)
                Toggle("Collected the pet", isOn: $isCollected)
            }
            
            Section (header: Text("Location Info")) {
                Toggle("Use my location", isOn: $locationPermission)
                TextField("Street Address", text: self.$streetAddress)
                    .disabled(locationPermission)
                TextField("City Address", text: self.$cityAddress)
                    .disabled(locationPermission)
                TextField("Country Address", text: self.$countryAddress)
                    .disabled(locationPermission)
            }
            
            Section (header: Text("Contact Info")) {
                TextField("Contact Name", text: self.$contactName)
                TextField("Contact Number", text: self.$contactNumber)
                    .keyboardType(.phonePad)
            }
            
            Button("Publish", action: publish)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Invalid Entry"),
                        message: Text(alertMessage)
                    )
                }
        }
    }//body ends
    
    private func publish() {
        
        self.validateEntry()
        
        if (locationPermission) {
            self.useMyLocation()
        }
        
        if (isEntryValid) {
            var discoveryPost = DiscoveryPost(petType: selectedPetType.rawValue, petKind: selectedPetKind, petColor: selectedPetColor, description: writtenDescription, isCollected: isCollected, streetName: streetAddress, cityName: cityAddress, countryName: countryAddress, contactName: contactName, contactNumber: contactNumber)
            
            self.savePost(discoveryPost : discoveryPost)
        }
        
        
    }
    
    private func validateEntry() {
        
        if (selectedPetColor == "") {
            isEntryValid = false
            showAlert = true
            alertMessage = "You must enter a color!"
        }
        
        if (!locationPermission) {
            if (streetAddress == "") {
                isEntryValid = false
                showAlert = true
                alertMessage = "You must enter street address!"
            }
            if (cityAddress == "") {
                isEntryValid = false
                showAlert = true
                alertMessage = "You must enter city address!"
            }
            if (countryAddress == "") {
                isEntryValid = false
                showAlert = true
                alertMessage = "You must enter country address!"
            }
        }
    }
    
    private func useMyLocation() {
        
    }
    
    private func savePost(discoveryPost: DiscoveryPost) {
        
    }
}

//struct DiscoveryAlertView_Previews: PreviewProvider {
//    static var previews: some View {
//        DiscoveryAlertView()
//    }
//}
