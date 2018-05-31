//
//  MainViewController.swift
//  PreferenceWindow
//
//  Created by oxiden on 2018/05/30.
//  Copyright © 2018年 oxiden. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var selectedKey = ""
    let menuData = [
        "画面": [
            "解像度": "んあ",
            "明るさ": "にゃっ",
            "色温度": "ほい"
        ],
        "サウンド": [
            "音量": "うむうむ"
        ]
    ]
    // TableView用(行数)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuData.keys.count
    }
    // TableView用(行ごとの内容)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "preference")
        cell.textLabel?.text = Array(menuData)[indexPath.row].key
        return cell
    }
    // TableView用(行タップイベント)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedKey = Array(menuData)[indexPath.row].key
        print("tap!! at \(indexPath.row)(\(selectedKey))")
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showSecondlevelView", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecondlevelView" {
            let next = segue.destination as! SubViewController
            next.sub_menuData = menuData[selectedKey]!
        }
    }
    // TableView用(背景色)
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = UIColor.yellow // セル背景色
        tableView.backgroundColor = UIColor.yellow // データが無い行の背景色
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
