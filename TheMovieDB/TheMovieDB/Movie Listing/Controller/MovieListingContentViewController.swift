//
//  MovieListingContentViewController.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

class MovieListingContentViewController: UIViewController {
    var movieList: ResponseList<Movie>
    var movieListViewModel = [MovieCardViewModeling]()
    
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
        view.addSubview(tableView)
        tableView.layoutConstraints(superView: self.view)
        tableView.register(MovieCardTableViewCell.self)
        tableView.dataSource = self
        updateViewModels(movieList: movieList.results)
    }
    
    func updateMovieList(movieList: ResponseList<Movie>) {
        self.movieList.results.append(contentsOf: movieList.results)
        updateViewModels(movieList: movieList.results)
    }
    
    func updateViewModels(movieList: [Movie]) {
        var viewModels = [MovieCardViewModeling]()
        for movie in movieList {
            let vm = MovieCardViewModel(movie: movie)
            vm.bookButtonActionHandler = {
                /// - TODO: handle book button callback
            }
            viewModels.append(vm)
        }
        movieListViewModel.append(contentsOf: viewModels)
        tableView.reloadData()
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
