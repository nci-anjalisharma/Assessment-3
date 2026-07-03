//
//  HomeViewController.swift
//  Assessment-3
//
//  Created by ANJALI SHARMA R on 02/07/26.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private var homeViewModel = HomeViewModel()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private let refreshControl = UIRefreshControl()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        
        return activityIndicator
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "NETFLIX"
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(CarousleTableViewCell.self, forCellReuseIdentifier: CarousleTableViewCell.identifier)
        tableView.register(PageViewCustomCell.self, forCellReuseIdentifier: PageViewCustomCell.identifier)
        
        setupTableView()
        setupActivityIndicator()
        setupRefreshControl()
        
        fetchData()
    }
    
    private func setupActivityIndicator(){
        view.addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func setupRefreshControl(){
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        tableView.refreshControl = refreshControl
    }
    
    @objc private func refreshData(){
        fetchData()
    }
    
    func fetchData() {
        
        homeViewModel.didUpdateData = { [weak self] in
            guard let self = self else { return }
            
            self.activityIndicator.stopAnimating()
            self.refreshControl.endRefreshing()
            self.tableView.reloadData()
        }
        homeViewModel.didReceiveError = { [weak self] message in
            guard let self = self else { return }
            
            self.activityIndicator.stopAnimating()
            self.refreshControl.endRefreshing()
            self.showErrorAlert(message: message)
        }
        homeViewModel.fetchAllData()
    }
    private func showErrorAlert(message: String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        let retry = UIAlertAction(title: "Retry", style: .default) { [weak self] _ in
                self?.fetchData()
            }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(retry)
        alert.addAction(cancel)
        
        present(alert, animated: true)
            
        }
    
    private func setupTableView(){
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
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
            let cell = tableView.dequeueReusableCell(withIdentifier: PageViewCustomCell.identifier, for: indexPath) as! PageViewCustomCell
            cell.configure(with: homeViewModel.pageViewMovies)
            return cell
            
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CarousleTableViewCell.identifier, for: indexPath) as! CarousleTableViewCell

        switch indexPath.section {
            
        case 1:
            cell.configure(articles: homeViewModel.collectionView1)

        case 2:
            cell.configure(articles: homeViewModel.collectionView2)

        case 3:
            cell.configure(articles: homeViewModel.collectionView3)

        default:
            break
        }

        cell.didSelectMovie = { [weak self] movie in
            let vc = DetailViewController()
            vc.configure(with: movie)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Popular Movies"
            
        case 2:
            return "Top Rated Movies"
            
        case 3:
            return "Latest News"
            
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        if indexPath.section == 0 {
            return 300
        }

        return 350
    }
}
