//
//  FavoriteTableViewCell.swift
//  FavoritesManager
//
//  Created by Dimash Amalbek on 22.11.2025.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    static let identifier = "FavoriteTableViewCell"
    
    // MARK: - UI Elements
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = .systemGray5
        imageView.tintColor = .systemBlue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.numberOfLines = 2
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .systemGray3
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupUI() {
        contentView.addSubview(itemImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(chevronImageView)
        
        // Image View Constraints
        NSLayoutConstraint.activate([
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            itemImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            itemImageView.widthAnchor.constraint(equalToConstant: 60),
            itemImageView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        // Chevron Constraints
        NSLayoutConstraint.activate([
            chevronImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            chevronImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            chevronImageView.widthAnchor.constraint(equalToConstant: 8),
            chevronImageView.heightAnchor.constraint(equalToConstant: 14)
        ])
        
        // Title Label Constraints
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: chevronImageView.leadingAnchor, constant: -12),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        // Cell Height
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 80)
        ])
    }
    
    // MARK: - Configure
    func configure(with item: FavoriteItem) {
        titleLabel.text = item.title
        
        // Set image from SF Symbol
        if let image = UIImage(systemName: item.imageName) {
            itemImageView.image = image
            itemImageView.contentMode = .center
            
            // Configure symbol with larger size
            let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .regular)
            itemImageView.preferredSymbolConfiguration = config
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        itemImageView.image = nil
        titleLabel.text = nil
    }
}
