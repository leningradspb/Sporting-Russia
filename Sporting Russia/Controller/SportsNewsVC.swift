//
//  ViewController.swift
//  Sporting Russia
//
//  Created by Eduard Sinyakov on 10/9/19.
//  Copyright © 2019 Eduard Siniakov. All rights reserved.
//

import UIKit

class SportsNewsVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var searchResponse: SearchResponse? = nil
    let networkService = NetworkService()
    
    var refreshControl = UIRefreshControl()
    var jsonDescriptionText = String()
    var urlToShared = String()
    
    var dvcImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVC()
        setupRefresh()
    }

    func setupVC() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        networkService.request(urlString: urlString) { [weak self] (news) in
            switch news {
                
            case .success(let searchResponse):
                self?.searchResponse = searchResponse
				
                self?.collectionView.reloadData()

            case .failure(let error):
                print("Ошибка \(error)")
            }
        }
    }
    
    func setupRefresh() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: UIControl.Event.valueChanged)
        collectionView.addSubview(refreshControl) // not required when using UITableViewController
    }
    
    @objc func refresh(sender:AnyObject) {
           collectionView.reloadData()
            refreshControl.endRefreshing()
       }
    
 override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
}

}


// MARK: - UICollectionViewDelegate & DataSource
extension SportsNewsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResponse?.articles.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SportsNewsCell
		let news = searchResponse?.articles[indexPath.row]
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth  = 5
        cell.layer.borderColor  = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        cell.clipsToBounds      = true
        
        cell.headerText.text = news?.title
        
        guard let url = URL(string: news?.urlToImage ?? "") else { return cell }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error)
                return 
            }
            
            guard let data = data else {return}
            
            DispatchQueue.main.async {
                cell.imageView.image = UIImage(data: data)
            }
            
        }
        
        task.resume()
        
        return cell
    }
    
    
    // MARK: - collectionView didSelectItemAt indexPath
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SportsNewsCell
        let news = searchResponse?.articles[indexPath.row]
        cell.descriptionText = news?.description ?? "Description is empty 😱"
        cell.urlStringToShare = (news?.url)!
        dvcImage = cell.imageView.image ?? UIImage(named: "noImage")!
        jsonDescriptionText = cell.descriptionText
        urlToShared = cell.urlStringToShare
        print(urlToShared)
        performSegue(withIdentifier: toDescription, sender: self)
        
    }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == toDescription {
            let dvc = segue.destination as! DescriptionVC
            dvc.descriptionText = jsonDescriptionText
            dvc.descriptionImage = dvcImage
            print(urlToShared)
            dvc.urlStringToShared = urlToShared
            
        }
    }
}





// MARK: - UICollectionViewDelegateFlowLayout


extension SportsNewsVC: UICollectionViewDelegateFlowLayout {
    
    //MARK: Размер конкретной ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      //  let photo = photos[indexPath.item]
        let paddigSpace = sectionInserts.left * (itemsPerRow + 1)
        let avaliableWidth = view.frame.width - paddigSpace
        let avalibleHeight = (view.frame.height - paddigSpace) / 2
        let widthPerItem = avaliableWidth / itemsPerRow
        let height = CGFloat(avalibleHeight) * widthPerItem / CGFloat(avaliableWidth)
        
        return CGSize(width: widthPerItem, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
}

