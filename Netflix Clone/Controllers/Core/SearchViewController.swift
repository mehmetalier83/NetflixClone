//
//  SearchViewController.swift
//  Netflix Clone
//
//  Created by Mehmet Ali Er on 16.12.2023.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var titles: [Title] = [Title]()
    
    private let discoverTable : UITableView = {
        let table = UITableView()
        table.register(TitlesTableViewCell.self, forCellReuseIdentifier: TitlesTableViewCell.identifier)
        return table
    }()
    
    private let searchController : UISearchController = {
        let controller = UISearchController(searchResultsController: SearchResultViewController())
        controller.searchBar.placeholder = "Search for a Movie or a Tv show"
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        navigationItem.searchController = searchController
        navigationController?.navigationBar.tintColor = .white
        
        searchController.searchResultsUpdater = self
        view.addSubview(discoverTable)
        discoverTable.delegate = self
        discoverTable.dataSource = self
        fetchDiscoverMovies()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        discoverTable.frame = view.bounds
    }
    
    private func fetchDiscoverMovies() {
        APICaller.shared.getDiscoverMovies { result in
            switch result {
            case .success(let titles):
                self.titles = titles
                DispatchQueue.main.async {
                    self.discoverTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

extension SearchViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitlesTableViewCell.identifier,for: indexPath) as? TitlesTableViewCell else {
            return UITableViewCell()
        }
        let title = titles[indexPath.row]
        let model = TitleViewModel(titleName: title.original_name ?? title.original_title ?? "Unknown name", posterUrl: title.poster_path ?? "")
        cell.configure(with: model)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    
}

extension SearchViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
            
            guard let query = searchBar.text,
                  !query.trimmingCharacters(in: .whitespaces).isEmpty,
                  let resultsController = searchController.searchResultsController as? SearchResultViewController else {
                      return
        
        }
        APICaller.shared.search(with: query) { result in
             DispatchQueue.main.async {
                 switch result {
                 case .success(let titles):
                     resultsController.titles = titles
                     resultsController.searchResultCollectionView.reloadData()
                 case .failure(let error):
                     print(error.localizedDescription)
                }
            }
        }
    }
}
