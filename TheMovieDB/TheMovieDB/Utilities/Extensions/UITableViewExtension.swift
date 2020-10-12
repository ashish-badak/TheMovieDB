//
//  UITableViewExtension.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 08/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

extension UITableView {
    func register<Cell: UITableViewCell>(_ type: Cell.Type) {
        self.register(Cell.self, forCellReuseIdentifier: Cell.reuseIdentifier)
    }
    
    func register<Cell: UITableViewCell>(_ type: Cell.Type) where Cell: NibLoadableView {
        self.register(Cell.nib, forCellReuseIdentifier: Cell.reuseIdentifier)
    }
    
    func dequeue<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell
            else {
                fatalError("Failed to dequeue cell with reuseIdentifier: \(Cell.reuseIdentifier)")
        }
        
        return cell
    }
    
    func register<View: UITableViewHeaderFooterView>(_ type: View.Type) {
        register(View.self, forHeaderFooterViewReuseIdentifier: View.reuseIdentifier)
    }
    
    func register<View: UITableViewHeaderFooterView>(_ type: View.Type) where View: NibLoadableView {
        register(View.nib, forHeaderFooterViewReuseIdentifier: View.reuseIdentifier)
    }
    
    func dequeueReusableHeaderFooterView<View: UITableViewHeaderFooterView>(_ type: View.Type) -> View? {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: View.reuseIdentifier) as? View else {
            return nil
        }
        
        return view
    }
}
