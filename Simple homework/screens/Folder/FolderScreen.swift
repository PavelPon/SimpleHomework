//
//  FolderScreen.swift
//  Simple homework
//
//  Created by Павел Пономарёв on 05.09.2023.
//

import SwiftUI

struct FolderScreen: View {

    @ObservedObject var viewModel:FolderViewModel = .init()
    @EnvironmentObject var envViewModel:EnvironmentViewModel
    var body: some View {
        NavigationView {
            
            List($viewModel.items){ (item:Binding<FolderListItem>) in
                NavigationLink(isActive: item.isLink) {
                    Text("Folder \(item.wrappedValue.name)")
                } label: {
                    Text(item.wrappedValue.name)
                }
            }
            .navigationTitle("Folders")
            
        }.onAppear(){
            if envViewModel.isJumptoList {
                viewModel.actionJumpToFolder(index: envViewModel.indexSelectionList)
                envViewModel.blockIsJumptoList()
            }
        }
    }
}

struct FolderScreen_Previews: PreviewProvider {
    static var previews: some View {
        FolderScreen()
    }
}
