//
//  SearchResultViewController.swift
//  Netflix Clone
//
//  Created by Mehmet Ali Er on 13.01.2024.
//

import UIKit

class SearchResultViewController: UIViewController {
    
    public var titles: [Title] = [Title]()
    
    public let searchResultCollectionView : UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 180)
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view.addSubview(searchResultCollectionView)
        
        searchResultCollectionView.delegate = self
        searchResultCollectionView.dataSource = self
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchResultCollectionView.frame = view.bounds
    }

}
extension SearchResultViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
          return  UICollectionViewCell()
        }
        let title = titles[indexPath.row]
        cell.configure(with: title.poster_path ?? "")
        return cell
    }
    
    
    
    
}
