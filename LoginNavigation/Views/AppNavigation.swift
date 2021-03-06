//
//  AppNavigation.swift
//  LoginNavigation
//
//  Created by Darrien Huntley on 3/6/21.
//

import SwiftUI
import Kingfisher

struct AppNavigation: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selectedIndex = 0
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                
                NavigationView {
                    VStack {
                        MainTabView(selectedIndex : $selectedIndex)
                    }
                    .navigationBarTitle(viewModel.tabTitle(forIndex: selectedIndex))
                    .navigationBarTitleDisplayMode(.inline)
                }
            } else {
                LoginView()
                
            }
        }
        
    }
}

struct AppNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppNavigation()
    }
}
