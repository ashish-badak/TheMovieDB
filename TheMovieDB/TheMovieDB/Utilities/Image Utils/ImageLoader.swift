//
//  ImageLoader.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 11/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit
import Nuke

extension UIImageView {
    func loadImage(fromURL urlString: String?) {
        guard let value = urlString, let url = URL(string: value) else {
            return
        }
        loadImage(from: url)
    }
    
    func loadImage(from url: URL) {
        Nuke.loadImage(with: url, into: self)
    }
    
    func loadImage(fromURL urlString: String?, placeholder: String) {
        guard let value = urlString, let url = URL(string: value) else {
            return
        }
        
        let imageRequest = ImageRequest(url: url)
        let imageLoadingOptions = ImageLoadingOptions(
            placeholder: UIImage(named: placeholder),
            transition: .fadeIn(duration: 0.5),
            failureImage: UIImage(named: placeholder)
        )
        Nuke.loadImage(
            with: imageRequest,
            options: imageLoadingOptions,
            into: self,
            progress: nil,
            completion: nil
        )
    }
}
