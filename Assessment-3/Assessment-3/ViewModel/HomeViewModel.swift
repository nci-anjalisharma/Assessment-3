//
//  HomeViewModel.swift
//  Assessment-3
//
//  Created by ANJALI SHARMA R on 02/07/26.
//


import Foundation
import UIKit

class HomeViewModel {
    
    var allData: [ArticleModel] = []
    
    let pageViewData: PageModel?
    
    var didUpdateData: (() -> Void)?
    
    let collectionViewData1: CarousleModel?
    let collectionViewData2: CarousleModel?
    let collectionViewData3: CarousleModel?
//    
//    var pageArticles: [PageModel] {
//        let filteredArticles = allData.map {
//            $0.id <= 10
//        }
////        return filteredArticles
//    }
    
//    var collectionViewData1Articles: [ArticleModel] {
//        allData.map {
//            $0.id > 10 && <= 20 ? $0 : nil
//        }
//    }
//    
//    var collectionViewData2Articles: [ArticleModel] {
//        allData.filter {
//            $0.id > 20 && <=30
//        }
//    }
//    
//    var collectionViewData3Articles: [ArticleModel] {
//        allData.map {
//            $0.id > 30 && <=40 ? $0 : nil
//        }
//    }
    
    func fetchAllData() {

        APIManager.shared.fetchData(urlString: "https://jsonplaceholder.typicode.com/photos") { result in
            
            switch result {
            
            case .success(let data):
                self.allData = data
                self.didUpdateData!()
            
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
}

        
       
