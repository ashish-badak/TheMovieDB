//
//  MovieListingContentViewController.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

protocol MovieListingContentDelegate: AnyObject {
    func didSelect(movie: Movie)
    func loadMore()
    func showSearchScreen()
}

class MovieListingContentViewController: UIViewController {
    var movieList: ResponseList<Movie>
    var movieListViewModel = [MovieCardViewModeling]()
    
    weak var coordinatorDelegate: MovieListingContentDelegate?
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.constrain(height: 44, width: UIScreen.main.bounds.width)
        return searchBar
    }()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    init(movieList: ResponseList<Movie>) {
        self.movieList = movieList
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBar()
        configureTableView()
        updateViewModels(movieList: movieList.results)
    }
    
    private func configureSearchBar() {
        view.addSubview(searchBar)
        
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        searchBar.placeholder = "Search Movie Name"
        searchBar.delegate = self
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        tableView.register(MovieCardTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func updateMovieList(movieList: ResponseList<Movie>) {
        self.movieList.results.append(contentsOf: movieList.results)
        self.movieList.page = movieList.page
        updateViewModels(movieList: movieList.results)
    }
    
    func updateViewModels(movieList: [Movie]) {
        var viewModels = [MovieCardViewModeling]()
        for movie in movieList {
            let vm = MovieCardViewModel(movie: movie)
            vm.bookButtonActionHandler = { [weak self, movie] in
                self?.coordinatorDelegate?.didSelect(movie: movie)
            }
            viewModels.append(vm)
        }
        movieListViewModel.append(contentsOf: viewModels)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension MovieListingContentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieCardTableViewCell = tableView.dequeue(forIndexPath: indexPath)
        cell.setData(movieListViewModel[indexPath.row])
        return cell
    }
}

extension MovieListingContentViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let numberOfRows = tableView.numberOfRows(inSection: indexPath.section)
        
        if indexPath.row == numberOfRows - 1, movieList.page < movieList.totalPages {
            self.coordinatorDelegate?.loadMore()
        }
    }
}

extension MovieListingContentViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        coordinatorDelegate?.showSearchScreen()
    }
}
