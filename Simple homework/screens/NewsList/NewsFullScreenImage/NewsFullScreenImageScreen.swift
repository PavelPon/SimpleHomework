//
//  NewsFullScreenImageScreen.swift
//  Simple homework
//
//  Created by Павел Пономарёв on 10.10.2023.
//

import SwiftUI
import NavigationApp

struct NewsFullScreenImageScreen: View {
    var urlImage:String?
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Spacer()
                    NavigationPopButton(destination: .previous) {
                        Text("Close")
                            .padding()
                    }
                }
                Spacer()
            }
            
            AsyncImage(url: URL(string: urlImage ?? "")){ image in
                   image
                       .resizable()
                       .scaledToFit()
                       .clipped()
                   } placeholder: {
                       Color.gray.opacity(0.1)
                   }
        }
    }
}

struct NewsFullScreenImageScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsFullScreenImageScreen()
    }
}
