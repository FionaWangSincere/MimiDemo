//
//  SecondViewController.swift
//  MimiDemo
//
//  Created by kangkang on 2017/5/10.
//  Copyright © 2017年 kangkang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{
    
    var collectionView : UICollectionView!
    let cellIdentifier = "collectionCellCollectionViewCell"
    let collectionNibName = UINib(nibName: "collectionCellCollectionViewCell", bundle: nil)
    
    var layout : UICollectionViewFlowLayout!
    
    var imageData = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "2007"
        
//        let newViewController = DetailViewController()

//        let rightBar = UIBarButtonItem(title: "Add", style: .plain, target: self, action:#selector(pushViewController))
        
//        let newViewController = DetailViewController()
//        self.navigationController?.pushViewController(newViewController, animated: true)
//
//        self.navigationItem.rightBarButtonItem = rightBar
//        self.hidesBottomBarWhenPushed = true
        
        layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 10, right: 10)
        
        self.collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(collectionNibName, forCellWithReuseIdentifier: cellIdentifier)
        self.collectionView.backgroundColor = UIColor.white
        
        
        layout.itemSize = CGSize(width: self.view.bounds.width, height: 150)
        self.layout.minimumInteritemSpacing = 2
        self.layout.minimumLineSpacing = 2
        self.layout.scrollDirection = UICollectionViewScrollDirection.vertical
        
        self.view.addSubview(collectionView)
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("ga070"){
                imageData.append(item)
            }
        }


    }
    
    func pushViewController(){
        let detailViewController = DetailViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}

extension SecondViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! collectionCellCollectionViewCell

//        cell.imageView.backgroundColor = UIColor.blue
        cell.imageView.image = UIImage(named: imageData[indexPath.row])
        return cell
    }
    
}
