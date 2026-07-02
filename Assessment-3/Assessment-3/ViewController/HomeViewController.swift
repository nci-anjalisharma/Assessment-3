//
//  HomeViewController.swift
//  Assessment-3
//
//  Created by ANJALI SHARMA R on 02/07/26.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeViewModel = HomeViewModel()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(CarousleTableViewCell.self, forCellReuseIdentifier: CarousleTableViewCell.identifier)
        
    }
    
    func fetchData() {
        
        homeViewModel.didUpdateData = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        homeViewModel.fetchAllData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CarousleTableViewCell.identifier, for: indexPath) as! CarousleTableViewCell
            cell.configure(articles: homeViewModel.pageArticles)
            return cell
            
        } else if indexPath.section == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: CarousleTableViewCell.identifier, for: indexPath) as! CarousleTableViewCell
            cell.configure(articles: homeViewModel.collectionViewData1Articles)
            return cell
            
        } else if indexPath.section == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CarousleTableViewCell.identifier, for: indexPath) as! CarousleTableViewCell
            cell.configure(articles: homeViewModel.collectionViewData2Articles)
            return cell
            
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CarousleTableViewCell.identifier, for: indexPath) as! CarousleTableViewCell
            cell.configure(articles: homeViewModel.collectionViewData3Articles)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
