//
//  ViewController.swift
//  Task01
//
//  Created by Shahid Practice on 30/07/2022.
//

import UIKit
class ViewController: UIViewController {
@IBOutlet weak var tableView: UITableView!

private var viewModel = MovieViewModel()

override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    loadPopularMoviesData()
}

private func loadPopularMoviesData() {
    viewModel.fetchPopularMoviesData { [weak self] in
        self?.tableView.dataSource = self as! UITableViewDataSource
        self?.tableView.reloadData()
    }
}
}

// MARK: - TableView
extension ViewController: UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsInSection(section: section)
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
    
    let movie = viewModel.cellForRowAt(indexPath: indexPath)
    cell.setCellWithValuesOf(movie)
    
    return cell
}
}
