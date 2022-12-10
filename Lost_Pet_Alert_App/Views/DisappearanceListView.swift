//
//  DisappearanceListView.swift
//  Lost_Pet_Alert_App
//
//  Created by Erdem Inmez on 2022-12-08.
//

import SwiftUI

struct DisappearanceListView: View {
    @EnvironmentObject var alertRepository : AlertRepository
    
    var body: some View {
        List(alertRepository.alertList) { alert in
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Pet Info").fontWeight(.bold).font(.title2)
                    Text(alert.petType.capitalized)
                    Text(alert.petKind)
                    Text(alert.petColor)
                    Text(alert.petDescription)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray, lineWidth: 4)
                    )
                VStack(alignment: .leading) {
                    Text("Disappearance Info").fontWeight(.bold).font(.title2)
                    Text(alert.dspTime.formatted())
                    Text(alert.dspStreet)
                    Text(alert.dspCity)
                    Text(alert.dspCountry)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray, lineWidth: 4)
                    )
                VStack(alignment: .leading) {
                    Text("Contact Info").fontWeight(.bold).font(.title2)
                    Text(alert.contactName)
                    Text(alert.contactNumber)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray, lineWidth: 4)
                    )
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.black, lineWidth: 4)
                )
        }
        
    }
}

struct DisappearanceListView_Previews: PreviewProvider {
    static var previews: some View {
        DisappearanceListView()
    }
}
