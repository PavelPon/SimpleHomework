//
//  FolderViewModel.swift
//  Simple homework
//
//  Created by Павел Пономарёв on 05.09.2023.
//

import Foundation
class FolderViewModel:ObservableObject{
    
    @Published  var items = [
        FolderListItem(name: "1", isLink:false ),
        FolderListItem(name: "2", isLink:false ),
        FolderListItem(name: "3", isLink:false ),
        FolderListItem(name: "4", isLink:false ),
        FolderListItem(name: "5", isLink:false ),
    ]
    @Published var itemSelect:Bool = false

    func actionJumpToFolder(index:Int){
        guard index < items.count else{return}
        items[index].isLink.toggle()
    }
}
