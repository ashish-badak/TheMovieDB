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
        tableView.reloadData()
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
        tableView.register(MovieDetailsBannerTableViewCell.self)
        tableView.dataSource = self
    }
    
    private func formViewModels(dataContainer: MovieDetailsDataContainer) {
        var sectionViewModels = [SectionViewModel]()
        let movieViewModel = MovieDetailsSectionViewModel(movie: dataContainer.movie)
        sectionViewModels.append(movieViewModel)
        self.sectionViewModels = sectionViewModels
    }
}

extension MovieDetailsContentViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionViewModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionViewModels[section].getRowViewModels().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = sectionViewModels[indexPath.section].getRowViewModels()[indexPath.row]
        
        if let vm = viewModel as? MovieDetailsBannerViewModelDataSource {
            return getMovieBannerCell(viewModel: vm, at: indexPath)
        }
        
        return UITableViewCell()
    }
    
    func getMovieBannerCell(viewModel: MovieDetailsBannerViewModelDataSource, at indexPath: IndexPath) -> MovieDetailsBannerTableViewCell {
        let cell: MovieDetailsBannerTableViewCell = tableView.dequeue(forIndexPath: indexPath)
        cell.setData(viewModel)

        return cell
    }
}
