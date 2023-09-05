//
//  PresentTrashScreen.swift
//  Simple homework
//
//  Created by Павел Пономарёв on 05.09.2023.
//

import SwiftUI

struct PresentTrashScreen: View {
    @Environment(\.presentationMode) var presentaionMode
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button {
                    presentaionMode.wrappedValue.dismiss()
                } label: {
                    Text("Close")
                        .padding()
                }
            }
            Spacer()
        }


        
    }
}

struct PresentTrashScreen_Previews: PreviewProvider {
    static var previews: some View {
        PresentTrashScreen()
    }
}
