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
        tableView.register(MovieCreditsCollectionTableViewCell.self)
        tableView.register(SectionTitleHeaderView.self)
        tableView.tableHeaderView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: 0.0001)))
        tableView.dataSource = self
    }
    
    private func formViewModels(dataContainer: MovieDetailsDataContainer) {
        var sectionViewModels = [SectionViewModel]()
        
        let movieViewModel = MovieDetailsSectionViewModel(movie: dataContainer.movie)
        sectionViewModels.append(movieViewModel)
        
        if let credits = dataContainer.credits {
            if !credits.cast.isEmpty {
                let castSectionViewModel = CreditsSectionViewModel(type: "Cast", persons: credits.cast)
                sectionViewModels.append(castSectionViewModel)
            }
            if !credits.crew.isEmpty {
                let creditsSectionViewModel = CreditsSectionViewModel(type: "Crew", persons: credits.crew)
                sectionViewModels.append(creditsSectionViewModel)
            }
        }
        
        self.sectionViewModels = sectionViewModels
    }
}

extension MovieDetailsContentViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionViewModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionViewModel = sectionViewModels[section]
        
        if sectionViewModel is CreditsSectionViewModel {
            return 1
        }
        
        return sectionViewModel.getRowViewModels().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionViewModel = sectionViewModels[indexPath.section]
            
        if let sectionVM = sectionViewModel as? MovieDetailsSectionViewModel {
            return loadMovieDetailsSectionCell(sectionViewModel: sectionVM, at: indexPath)
        }
        
        else if let sectionVM = sectionViewModel as? CreditsSectionViewModel {
            return getCreditsSectionCell(viewModel: sectionVM, at: indexPath)
        }
        
        return UITableViewCell()
    }
    
    func loadMovieDetailsSectionCell(sectionViewModel: MovieDetailsSectionViewModel, at indexPath: IndexPath) -> UITableViewCell {
        let viewModel = sectionViewModel.getRowViewModels()[indexPath.row]
        
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
    
    func getCreditsSectionCell(viewModel: CreditsSectionViewModel, at indexPath: IndexPath) -> MovieCreditsCollectionTableViewCell {
        let cell: MovieCreditsCollectionTableViewCell = tableView.dequeue(forIndexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionViewModel = sectionViewModels[section]
        
        if let headerModel = sectionViewModel.getSectionHeaderViewModel() as? HeadingViewModel {
            return headerModel.heading
        }
        
        return nil
    }
}
