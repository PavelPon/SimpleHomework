//
//  NewsListViewModel.swift
//  Simple homework
//
//  Created by Павел Пономарёв on 08.10.2023.
//

import SwiftUI
import NewsApiNetworking

class NewsListViewModel: ObservableObject {
    
    @Published var listSearchTitle:[String] = ["IOS","Android","Flutter"]
    @Published var articles:[Article] = .init()
    @Published var indexSearchPicker = 0
    private var currentPage = 1
    @Published var isProgress:Bool = false
    @Published var isFinished:Bool = false
    
    init(){
        selectPickerPage(value: 0)
    }
    
    func selectPickerPage(value:Int)  {
        currentPage = 1
        
        ArticlesAPI.everythingGet(q: listSearchTitle[value],
                                  from: "2023-10-07",
                                  sortBy: "publishedAt",
                                  language: "en",
                                  apiKey: "f88288f4bca14599a2334cadfb3d6f4b",
                                  page: currentPage
        ) { data, error in
            self.articles.removeAll()
            self.articles = data?.articles ?? []
        }
       // isScrollToTop = false
    }
    
    func selectNextPage()  {
        
        guard isProgress == false else {return}
        currentPage = currentPage + 1
        isProgress = true
        ArticlesAPI.everythingGet(q: listSearchTitle[indexSearchPicker],
                                  from: "2023-10-07",
                                  sortBy: "publishedAt",
                                  language: "en",
                                  apiKey: "f88288f4bca14599a2334cadfb3d6f4b",page: currentPage) { data, error in
            self.articles.append(contentsOf: data?.articles ?? [])
            //self.isFinished = data?.articles == nil
            self.isProgress = false
        }
    }
    
}

extension Article:Identifiable{
    public var id:String{url}
}
