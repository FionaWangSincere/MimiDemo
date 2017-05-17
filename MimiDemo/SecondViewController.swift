//
//  SecondViewController.swift
//  MimiDemo
//
//  Created by kangkang on 2017/5/10.
//  Copyright © 2017年 kangkang. All rights reserved.
//

import UIKit
import SQLite

class SecondViewController: UIViewController{
    
    var collectionView : UICollectionView!
    let cellIdentifier = "collectionCellCollectionViewCell"
    let collectionNibName = UINib(nibName: "collectionCellCollectionViewCell", bundle: nil)
    
    var layout : UICollectionViewFlowLayout!
    
    var imageData = [String]()
    var selected = [String]()
    var db : Connection! = nil
    let users = Table("users")
    let id = Expression<Int64>("id")
    let name = Expression<String>("name")

    
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
        
        //sqlite
        
        do {
            db = try Connection(NSHomeDirectory()+"/Documents/db.sqlite3")
            try db.run(users.create{
                t in
                t.column(id, primaryKey: true)
                t.column(name)
            })
        }catch{
            print("NO DB")
        }

    }
    
    func pushViewController(){
        let detailViewController = DetailViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
//    func selectedThecell(cell: UITableViewCell, with indexpath: NSIndexPath){
//       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for:indexpath as IndexPath) as! collectionCellCollectionViewCell
//        
//        
//    }
    
    
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
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath){
            let string = cell.description
            let row = indexPath.row
            print("#### sender the cell id \(row)")
            do {
                for user in try db.prepare(users){
                    print("id = \(user[id]), name = \(user[name])")
                    print("cell description = \(string)")
                }
                
            }catch{
                print("do not selete row")
            }
            
        }
        collectionView.deselectItem(at: indexPath, animated: true)
        
    }
    
}
