//
//  HomeTabsScreens.swift
//  Simple homework
//
//  Created by Павел Пономарёв on 03.09.2023.
//

import SwiftUI

struct HomeTabsScreens: View {
    @EnvironmentObject var envViewModel:EnvironmentViewModel
    var body: some View {
        TabView(selection: $envViewModel.tabSelectin){
            ForEach(envViewModel.tabs) { item in
                item.screen
                    .tabItem{
                        Label(item.title, systemImage: item.icon)
                    }
            }
        }
    }
}

struct HomeTabsScreens_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabsScreens()
    }
}
