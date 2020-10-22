//
//  MovieSearchViewController.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 22/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

protocol MovieSearchViewDelegate: AnyObject {
    func didSelect(movie: Movie)
}

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
    
    weak var coordinatorDelegate: MovieSearchViewDelegate?
    
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
        
        tableView.register(RecentlySearchedMovieTableViewCell.self)
        tableView.register(UITableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
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

extension MovieSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionViewModels[section].getRowViewModels().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionVM = sectionViewModels[indexPath.section]
        
        if let vm = sectionVM as? MovieResultSectionViewModel {
            return getSearchResultCell(viewModel: vm, indexPath: indexPath)
        } else if let vm = sectionVM as? RecentlySearchedSectionViewModel {
            return getRecentlySearchedMovieCell(viewModel: vm, indexPath: indexPath)
        }
        
        return UITableViewCell()
    }
    
    func getSearchResultCell(
        viewModel: MovieResultSectionViewModel,
        indexPath: IndexPath
    ) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeue(forIndexPath: indexPath)
        if let rowViewModel = viewModel.getRowViewModels()[indexPath.row] as? MovieResultViewModel {
            cell.textLabel?.text = rowViewModel.title
        }
        return cell
    }
    
    func getRecentlySearchedMovieCell(
        viewModel: RecentlySearchedSectionViewModel,
        indexPath: IndexPath
    ) -> RecentlySearchedMovieTableViewCell {
        let cell: RecentlySearchedMovieTableViewCell = tableView.dequeue(forIndexPath: indexPath)
        if let rowViewModel = viewModel.getRowViewModels()[indexPath.row] as? RecentlySearchedMovieViewModel {
            cell.setData(rowViewModel)
        }
        return cell
    }
}

extension MovieSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionVM = sectionViewModels[indexPath.section]
        
        if let rowViewModel = sectionVM.getRowViewModels()[indexPath.row] as? MovieResultViewModel {
            rowViewModel.didSelect?()
        }
        
        else if let rowViewModel = sectionVM.getRowViewModels()[indexPath.row] as? RecentlySearchedMovieViewModel {
            rowViewModel.didSelect?()
        }
    }
}
