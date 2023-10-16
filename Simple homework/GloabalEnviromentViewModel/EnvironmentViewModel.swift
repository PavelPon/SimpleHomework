//
//  EnvironmentViewModel.swift
//  Simple homework
//
//  Created by Павел Пономарёв on 03.09.2023.
//

import Foundation
import SwiftUI
class EnvironmentViewModel:ObservableObject{
    //MARK: - properties
     var isJumptoList = false
     var indexSelectionList = 3
    //MARK: - binding properties
    @Published private(set) var tabs:[TabViewItem] = [
        TabViewItem(title: "Push", icon: "paperplane.fill", screen: AnyView(PushScreen())),
        TabViewItem(title: "Folder", icon: "folder.fill", screen: AnyView(FolderScreen())),
        TabViewItem(title: "Trash", icon: "trash.circle.fill", screen: AnyView(TrashScreen())),
        TabViewItem(title: "News", icon: "newspaper.fill", screen: AnyView(NewsListScreen())),
    ]
    @Published var tabSelectin:UUID = .init()
    
    //MARK: - init

    //MARK: - posts
    
    //MARK: - func
    func blockIsJumptoList(){
        isJumptoList = false
    }
    //MARK: - actions
    
    func actionToTwoScreenForLink(){
        guard tabs.count > 0 else {return}
        isJumptoList = true
        tabSelectin = tabs[1].id
    }
    func actionToTwoScreen(){
        guard tabs.count > 0 else {return}
        isJumptoList = false
        tabSelectin = tabs[1].id
    }
}
