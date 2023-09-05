//
//  TrashScreen.swift
//  Simple homework
//
//  Created by Павел Пономарёв on 05.09.2023.
//

import SwiftUI

struct TrashScreen: View {
    @ObservedObject private var viewModel:TrashViewModel = .init()
    var body: some View {
        Button {
            viewModel.isShowWindow.toggle()
        } label: {
            ButtomCustomView().frame(width: 120,height: 40)
        }.sheet(isPresented: $viewModel.isShowWindow) {
            PresentTrashScreen()
        }
        
    }
}

struct TrashScreen_Previews: PreviewProvider {
    static var previews: some View {
        TrashScreen()
    }
}
