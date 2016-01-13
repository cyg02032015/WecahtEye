//
//  EyeViewController.swift
//  BezierPath
//
//  Created by C on 16/1/6.
//  Copyright © 2016年 YoungKook. All rights reserved.
//

import UIKit
let ScreenWidth = UIScreen.mainScreen().bounds.width
let ScreenHeight = UIScreen.mainScreen().bounds.height
class EyeViewController: UIViewController {
  var v: EyeView!
  var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.blackColor()
    tableView = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight), style: .Plain)
    tableView.contentInset = UIEdgeInsets(top: -80, left: 0, bottom: 0, right: 0)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    tableView.backgroundColor = UIColor.blackColor()
    view.addSubview(tableView)
    let headerV = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 80))
    v = EyeView(frame: CGRect(x: CGRectGetWidth(headerV.frame)/2 - 25, y: 0, width: 50, height: 30))
    v.layer.addSublayer(v.eyeFirstLayer)
    v.layer.addSublayer(v.eyeSecondLayer)
    v.layer.addSublayer(v.eyeballLayer)
    v.layer.addSublayer(v.topEyeLayer)
    v.layer.addSublayer(v.bottomEyeLayer)
    v.setupDefaultValue()
    headerV.addSubview(v)
    tableView.tableHeaderView = headerV
  }
}

extension EyeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell!
    cell.textLabel?.text = "测试\(indexPath.row)"
    return cell
  }
  
  func scrollViewDidScroll(scrollView: UIScrollView) {
    v.animationWith(scrollView.contentOffset.y)
  }
}