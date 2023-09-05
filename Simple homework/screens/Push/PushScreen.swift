//
//  PushScreen.swift
//  Simple homework
//
//  Created by Павел Пономарёв on 05.09.2023.
//

import SwiftUI

struct PushScreen: View {
    @EnvironmentObject var envViewModel:EnvironmentViewModel
    var body: some View {
        Button {
            envViewModel.actionToTwoScreenForLink()
        } label: {
            Text("Перейти в Folder")
        }
    }
}

struct PushScreen_Previews: PreviewProvider {
    static var previews: some View {
        PushScreen()
    }
}
