//
//  ViewController.swift
//  BlackSwanNews
//
//  Created by Puneet Tokhi on 11/19/21.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    private let tableview: UITableView = {
        let table = UITableView()
        table.register(StockNewsTableViewCell.self, forCellReuseIdentifier: StockNewsTableViewCell.identifier)
        return table
    }()
    
    
    let searchVC = UISearchController(searchResultsController: nil)
    
    private var articles = [Article]()
    private var viewModels = [StockNewsTableViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableview)
        tableview.delegate = self
        tableview.dataSource = self
        title = "Top US News"
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        getTopHeadlines()
        createSearchBar()
    }
    

    @IBAction func analyzeNewsButton(_ sender: UIButton) {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else{
            return
        }
        secondVC.modalPresentationStyle = .overFullScreen
        secondVC.navigationItem.title = "pop"
        secondVC.title = "pop"
        present(secondVC, animated: true)
        secondVC.title = "Market News"
    }
    
    private func getTopHeadlines(){
        APICaller.shared.getNews { [weak self] result in
            switch result{
            case .success(let articles):
                self?.articles = articles
                self?.viewModels = articles.compactMap({
                    StockNewsTableViewModel(title: $0.title,
                                            subtitle: $0.description ?? "lol",
                                            imageURL: URL(string: $0.urlToImage ?? "")
                    )
                    
                })
                
                DispatchQueue.main.async {
                    self?.tableview.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func createSearchBar(){
        navigationItem.searchController = searchVC
        searchVC.searchBar.delegate = self
    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: StockNewsTableViewCell.identifier, for: indexPath) as? StockNewsTableViewCell else{
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 150
    }
}
