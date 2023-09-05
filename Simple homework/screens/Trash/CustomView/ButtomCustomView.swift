//
//  ButtomCustomView.swift
//  Simple homework
//
//  Created by Павел Пономарёв on 05.09.2023.
//

import SwiftUI

struct ButtomCustomView: UIViewRepresentable{

    func makeUIView(context: Context) -> MyButtonView {
       return MyButtonView()
    }
    
    func updateUIView(_ uiView: MyButtonView, context: Context) {
        // Updates the state of the specified view with new information from SwiftUI.
    }
}
