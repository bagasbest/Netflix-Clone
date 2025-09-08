//
//  TitleTableViewCell.swift
//  Netflix Clone
//
//  Created by Bagas Pangestu on 22/08/25.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    static let identifier = "TitleTableViewCell"
    
    private lazy var playTitleButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.contentMode = .scaleToFill
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titlePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlePosterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButton)
        applyConstraint()
    }
    
    private func applyConstraint() {
        NSLayoutConstraint.activate([
                    // Poster
                    titlePosterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                    titlePosterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                    titlePosterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                    titlePosterImageView.widthAnchor.constraint(equalToConstant: 120),

                    // Play button
                    playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                    playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                    playTitleButton.widthAnchor.constraint(equalToConstant: 28),
                    playTitleButton.heightAnchor.constraint(equalTo: playTitleButton.widthAnchor),

                    // Title
                    titleLabel.leadingAnchor.constraint(equalTo: titlePosterImageView.trailingAnchor, constant: 16),
                    titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: playTitleButton.leadingAnchor, constant: -12),
                    titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                ])
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model.posterUrl)") else { return }
        titlePosterImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
