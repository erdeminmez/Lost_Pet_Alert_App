//
//  Lost_Pet_Alert_AppApp.swift
//  Lost_Pet_Alert_App
//
//  Created by Erdem Inmez on 2022-12-08.
//

import SwiftUI

@main
struct Lost_Pet_Alert_AppApp: App {
    
    let alertRepository = AlertRepository()
    
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(alertRepository)
        }
    }
}
