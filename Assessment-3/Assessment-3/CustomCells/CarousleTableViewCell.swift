//
//  CollectionViewContainerCell.swift
//  Assessment-3
//
//  Created by ANJALI SHARMA R on 02/07/26.
//

import UIKit

class CarousleTableViewCell: UITableViewCell {
    
    static let identifier = "CarousleTableViewCell"
    
    private let carousleData: CarousleModel?
    
    private let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        collectionView.register(CollectionViewCustomCell.self, forCellWithReuseIdentifier: CollectionViewCustomCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(articles: [CarousleModel]) {
        
    }
}

extension CarousleTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCustomCell", for: indexPath) as! CollectionViewCustomCell
        cell.configure(title: carousleData?.title ?? " ", image: carousleData?.image ?? " ")
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 150)
    }
}
