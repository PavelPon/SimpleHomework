//
//  NewsDetailScreen.swift
//  Simple homework
//
//  Created by Павел Пономарёв on 10.10.2023.
//

import SwiftUI
import NewsApiNetworking
import NavigationApp

struct NewsDetailScreen: View {
    var  acticle:Article
    var body: some View {
        ZStack{
            ScrollView{
                VStack(alignment: .center){
                    Text(acticle.title ?? "")
                    
                    NavigationPushButton(destination:
                                            NewsFullScreenImageScreen(urlImage: acticle.urlToImage)
                        .frame(maxWidth:.infinity,maxHeight:.infinity)
                    ) {
                        AsyncImage(url: URL(string: acticle.urlToImage ?? "")){ image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100,height: 100)
                                .clipped()
                        } placeholder: {
                            Color.gray.opacity(0.1)
                        }
                        
                        
                    } .frame(width: 100,height: 100)
                    
                    Text(acticle.content ?? "")
                }
                .padding()
            }
            
            VStack{
                
                Spacer()
                
                HStack{
                    NavigationPopButton(destination: .previous) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.blue)
                                .frame(width: 45, height: 45)
                            Image(systemName: "arrow.backward")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                                .padding()
                            
                            
                            
                        }
                    }
                    Spacer()
                }
                
            }.padding()
        }
    }
}

