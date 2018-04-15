//
//  TQSTimeLineViewCell.swift
//  TQSTimeLine
//
//  Created by tqs on 2018/4/15.
//  Copyright © 2018年 shuang. All rights reserved.
//

import UIKit

class TQSTimeLineViewCell: UITableViewCell {
   
   @IBOutlet weak var style: UILabel!
   @IBOutlet weak var line: UILabel!
   @IBOutlet weak var point: UILabel!
   @IBOutlet weak var btn: UIButton!
   
   override func awakeFromNib() {
      super.awakeFromNib()
      self.point.layer.masksToBounds = true
      self.point.layer.cornerRadius = 7.5
      // Initialization code
   }
   func bindModel(_ model:dataModel){
      if model.bool == "1"{
         self.line.backgroundColor = UIColor.green
         self.point.backgroundColor = UIColor.green
      }else{
         self.line.backgroundColor = UIColor.gray
         self.point.backgroundColor = UIColor.gray
      }
      
      self.style.text = model.style
   }
   override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
      
      // Configure the view for the selected state
   }
   
}

class zeroViewCell: UITableViewCell {
   @IBOutlet weak var style: UILabel!
   @IBOutlet weak var btn: UIButton!
   @IBOutlet weak var line: UILabel!
   @IBOutlet weak var point: UILabel!
   @IBOutlet weak var bgView: UIView!
   var btnBlock:((Bool,Int)->())?
   override func awakeFromNib() {
      super.awakeFromNib()
      self.point.layer.masksToBounds = true
      self.point.layer.cornerRadius = 7.5
   }
   func bindModel(_ model:dataModel){
      if model.bool == "1"{
         self.line.backgroundColor = UIColor.green
         self.point.backgroundColor = UIColor.green
      }else{
         self.line.backgroundColor = UIColor.gray
         self.point.backgroundColor = UIColor.gray
      }
      self.style.text = model.style
      
   }
   func rowHeight(onOrOffBool bool:Bool) -> CGFloat{
      if bool == false{
         return 60
      }else{
         return 150
      }
   }
   @IBAction func clickBtn(_ sender: UIButton) {
      sender.isSelected = !sender.isSelected
      self.btnBlock?(sender.isSelected,0)
      if sender.isSelected == false{
         self.bgView.isHidden = true
      }else{
         self.bgView.isHidden = false
      }
   }
   override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
   }
}

class firstViewCell: UITableViewCell {
   @IBOutlet weak var style: UILabel!
   @IBOutlet weak var btn: UIButton!
   @IBOutlet weak var line: UILabel!
   @IBOutlet weak var point: UILabel!
   var btnBlock:((Bool,Int)->())?
   override func awakeFromNib() {
      super.awakeFromNib()
      self.point.layer.masksToBounds = true
      self.point.layer.cornerRadius = 7.5
   }
   func bindModel(_ model:dataModel){
      if model.bool == "1"{
         self.line.backgroundColor = UIColor.green
         self.point.backgroundColor = UIColor.green
      }else{
         self.line.backgroundColor = UIColor.gray
         self.point.backgroundColor = UIColor.gray
      }
      
      self.style.text = model.style
   }
   func rowHeight(onOrOffBool bool:Bool) -> CGFloat{
      if bool == false{
         return 60
      }else{
         return 200
      }
   }
   @IBAction func clickBtn(_ sender: UIButton) {
      sender.isSelected = !sender.isSelected
      self.btnBlock?(sender.isSelected,1)
   }
   override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
   }
}

class  secdViewCell: UITableViewCell {
   @IBOutlet weak var style: UILabel!
   @IBOutlet weak var btn: UIButton!
   @IBOutlet weak var line: UILabel!
   @IBOutlet weak var point: UILabel!
   var btnBlock:((Bool,Int)->())?
   override func awakeFromNib() {
      super.awakeFromNib()
      self.point.layer.masksToBounds = true
      self.point.layer.cornerRadius = 7.5
   }
   func bindModel(_ model:dataModel){
      if model.bool == "1"{
         self.line.backgroundColor = UIColor.green
         self.point.backgroundColor = UIColor.green
      }else{
         self.line.backgroundColor = UIColor.gray
         self.point.backgroundColor = UIColor.gray
      }
      
      self.style.text = model.style
   }
   func rowHeight(onOrOffBool bool:Bool) -> CGFloat{
      if bool == false{
         return 60
      }else{
         return 150
      }
   }
   @IBAction func clickBtn(_ sender: UIButton) {
      sender.isSelected = !sender.isSelected
      self.btnBlock?(sender.isSelected,2)
   }
   override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
   }
}
