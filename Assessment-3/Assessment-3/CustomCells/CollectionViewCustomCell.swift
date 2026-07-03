//
//  CollectionViewCustomCell.swift
//  Assessment-3
//
//  Created by ANJALI SHARMA R on 02/07/26.
//

import UIKit
import SnapKit

class CollectionViewCustomCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCustomCell"
    
    var movie: ArticleModel?
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .white
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    private func setupLayout() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(5)
            make.bottom.equalToSuperview().inset(4)
        }
    }
    
    func configure(with movie: ArticleModel){
        self.movie = movie
        
        titleLabel.text = movie.title
        imageView.loadImage(from: movie.thumbnailUrl)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
