//
//  SearchView.swift
//  Lost_Pet_Alert_App
//
//  Created by Erdem Inmez on 2022-12-09.
//

import SwiftUI

struct SearchView: View {
    @State private var selection : Int? = nil
    @State private var cityName : String = ""
    @State private var countryName : String = ""
    @State private var searchKeys : [String] = ["",""]
    var body: some View {
        NavigationLink(destination: DisappearanceListView(searchKeys: self.searchKeys), tag: 1, selection: self.$selection){}
        
        VStack(alignment: .center,spacing: 20) {
            Spacer()
            TextField("City Name", text: self.$cityName)
                .disableAutocorrection(true)
                .font(.title2)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.green, lineWidth: 2)
                )
            TextField("Country Name", text: self.$countryName)
                .disableAutocorrection(true)
                .font(.title2)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.green, lineWidth: 2)
                )
            Button("Search", action: search)
                .font(.headline.bold())
                .foregroundColor(.white)
                .frame(height: 40)
                .frame(width: 100)
                .background(Color.green)
                .cornerRadius(10)
                
            Spacer()
        }
        .padding(10)
        .navigationBarTitle("Alert Search", displayMode: .inline)
    }
    
    private func search() {
        searchKeys[0] = cityName
        searchKeys[1] = countryName
        self.selection = 1
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
