//
//  FolderStruct.swift
//  Simple homework
//
//  Created by Павел Пономарёв on 05.09.2023.
//

import Foundation
struct FolderListItem:Identifiable{
    var id:UUID = .init()
    var name:String
    var isLink: Bool
}
