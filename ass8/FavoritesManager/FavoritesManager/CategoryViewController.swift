//
//  CategoryViewController.swift
//  FavoritesManager
//
//  Created by Dimash Amalbek on 22.11.2025.
//

import UIKit

class CategoryViewController: UITableViewController {
    
    // MARK: - Properties
    var items: [FavoriteItem] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Настройка внешнего вида
        tableView.rowHeight = 80
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 92, bottom: 0, right: 0)
        
        // Регистрация кастомной ячейки (если не используете Storyboard Prototype)
        // tableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: FavoriteTableViewCell.identifier)
        
        // Настройка Navigation Bar
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: FavoriteTableViewCell.identifier,
            for: indexPath
        ) as? FavoriteTableViewCell else {
            return UITableViewCell()
        }
        
        let item = items[indexPath.row]
        cell.configure(with: item)
        
        return cell
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Переход к детальному экрану через Segue
        performSegue(withIdentifier: "showDetail", sender: items[indexPath.row])
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let detailVC = segue.destination as? DetailViewController,
               let item = sender as? FavoriteItem {
                detailVC.item = item
            }
        }
    }
}

// MARK: - Specific Category ViewControllers

class MoviesViewController: CategoryViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        items = SampleData.movies
    }
}

class MusicViewController: CategoryViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Music"
        items = SampleData.music
    }
}

class BooksViewController: CategoryViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Books"
        items = SampleData.books
    }
}

class CoursesViewController: CategoryViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Courses"
        items = SampleData.courses
    }
}
