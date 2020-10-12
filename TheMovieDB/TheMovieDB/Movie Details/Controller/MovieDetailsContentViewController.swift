//
//  MovieDetailsContentViewController.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 11/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

class MovieDetailsContentViewController: UIViewController {
    let dataContainer: MovieDetailsDataContainer
    var sectionViewModels = [SectionViewModel]()

    private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    init(dataContainer: MovieDetailsDataContainer) {
        self.dataContainer = dataContainer
        super.init(nibName: nil, bundle: nil)
        formViewModels(dataContainer: dataContainer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.layoutConstraints(superView: self.view)
    }
    
    private func formViewModels(dataContainer: MovieDetailsDataContainer) {
        var sectionViewModels = [SectionViewModel]()
        let movieViewModel = MovieDetailsSectionViewModel(movie: dataContainer.movie)
        sectionViewModels.append(movieViewModel)
        self.sectionViewModels = sectionViewModels
    }
}
