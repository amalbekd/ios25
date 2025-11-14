import UIKit

// MARK: - Custom TableView Cell
class FavoriteTableViewCell: UITableViewCell {
    
    static let identifier = "FavoriteCell"
    
    // MARK: - UI Components
    
    // Изображение (иконка или обложка)
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemBlue
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray6
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Заголовок (название фильма, книги и т.д.)
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 2
        label.textColor = .label
        // Высокий приоритет сжатия - не должен сжиматься первым
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Подзаголовок (автор, год, режиссер)
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 1
        label.textColor = .secondaryLabel
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Отзыв (почему это любимое)
    private let reviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0 // Неограниченное количество строк
        label.textColor = .secondaryLabel
        label.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    
    private func setupUI() {
        // Добавляем все элементы на contentView
        contentView.addSubview(itemImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(reviewLabel)
        
        // Настройка ячейки
        selectionStyle = .none
        backgroundColor = .systemBackground
        
        // Добавляем padding для contentView
        contentView.layoutMargins = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
    }
    
    private func setupConstraints() {
        let margins = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            // ImageView - фиксированный размер, слева сверху
            itemImageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            itemImageView.topAnchor.constraint(equalTo: margins.topAnchor),
            itemImageView.widthAnchor.constraint(equalToConstant: 70),
            itemImageView.heightAnchor.constraint(equalToConstant: 70),
            
            // Title Label - справа от изображения
            titleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: margins.topAnchor),
            
            // Subtitle Label - под заголовком
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            
            // Review Label - под подзаголовком
            reviewLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            reviewLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            reviewLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 8),
            reviewLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            
            // Минимальная высота для review label (не меньше изображения)
            reviewLabel.bottomAnchor.constraint(greaterThanOrEqualTo: itemImageView.bottomAnchor)
        ])
    }
    
    // MARK: - Configuration
    
    func configure(with item: FavoriteItem) {
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        reviewLabel.text = item.review
        
        // Устанавливаем изображение
        // Сначала пробуем загрузить из Assets
        if let image = UIImage(named: item.imageName) {
            itemImageView.image = image
            itemImageView.contentMode = .scaleAspectFill  // Заполнить без искажений
        } else if let symbolImage = UIImage(systemName: item.imageName) {
            // Если нет в Assets, пробуем SF Symbol
            itemImageView.image = symbolImage
            itemImageView.contentMode = .scaleAspectFit
        } else {
            // Placeholder на случай, если изображение не найдено
            itemImageView.image = UIImage(systemName: "photo")
            itemImageView.contentMode = .scaleAspectFit
        }
    }
    
    // Сброс ячейки перед переиспользованием
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subtitleLabel.text = nil
        reviewLabel.text = nil
        itemImageView.image = nil
    }
}
