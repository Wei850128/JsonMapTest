//
//  ViewController.swift
//  JsonTest
//
//  Created by 劉家瑋 on 2020/8/18.
//  Copyright © 2020 劉家瑋. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var coffeeInfo:[Coffee] = []

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
    }
    
    func initData() {
        let urlString = "https://cafenomad.tw/api/v1.2/cafes/taipei"
        
        let url = URL(string: urlString)
        
        
        URLSession.shared.dataTask(with: url!) { (data, reponse, error) in
            let decorder = JSONDecoder()
            //使用JSONDecoder的方式將抓到的資料轉換成剛剛定義好的Coffee型別
            if let coffee = try?decorder.decode([Coffee].self, from: data!) {
                self.coffeeInfo = coffee
                print(self.coffeeInfo)
                DispatchQueue.main.async {
                    self.tableview.reloadData()//Tableview更新抓到的資料
                }
            }
        }.resume()
    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coffeeCell")as! CoffeeTableViewCell
        cell.name.text = coffeeInfo[indexPath.row].name
        cell.address.text = coffeeInfo[indexPath.row].address
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let dvc = segue.destination as? ShowDetailViewController {
                if let selectRow = tableview.indexPathForSelectedRow {
                    dvc.data = coffeeInfo[selectRow.row]
                }
            }
        }
    }
}

