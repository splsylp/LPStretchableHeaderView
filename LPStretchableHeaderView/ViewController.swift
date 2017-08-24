//
//  ViewController.swift
//  LPStretchableHeaderView
//
//  Created by Tony on 2017/8/23.
//  Copyright © 2017年 Tony. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var bgImageView: UIImageView!
    var navView: UIView!
    var stretchableView: LPStretchableHeaderView!
    
    var headerHeight: CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_WIDTH * 0.75))
        bgImageView.image = UIImage(named: "123")
        view.addSubview(bgImageView)
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = UIColor.clear
        view.addSubview(tableView)
        
        let headerView = UIView(frame: bgImageView.bounds)
        headerView.height -= 80 // 对背景图片进行一部分的遮盖（可选，，可以不遮盖。。。）
        headerHeight = headerView.height
        tableView.tableHeaderView = headerView
        
        let nameLabel = UILabel(frame: CGRect(x: 0, y: 150, width: bgImageView.width, height: 40))
        nameLabel.text = "哈哈哈😆"
        nameLabel.textAlignment = .center
        nameLabel.textColor = UIColor.white
        headerView.addSubview(nameLabel)
        
        makeNavView()
        
        stretchableView = LPStretchableHeaderView(stretchableView: bgImageView)
    }
    
    // 导航栏
    func makeNavView() {
        
        navView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 64))
        view.addSubview(navView)
        
        let titleLabel = UILabel(frame: navView.bounds)
        titleLabel.text = "导航栏标题"
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        navView.addSubview(titleLabel)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "000"
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // 导航栏设置
        let yOffset = scrollView.contentOffset.y
        if yOffset < (headerHeight - navView.height) {
            let alpha = yOffset / (headerHeight - navView.height)
            navView.backgroundColor = UIColor.RGB_COLOR(74, g: 163, b: 243, alpha: alpha)
        } else {
            navView.backgroundColor = UIColor.RGB_COLOR(74, g: 163, b: 243, alpha: 1)
        }
        
        stretchableView.scrollViewDidScroll(scrollView)
    }
    
}

