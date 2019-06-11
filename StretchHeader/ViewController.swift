//
//  ViewController.swift
//  StretchHeader
//
//  Created by Frank Chen on 2019-06-11.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var content = [NewsItem]()
  let kTableHeaderHeight:CGFloat = 200
  var heightConstraint:NSLayoutConstraint!
  
  let tableView : UITableView = {
    let tb = UITableView(frame:CGRect.zero)
    tb.translatesAutoresizingMaskIntoConstraints = false
    tb.register(CustomCell.self, forCellReuseIdentifier: "customCell")
    tb.rowHeight = UITableView.automaticDimension
    tb.estimatedRowHeight = UITableView.automaticDimension
    return tb
  }()

  let headerView:UIView = {
    let uv = UIView(frame: CGRect.zero)
    uv.clipsToBounds = true
    uv.translatesAutoresizingMaskIntoConstraints = false
//    uv.frame.size.height = 200
    return uv
  }()
  
  let imageViewInHeader:UIImageView = {
    let iv = UIImageView()
    iv.translatesAutoresizingMaskIntoConstraints = false
    iv.contentMode = .scaleAspectFill
    iv.image = UIImage(named: "bg-header")
    return iv
  }()
  
  let labelInHeader:UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM d, yyyy"
    let result = formatter.string(from: date)
    label.text = result
    label.textColor = .white
    label.font = UIFont.boldSystemFont(ofSize: 14)
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViews()
    setupContent()
  }
  
  override var prefersStatusBarHidden: Bool{
    return true
  }
  
  func setupContent(){
    let item1 = NewsItem.init(category: categories.World.rawValue, headline: "Climate change protests, divestments meet fossil fuels realities")
    let item2 = NewsItem.init(category: categories.Europe.rawValue, headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'")
    let item3 = NewsItem.init(category: categories.MiddleEast.rawValue, headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible")
    let item4 = NewsItem.init(category: categories.Africa.rawValue, headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim")
    let item5 = NewsItem.init(category: categories.Asia.rawValue, headline: "Despite UN ruling, Japan seeks backing for whale hunting")
    let item6 = NewsItem.init(category: categories.Americas.rawValue, headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria")
    let item7 = NewsItem.init(category: categories.World.rawValue, headline: "South Africa in $40 billion deal for Russian nuclear reactors")
    let item8 = NewsItem.init(category: categories.Europe.rawValue, headline: "'One million babies' created by EU student exchanges")
    content += [item1,item2,item3,item4,item5,item6,item7,item8]
  }
  
  func setupViews(){
    self.view.addSubview(tableView)
    headerView.addSubview(imageViewInHeader)
    headerView.addSubview(labelInHeader)
    tableView.delegate = self
    tableView.dataSource = self
    //tableView.tableHeaderView = headerView
    tableView.addSubview(headerView)
    tableView.contentInset.top = kTableHeaderHeight
    heightConstraint = headerView.heightAnchor.constraint(equalToConstant: kTableHeaderHeight)
    
    NSLayoutConstraint.activate([
      tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
      
      imageViewInHeader.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor),
      imageViewInHeader.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor),
      imageViewInHeader.topAnchor.constraint(equalTo: self.headerView.topAnchor),
      imageViewInHeader.bottomAnchor.constraint(equalTo: self.headerView.bottomAnchor),
      
      labelInHeader.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor),
      labelInHeader.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor),
      labelInHeader.topAnchor.constraint(equalTo: self.headerView.topAnchor),
      labelInHeader.heightAnchor.constraint(equalToConstant: 20),
      
      headerView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
      headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
      heightConstraint
      
      ])
  }
  
  func updateHeaderView(){
    if abs(tableView.contentOffset.y) > kTableHeaderHeight{
      let newHeight = abs(tableView.contentOffset.y)
      heightConstraint.constant = newHeight
    }
  }
}

extension ViewController:UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return content.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
    let newsItem = content[indexPath.row]
    cell.categoryLabel.text = newsItem.category
    cell.headerlineLabel.text =  newsItem.headline
    
    switch cell.categoryLabel.text{
    case categories.World.rawValue:
      cell.categoryLabel.textColor = .red
    case categories.Americas.rawValue:
      cell.categoryLabel.textColor = .blue
    case categories.Europe.rawValue:
      cell.categoryLabel.textColor = .green
    case categories.MiddleEast.rawValue:
      cell.categoryLabel.textColor = .yellow
    case categories.Africa.rawValue:
      cell.categoryLabel.textColor = .orange
    case categories.Asia.rawValue:
      cell.categoryLabel.textColor = .purple
    default:
      cell.categoryLabel.textColor = .black
    }

    return cell
  }

}

extension ViewController:UITableViewDelegate{
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    updateHeaderView()
  }
}
