//
//  TitlesTableViewCell.swift
//  Netflix Clone
//
//  Created by Mehmet Ali Er on 7.01.2024.
//

import UIKit

class TitlesTableViewCell: UITableViewCell {
    static let identifier = "TitlesTableViewCell"
    
    private let playTitleButton: UIButton = {
          let button = UIButton()
          let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
          button.setImage(image, for: .normal)
          button.translatesAutoresizingMaskIntoConstraints = false
          button.tintColor = .white
          return button
      }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let posterImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButton)
        applyConstraints()
    }
    
 
    private func applyConstraints() {
            let titlesPosterUIImageViewConstraints = [
                posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
                posterImageView.widthAnchor.constraint(equalToConstant: 100)
            ]
            
            
            let titleLabelConstraints = [
                titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20),
                titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ]
            
            
            let playTitleButtonConstraints = [
                playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ]
            
            NSLayoutConstraint.activate(titlesPosterUIImageViewConstraints)
            NSLayoutConstraint.activate(titleLabelConstraints)
            NSLayoutConstraint.activate(playTitleButtonConstraints)
        }
        
    public func configure(with model: TitleViewModel) {

         guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterUrl)") else {
             return
         }
         posterImageView.sd_setImage(with: url, completed: nil)
         titleLabel.text = model.titleName
     }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     

 }
