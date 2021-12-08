//
//  SecondViewController.swift
//  BlackSwanNews
//
//  Created by Puneet Tokhi on 11/27/21.
//

import UIKit


class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableview: UITableView = {
        let table = UITableView()
        table.register(StockNewsTableViewCell.self, forCellReuseIdentifier: StockNewsTableViewCell.identifier)
        return table
    }()
    
    
    var market = [JSONData]()
    private var viewModels = [StockNewsTableViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Market News"
        
        view.addSubview(tableview)
        tableview.delegate = self
        tableview.dataSource = self
        
        getMarketNews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }
    
    // fetching the historical news data
    func getMarketNews(){
        APICaller.shared.getMarketNews { [weak self] result in
            switch result{
            case .success(let market):
                self?.market = market
                self?.viewModels = market.compactMap({
                    StockNewsTableViewModel(title: $0.title,
                                            subtitle: $0.subtitle,
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

    // adding the table view delgate methods to conform to table view controller protocols
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

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        guard let thirdVC = storyboard?.instantiateViewController(withIdentifier: "thirdVC") as? ThirdViewController else{
            return nil
            
        }
        
        thirdVC.modalPresentationStyle = .overFullScreen
        if (indexPath.row == 0 ){
            news_type = "amazon"
            present(thirdVC, animated: true)
        }
        else if (indexPath.row == 1 ){
            news_type = "tradewar"
            present(thirdVC, animated: true)
        }
        else if (indexPath.row == 2){
            news_type = "fedhikerates"
            present(thirdVC, animated: true)
        }
    
        else{
            return nil
        }
           // By default, allow row to be selected
           return indexPath;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 265
    }
}
