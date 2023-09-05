//
//  EnvironmentViewModelStruct.swift
//  Simple homework
//
//  Created by Павел Пономарёв on 03.09.2023.
//

import Foundation
import SwiftUI

struct TabViewItem:Identifiable{
    var id:UUID = .init()
    var title:String
    var icon:String
    var screen:AnyView
}
