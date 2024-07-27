//
//  MovieDataTableViewCell.swift
//  MVVMTestApp
//
//  Created by Supraja on 22/07/24.
//

import UIKit

class MovieDataTableViewCell: UITableViewCell {
    
    static let id = "MovieDataTableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    let downloadQueue = DispatchQueue(label: "com.image.download.queue", qos: .background)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.layer.cornerRadius = 6
        posterImageView.layer.masksToBounds = true
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
    }
    
    func prepareMovie(_ movie: MovieViewModel) {
        nameLabel.text = movie.name
        yearLabel.text = movie.year
        directorLabel.text = movie.director
        if let image = movie.poster {
            posterImageView.image = UIImage(named: image)
        }
    }
}
