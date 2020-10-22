//
//  MovieSearchViewController.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 22/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

final class MovieSearchViewController: UIViewController {
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.constrain(height: 44, width: UIScreen.main.bounds.width)
        return searchBar
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let movieIndexer: MovieIndexer
    let recentlySearchedMovies: [Movie]
    var sectionViewModels: [SectionViewModel] = []
    
    init(recentlySearchedMovies: [Movie], movieIndexer: MovieIndexer) {
        self.recentlySearchedMovies = recentlySearchedMovies
        self.movieIndexer = movieIndexer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        view.backgroundColor = .white
        configureSearchBar()
        configureTableView()
        formViewModels()
    }
    
    private func configureSearchBar() {
        view.addSubview(searchBar)
        
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        searchBar.placeholder = "Search Movie Name"
        searchBar.becomeFirstResponder()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func formViewModels() {
        let resultSectionViewModel = MovieResultSectionViewModel(movies: [])
        sectionViewModels.append(resultSectionViewModel)
        
        let recentlySearchedSectionViewModel = RecentlySearchedSectionViewModel(movies: recentlySearchedMovies)
        recentlySearchedSectionViewModel.didSelectMovie = { [weak self] (movie) in
            self?.coordinatorDelegate?.didSelect(movie: movie)
        }
        sectionViewModels.append(recentlySearchedSectionViewModel)
        tableView.reloadData()
    }
}
