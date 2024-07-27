//
//  ViewController.swift
//  MVVMTestApp
//
//  Created by Supraja on 22/07/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let helper = MovieDatabaseHelper.shared
    
    private var movies = [MovieViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableView.dataSource = self
        movieTableView.delegate = self
        createMockMovieData()
    }
    
    func createMockMovieData() {
        let data = MovieDatabaseHelper.shared.getMovies()
        movies = data.map({ $0.viewModel })
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieDataTableViewCell.id, for: indexPath)
        if let movieDataTableViewCell = cell as? MovieDataTableViewCell {
            let movie = movies[indexPath.row]
            movieDataTableViewCell.prepareMovie(movie)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}

extension UITableView {
    func setNoDataPlaceholder(_ message: String) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        label.text = message
        label.textAlignment = .center
        label.sizeToFit()
        
        self.isScrollEnabled = false
        self.backgroundView = label
        self.separatorStyle = .none
    }
    
    func removeNoDataPlaceholder() {
        self.isScrollEnabled = true
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}


