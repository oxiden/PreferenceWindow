//
//  SubViewController.swift
//  PreferenceWindow
//
//  Created by oxiden on 2018/05/30.
//  Copyright © 2018年 oxiden. All rights reserved.
//

import UIKit
class SubViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var sub_menuData = [String: Any]()
    // TableView用(行数)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sub_menuData.keys.count
    }
    // TableView用(行ごとの内容)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "preference")
        cell.textLabel?.text = Array(sub_menuData)[indexPath.row].key
        return cell
    }
    // TableView用(行タップイベント)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tapped_key = Array(sub_menuData)[indexPath.row].key
        print("tap!! at \(indexPath.row) (\(tapped_key))")
        tableView.deselectRow(at: indexPath, animated: true)
        let alert = UIAlertController(title: "タップ内容", message: sub_menuData[tapped_key] as? String, preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    // TableView用(背景色)
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = UIColor.cyan // セル背景色
        tableView.backgroundColor = UIColor.cyan // データが無い行の背景色
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
