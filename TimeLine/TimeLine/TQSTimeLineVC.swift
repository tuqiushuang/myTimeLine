//
//  TQSTimeLineVC.swift
//  TQSTimeLine
//
//  Created by tqs on 2018/4/15.
//  Copyright © 2018年 shuang. All rights reserved.
//

import UIKit




class TQSTimeLineVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
   let sourceData = [["style":"style0","bool":"1","on":"0","onIs":"on"],
                     ["style":"style1","bool":"1","on":"100","onIs":"off"],
                     ["style":"style2","bool":"1","on":"100","onIs":"off"],
                     ["style":"style3","bool":"1","on":"1","onIs":"on"],
                     ["style":"style4","bool":"1","on":"2","onIs":"on"],
                     ["style":"style5","bool":"1","on":"100","onIs":"off"],
                     ["style":"style6","bool":"0","on":"100","onIs":"off"],
                     ["style":"style6","bool":"0","on":"100","onIs":"off"],
                     ["style":"style6","bool":"0","on":"100","onIs":"off"],
                     ["style":"style6","bool":"0","on":"100","onIs":"off"]]
   var model = [dataModel]()
   var tableView:UITableView!
   var zeroBool = false
   var firstBool = false
   var secdBool = false
   @IBOutlet var zeroCell: zeroViewCell!
   @IBOutlet var firstCell: firstViewCell!
   @IBOutlet var secdCell: secdViewCell!
   override func viewDidLoad() {
      super.viewDidLoad()
      self.view.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
      self.getDataToModel()
      
      self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
      //self.tableView.contentInsetAdjustmentBehavior = .never
      self.tableView.separatorStyle = .none
      self.tableView.backgroundColor = UIColor.white
      self.tableView.delegate = self
      self.tableView.dataSource = self
      self.tableView.tableFooterView = UIView()
      self.tableView.tableHeaderView = UIView()
      self.view.addSubview(self.tableView)
      
      
      self.tableView.register(UINib(nibName:"TQSTimeLineViewCell",bundle:nil), forCellReuseIdentifier: "TQSTimeLineViewCell")
      self.tableView.register(UINib(nibName:"zeroViewCell",bundle:nil), forCellReuseIdentifier: "zeroViewCell")
      self.tableView.register(UINib(nibName:"firstViewCell",bundle:nil), forCellReuseIdentifier: "firstViewCell")
      self.tableView.register(UINib(nibName:"secdViewCell",bundle:nil), forCellReuseIdentifier: "secdViewCell")
      
      // Do any additional setup after loading the view.
   }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      switch self.model[indexPath.row].on {
      case "0":
         zeroCell.bindModel(self.model[indexPath.row])
         zeroCell.btnBlock = { [weak self] (b,i) in
            self?.clickCellBtn(b,i: i)
         }
         return zeroCell
      case "1":
         firstCell.bindModel(self.model[indexPath.row])
         firstCell.btnBlock = { [weak self] (b,i) in
            self?.clickCellBtn(b,i: i)
         }
         return firstCell
      case "2":
         secdCell.bindModel(self.model[indexPath.row])
         secdCell.btnBlock = { [weak self] (b,i) in
            self?.clickCellBtn(b,i: i)
         }
         return secdCell
      default:
         let cell = tableView.dequeueReusableCell(withIdentifier: "TQSTimeLineViewCell", for: indexPath) as! TQSTimeLineViewCell
         cell.bindModel(self.model[indexPath.row])
         return cell
      }
   }
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return self.model.count
   }
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      switch self.model[indexPath.row].on {
      case "0":
         return zeroCell.rowHeight(onOrOffBool: self.zeroBool)
      case "1":
         return firstCell.rowHeight(onOrOffBool: self.firstBool)
      case "2":
         return secdCell.rowHeight(onOrOffBool: self.secdBool)
      default:
         return 60
      }
      
   }
   
   
   func clickCellBtn(_ b:Bool,i:Int){
      if i == 0{
         self.zeroBool = b
      }else if i == 1{
         self.firstBool = b
      }else if i == 2{
         self.secdBool = b
      }
      self.tableView.reloadData()
   }
   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
   
   
   
   
}
extension TQSTimeLineVC {
   
   fileprivate func getDataToModel(){
      for i in 0..<self.sourceData.count{
         guard let dic:[String:String] = self.sourceData[i] else{
            return
         }
         if let style = dic["style"] ,let bool = dic["bool"] ,let on = dic["on"],let onIs = dic["onIs"]{
            let m = dataModel(style: style, bool: bool, on: on, onIs:onIs)
            self.model.append(m)
         }
         
      }
      
   }
   
   
   
   
   
}
