//
//  UIImageExtension.swift
//  Foodkart
//
//  Created by Amardeep Bikkad on 20/10/23.
//

import Foundation
import UIKit

extension UIImageView {
    func getImageFromUrl(from urlString: String, contentMode mode: ContentMode = .scaleAspectFit) {
        var url = URL(string: urlString)!
        contentMode = .scaleToFill
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data) else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
}
