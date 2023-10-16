//
//  File.swift
//  
//
//  Created by Павел Пономарёв on 11.10.2023.
//

import Foundation
import SwiftUI

public extension AnyTransition{
    
    static var moveToFade:AnyTransition{
        let insertion = AnyTransition.move(edge: .trailing).combined(with: .opacity)
        let removal = AnyTransition.move(edge: .leading).combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
