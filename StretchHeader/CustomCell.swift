//
//  CustomCell.swift
//  StretchHeader
//
//  Created by Frank Chen on 2019-06-11.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
  
  let categoryLabel :UILabel = {
    let label = UILabel()
    label.text = "Category"
    label.numberOfLines = 0
    label.font = UIFont.boldSystemFont(ofSize: 20)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let headerlineLabel:UILabel = {
    let label = UILabel()
    label.text = "Headline"
    label.textColor = .red
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 14)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.addSubview(categoryLabel)
    self.addSubview(headerlineLabel)
    
    NSLayoutConstraint.activate([
      categoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
      categoryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
      categoryLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
      categoryLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
      
      headerlineLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
      headerlineLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
      headerlineLabel.topAnchor.constraint(equalTo: self.categoryLabel.bottomAnchor, constant: 4),
      headerlineLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
      headerlineLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16)
      ])
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
