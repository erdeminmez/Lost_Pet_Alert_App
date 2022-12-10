//
//  AlertRepository.swift
//  Lost_Pet_Alert_App
//
//  Created by Erdem Inmez on 2022-12-09.
//

import Foundation

class AlertRepository : ObservableObject {
    @Published var alertList : [DisappearanceAlert]
    
    init() {
        self.alertList = []
    }
}
