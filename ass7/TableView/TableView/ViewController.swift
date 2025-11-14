//
//  ViewController.swift
//  TableView
//
//  Created by Dimash Amalbek on 15.11.2025.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    // MARK: - Properties
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemGroupedBackground
        return table
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        setupConstraints()
    }
    
    // MARK: - Setup Methods
    
    private func setupNavigationBar() {
        title = "My Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Настройка внешнего вида navigation bar
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        // Устанавливаем delegate и dataSource
        tableView.delegate = self
        tableView.dataSource = self
        
        // Регистрируем нашу custom cell
        tableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: FavoriteTableViewCell.identifier)
        
        // Используем автоматическую высоту ячеек
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120 // Примерная высота для оптимизации
        
        // Убираем лишние разделители
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 98, bottom: 0, right: 0)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    // Количество секций (4: Movies, Music, Books, Courses)
    func numberOfSections(in tableView: UITableView) -> Int {
        return FavoriteCategory.allCases.count
    }
    
    // Количество строк в каждой секции (по 5 элементов)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let category = FavoriteCategory(rawValue: section) else { return 0 }
        return FavoritesData.items(for: category).count
    }
    
    // Конфигурация ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Получаем переиспользуемую ячейку
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: FavoriteTableViewCell.identifier,
            for: indexPath
        ) as? FavoriteTableViewCell else {
            return UITableViewCell()
        }
        
        // Получаем данные для текущей ячейки
        guard let category = FavoriteCategory(rawValue: indexPath.section) else {
            return cell
        }
        
        let items = FavoritesData.items(for: category)
        let item = items[indexPath.row]
        
        // Конфигурируем ячейку
        cell.configure(with: item)
        
        return cell
    }
    
    // Заголовки секций
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let category = FavoriteCategory(rawValue: section) else { return nil }
        return category.title
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    // Используем автоматическую высоту
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // Высота заголовка секции (Bonus task)
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    // Custom header view (Bonus task)
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = .label
        
        if let category = FavoriteCategory(rawValue: section) {
            titleLabel.text = category.title
        }
        
        headerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
        
        return headerView
    }
    
    // Действие при нажатии на ячейку (опционально)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Здесь можно добавить navigation к детальному экрану
        guard let category = FavoriteCategory(rawValue: indexPath.section) else { return }
        let items = FavoritesData.items(for: category)
        let item = items[indexPath.row]
        
        // Показываем alert для демонстрации
        let alert = UIAlertController(
            title: item.title,
            message: item.review,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

