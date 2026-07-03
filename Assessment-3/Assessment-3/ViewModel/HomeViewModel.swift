//
//  HomeViewModel.swift
//  Assessment-3
//
//  Created by ANJALI SHARMA R on 02/07/26.
//


import Foundation
import UIKit

class HomeViewModel {
    
    private(set) var allData: [ArticleModel] = []
    
    var didUpdateData: (() -> Void)?
    
    var didReceiveError: ((String) -> Void)?

    
    func fetchAllData() {

        APIManager.shared.fetchData(urlString: "https://jsonplaceholder.typicode.com/photos") { result in
            
            switch result {
            
            case .success(let data):
                
                print("Fetched:", data.count)
                self.allData = data
                DispatchQueue.main.async {
                    self.didUpdateData?()
                }
            
            case .failure(let error):
                DispatchQueue.main.async {
                    self.didReceiveError?(error.localizedDescription)
                }
            }
            
        }
    }

    var pageViewMovies: [ArticleModel] {
        Array(allData.prefix(5))
    }
    
    var collectionView1: [ArticleModel] {
        Array(allData.dropFirst(5).prefix(10))
    }
    var collectionView2: [ArticleModel] {
        Array(allData.dropFirst(15).prefix(10))
    }
    
    var collectionView3: [ArticleModel] {
        Array(allData.dropFirst(25).prefix(10))
    }
    
}

        
       
