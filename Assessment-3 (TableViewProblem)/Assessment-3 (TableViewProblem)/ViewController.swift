//
//  ViewController.swift
//  Assessment-3 (TableViewProblem)
//
//  Created by ANJALI SHARMA R on 02/07/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var list: [String] = ["Apple", "Banana", "Custard", "PineApple", "Grapes", "Plum", "Orange", "Kiwi", "Strawberry", "Mango", "PineApple", "Grapes", "Plum", "Orange", "Kiwi", "Strawberry", "Mango"]
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Item"
        return label
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
        return button
    }()
    
    @objc func didTapAdd() {
        list.append("Title \(list.count + 1)")
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        view.addSubview(addButton)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.leading.trailing.equalToSuperview().inset(60)
            make.height.equalTo(50)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height {
            addButton.isHidden = true
        } else {
            addButton.isHidden = false
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


