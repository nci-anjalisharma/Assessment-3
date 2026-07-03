//
//  DetailViewController.swift
//  Assessment-3
//
//  Created by ANJALI SHARMA R on 02/07/26.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    var movie: ArticleModel?
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.3)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var playButton: UIButton = {
        let button = UIButton()
        button.setTitle("▶ Play", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        
        return button
    }()
    
    private lazy var myListButton: UIButton = {
        let button = UIButton()
        button.setTitle("+ My List", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black.withAlphaComponent(0.5)
        button.layer.cornerRadius = 8
        
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        view.addSubview(blackView)
        view.addSubview(titleLabel)
        view.addSubview(playButton)
        view.addSubview(myListButton)
        
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        blackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().inset(80)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        playButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo(40)
            make.width.equalTo(80)
        }
        myListButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(playButton.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(80)
        }
    }
    
    func configure(with movie: ArticleModel){
        self.movie = movie
        
        imageView.loadImage(from: movie.thumbnailUrl)
        titleLabel.text = movie.title
    }
}
