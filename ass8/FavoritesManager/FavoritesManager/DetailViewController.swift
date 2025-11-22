//
//  DetailViewController.swift
//  FavoritesManager
//
//  Created by Dimash Amalbek on 22.11.2025.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    // Подключите эти outlets к вашим элементам в Storyboard
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // MARK: - Properties
    var item: FavoriteItem?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureWithItem()
    }
    
    // MARK: - Setup
    private func setupUI() {
        // Настройка Navigation Bar
        navigationItem.largeTitleDisplayMode = .never
        
        // Настройка изображения
        itemImageView?.contentMode = .scaleAspectFit
        itemImageView?.clipsToBounds = true
        itemImageView?.backgroundColor = .systemGray6
        itemImageView?.layer.cornerRadius = 12
        itemImageView?.tintColor = .systemBlue
        
        // Настройка заголовка
        titleLabel?.font = .systemFont(ofSize: 28, weight: .bold)
        titleLabel?.numberOfLines = 0
        titleLabel?.textColor = .label
        
        // Настройка subtitle (будем использовать для "Description")
        subtitleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        subtitleLabel?.textColor = .label
        subtitleLabel?.text = "Description"
        
        // Настройка Review Label (будем использовать для заголовка "My Review")
        reviewLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        reviewLabel?.textColor = .label
        reviewLabel?.text = "My Review"
        
        // Настройка Description Text View
        descriptionTextView?.font = .systemFont(ofSize: 16)
        descriptionTextView?.textColor = .label
        descriptionTextView?.isEditable = false
        descriptionTextView?.isScrollEnabled = true
        descriptionTextView?.backgroundColor = .clear
        descriptionTextView?.textContainerInset = .zero
        descriptionTextView?.textContainer.lineFragmentPadding = 0
    }
    
    // MARK: - Configuration
    private func configureWithItem() {
        guard let item = item else { return }
        
        // Настройка изображения с SF Symbol
        if let image = UIImage(systemName: item.imageName) {
            itemImageView?.image = image
            
            // Увеличенный размер символа
            let config = UIImage.SymbolConfiguration(pointSize: 80, weight: .regular)
            itemImageView?.preferredSymbolConfiguration = config
        }
        
        // Настройка текстовых полей
        titleLabel?.text = item.title
        
        // В Description Text View поместим и описание и отзыв
        let fullText = """
        \(item.description)
        
        My Review:
        \(item.review)
        """
        
        descriptionTextView?.text = fullText
        
        // Альтернативный вариант с attributed string для лучшего форматирования
        configureAttributedText(description: item.description, review: item.review)
    }
    
    // MARK: - Attributed Text Configuration
    private func configureAttributedText(description: String, review: String) {
        let attributedString = NSMutableAttributedString()
        
        // Description
        let descriptionAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16),
            .foregroundColor: UIColor.secondaryLabel
        ]
        let descriptionText = NSAttributedString(string: description, attributes: descriptionAttributes)
        attributedString.append(descriptionText)
        
        // Пробел между секциями
        attributedString.append(NSAttributedString(string: "\n\n"))
        
        // Review Header
        let reviewHeaderAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20, weight: .semibold),
            .foregroundColor: UIColor.label
        ]
        let reviewHeaderText = NSAttributedString(string: "My Review\n", attributes: reviewHeaderAttributes)
        attributedString.append(reviewHeaderText)
        
        // Review Text
        let reviewAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16),
            .foregroundColor: UIColor.label
        ]
        let reviewText = NSAttributedString(string: review, attributes: reviewAttributes)
        attributedString.append(reviewText)
        
        descriptionTextView?.attributedText = attributedString
    }
}

