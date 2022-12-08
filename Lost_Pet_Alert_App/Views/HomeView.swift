//
//  HomeView.swift
//  Lost_Pet_Alert_App
//
//  Created by Erdem Inmez on 2022-12-08.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selection : Int? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                
                NavigationLink(destination: DiscoveryAlertView(), tag : 1, selection: self.$selection ){}
                
                NavigationLink(destination: DisappearanceAlertView(), tag : 2, selection: self.$selection ){}
                
                NavigationLink(destination: DiscoveryListView(), tag : 3, selection: self.$selection ){}
                
                NavigationLink(destination: DisappearanceListView(), tag : 4, selection: self.$selection ){}
                
                VStack {
                    
                    Button(action: {
                        self.alertDiscovery()
                    }){
                        Text("Discovery Alert")
                    }
                    .padding()
                    
                    Button(action: {
                        self.alertDisappearance()
                    }){
                        Text("Disappearance Alert")
                    }
                    .padding()
                    
                    Button(action: {
                        self.showDiscoveryList()
                    }){
                        Text("Show Discoveries")
                    }
                    .padding()
                    
                    Button(action: {
                        self.showDisappearanceList()
                    }){
                        Text("Show Disappearances")
                    }
                    .padding()
                    
                }//VStack ends
                .padding()
                .buttonStyle(.bordered)
                
            }//ZStack ends
        }//NavigationView ends
    }//body ends
    
    // Alert a discovery
    private func alertDiscovery() {
        self.selection = 1
    }
    
    // Alert a disappearance
    private func alertDisappearance() {
        self.selection = 2
    }
    
    // Show the list of discoveries
    private func showDiscoveryList() {
        self.selection = 3
    }
    
    // Show the list of disappearances
    private func showDisappearanceList() {
        self.selection = 4
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
