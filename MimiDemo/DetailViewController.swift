//
//  DetailViewController.swift
//  MimiDemo
//
//  Created by babykang on 2017/5/14.
//  Copyright © 2017年 kangkang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var tableView : UITableView!
    let identifier = "DetalTableViewCell"
    let cellNib = UINib(nibName: "DetalTableViewCell", bundle: nil)
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.purple
        // Do any additional setup after loading the view.
//        tableView = UITableView()
        self.tableView = UITableView(frame: self.view.bounds)
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = 150
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
        self.tableView.register(cellNib, forCellReuseIdentifier: identifier)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! DetalTableViewCell
        cell.cellImage.backgroundColor = UIColor.yellow
        return cell
    }
}
