//
//  DisappearanceAlertView.swift
//  Lost_Pet_Alert_App
//
//  Created by Erdem Inmez on 2022-12-08.
//

import SwiftUI

struct DisappearanceAlertView: View {
    
    @EnvironmentObject var alertRepository : AlertRepository
    
    enum PetType: String, CaseIterable, Identifiable {
        case dog, cat
        var id: Self { self }
    }
    
    @State private var petType : PetType = PetType.dog
    @State private var petKind : String = ""
    @State private var petColor : String = ""
    @State private var petDescription : String = ""
    
    @State private var dspTime : Date = Date.now
    @State private var dspStreet : String = ""
    @State private var dspCity : String = ""
    @State private var dspCountry : String = ""
    
    @State private var contactName : String = ""
    @State private var contactNumber : String = ""
    
    @State private var showAlert : Bool = false
    @State private var alertMessage : String = ""
    @State private var alertTitle : String = "Invalid Entry"
    @State private var validityKey : Bool = true
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
        let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        Form {
            Section (header: Text("Pet Info")) {
                Picker("Type", selection: $petType) {
                    Text("Dog").tag(PetType.dog)
                    Text("Cat").tag(PetType.cat)
                }
                
                TextField("Kind", text: self.$petKind)
                TextField("Color", text: self.$petColor)
                TextField("Description", text: self.$petDescription)
            }
            
            Section (header: Text("Disappearance Info")) {
                DatePicker(
                        "Time",
                         selection: $dspTime,
                         in: dateRange,
                         displayedComponents: [.date, .hourAndMinute]
                )
                TextField("Street Number and Name", text: self.$dspStreet)
                TextField("City Name", text: self.$dspCity)
                TextField("Country Name", text: self.$dspCountry)
            }
            
            Section (header: Text("Contact Info")) {
                TextField("Contact Name", text: self.$contactName)
                TextField("Contact Number", text: self.$contactNumber)
                    .keyboardType(.phonePad)
            }
            
            Button("Publish", action: publish)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text(alertTitle),
                        message: Text(alertMessage)
                    )
                }
        }
        .navigationTitle("Lost Pet Alert")
        .navigationBarTitleDisplayMode(.inline)
        
        
        
    }
    
    private func publish() {
        self.validateEntry()
        
        if (validityKey) {
            let disappearanceAlert = DisappearanceAlert(petType: petType.rawValue, petKind: petKind, petColor: petColor, petDescription: petDescription, dspTime: dspTime, dspStreet: dspStreet, dspCity: dspCity, dspCountry: dspCountry, contactName: contactName, contactNumber: contactNumber)
            
            self.alertRepository.alertList.append(disappearanceAlert)
            
            print("here")
            
            self.refreshPage()
            showAlert = true
            alertTitle = "Success"
            alertMessage = "Your alert published!"
            
        }
        
    }
    
    private func validateEntry() {
        if (petKind.count < 2) {
            showAlert = true
            alertTitle = "Invalid Entry"
            alertMessage = "You should enter a valid pet kind!"
            validityKey = false
        }
        if (petColor.count < 2) {
            showAlert = true
            alertTitle = "Invalid Entry"
            alertMessage = "You should enter a valid pet color!"
            validityKey = false
        }
        if (petDescription.count < 2) {
            showAlert = true
            alertTitle = "Invalid Entry"
            alertMessage = "You should enter a valid pet description!"
            validityKey = false
        }
        if (dspStreet.count < 2) {
            showAlert = true
            alertTitle = "Invalid Entry"
            alertMessage = "You should enter a valid street info!"
            validityKey = false
        }
        if (dspCity.count < 2) {
            showAlert = true
            alertTitle = "Invalid Entry"
            alertMessage = "You should enter a valid city info!"
            validityKey = false
        }
        if (dspStreet.count < 2) {
            showAlert = true
            alertTitle = "Invalid Entry"
            alertMessage = "You should enter a valid street info!"
            validityKey = false
        }
        if (dspCountry.count < 2) {
            showAlert = true
            alertTitle = "Invalid Entry"
            alertMessage = "You should enter a valid country info!"
            validityKey = false
        }
        if (contactName.count < 2) {
            showAlert = true
            alertTitle = "Invalid Entry"
            alertMessage = "You should enter a valid contact name!"
            validityKey = false
        }
        if (contactNumber.count < 2) {
            showAlert = true
            alertTitle = "Invalid Entry"
            alertMessage = "You should enter a valid contact number!"
            validityKey = false
        }
    }
    
    private func refreshPage() {
        petType = PetType.dog
        petKind = ""
        petColor = ""
        petDescription = ""
        
        dspTime = Date.now
        dspStreet = ""
        dspCity = ""
        dspCountry = ""
        
        contactName = ""
        contactNumber = ""
        
        
        
    }
}

struct DisappearanceAlertView_Previews: PreviewProvider {
    static var previews: some View {
        DisappearanceAlertView()
    }
}
