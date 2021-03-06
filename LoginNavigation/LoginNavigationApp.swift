//
//  LoginNavigationApp.swift
//  LoginNavigation
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI
import Firebase

@main
struct LoginNavigationApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            AppNavigation().environmentObject(AuthViewModel.shared)
        }
    }
}
