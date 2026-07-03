//
//  PageViewCustomCell.swift
//  Assessment-3
//
//  Created by ANJALI SHARMA R on 02/07/26.
//

import UIKit
import SnapKit

class PageViewCustomCell: UITableViewCell {
    
    static let identifier = "PageViewCustomCell"
    
    var pageVC = PageViewController()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(pageVC.view)
        
        pageVC.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with movies: [ArticleModel]){
        pageVC.configure(with: movies)
    }
}
