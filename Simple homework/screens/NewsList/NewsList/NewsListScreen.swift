//
//  NewsListScreen.swift
//  Simple homework
//
//  Created by Павел Пономарёв on 08.10.2023.
//

import SwiftUI
import NewsApiNetworking
import NavigationApp

struct NewsListScreen: View {
    @StateObject var viewModel:NewsListViewModel = .init()
    @State var isJump = false
    var body: some View {
        NavigationStackApp {
            VStack{
                Picker("",selection: $viewModel.indexSearchPicker){
                    ForEach(viewModel.listSearchTitle.indices,id: \.self) { index  in
                        
                        Text(viewModel.listSearchTitle[index]).tag(index)
                    }
                }
                    .pickerStyle(.segmented)
                    .onChange(of: viewModel.indexSearchPicker) { newValue in
                        viewModel.selectPickerPage(value: newValue)
                    }
                

   
                ScrollViewReader { sp in
                    List($viewModel.articles){(article: Binding<Article>) in
                        NavigationPushButtonCustomAnimation(destination: NewsDetailScreen(acticle: article.wrappedValue).frame(maxWidth:.infinity,maxHeight:.infinity),content: {
                            ListArticleCell(title: article.title.wrappedValue ?? "", description: article.description.wrappedValue ?? "")
                                .listRowSeparator(.hidden)
                                .onAppear{
                                    if viewModel.articles.isLimitElements(article){
                                        viewModel.selectNextPage()
                                    }
                                }
                                .offset(x: article.isJump.wrappedValue ? 100 : 0,y: 0)
                        },isAnimate: article.isJump,animation: .easeInOut(duration: 0.5),duration: 0.5)
                    
        
                    }
                }

//                ScrollView{
//                    LazyVGrid(columns: Array(repeating: .init(), count: 2), content: {
//                        ForEach(viewModel.articles) { article in
//
//
//                            NavigationPushButton(destination:
//                                NavigationPopButton(destination: .root, content: {
//                                    Text(article.title ?? "")
//                                })) {
//                                    ListArticleCell(title: article.title ?? "", description: article.description ?? "")
//                                        .listRowSeparator(.hidden)
//                                }
//
//
//                        }
//
//                    }
//                    )
//
//                }.padding(.horizontal)
            }.frame(maxWidth: .infinity,maxHeight: .infinity)
        }
  
    }
}

struct ListArticleCell:View {
    var title:String
    var description:String
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(.gray)
            VStack{
                Text(title.isEmpty ? description:title)
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
}
struct NewsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsListScreen()
    }
}
