//
//  TableViewController.swift
//  TableViewAnimation
//
//  Created by Shinkangsan on 2/28/17.
//  Copyright © 2017 Sheldon. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    //var ary = ["Level 1","Level 2","Level 3","Level 4","Level 5","Level 6","Level 7"]
    var ary = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //insertRowsMode2()
        insertRowsMode3()
    }
    
    
    @IBAction func redo(_ sender: Any) {
        
        ary.removeAll()
        tableView.reloadData()
        insertRowsMode3()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - second way to show table
    func insertRowsMode2() {
        
        insertRowMode2(ind: 0, str: "Level 1")
        insertRowMode2(ind: 1, str: "Level 2")
        insertRowMode2(ind: 2, str: "Level 3")
        insertRowMode2(ind: 3, str: "Level 4")
        insertRowMode2(ind: 4, str: "Level 5")
        insertRowMode2(ind: 5, str: "Level 6")
        insertRowMode2(ind: 6, str: "Level 7")
        
    }
    
    func insertRowMode2(ind:Int,str:String) {
        
        let indPath = IndexPath(row: ind, section: 0)
        ary.append(str)
        tableView.insertRows(at: [indPath], with: .right)
    }
    
    // MARK: - third way to show table
    func insertRowsMode3() {
        
        insertRowMode3(ind: 0, str: "Level 1") { 
            self.insertRowMode3(ind: 1, str: "Level 2", comp: {
                self.insertRowMode3(ind: 2, str: "Level 3", comp: {
                    self.insertRowMode3(ind: 3, str: "Level 4", comp: {
                        self.insertRowMode3(ind: 4, str: "Level 5", comp: {
                            self.insertRowMode3(ind: 5, str: "Level 6", comp: {
                                self.insertRowMode3(ind: 6, str: "Level 7", comp: {
                                    self.insertRowMode3(ind: 7, str: "Level 8", comp: {
                                        self.insertRowMode3(ind: 8, str: "Level 9", comp: {
                                            print("every row is inserted")
                                        })
                                    })
                                })
                            })
                        })
                    })
                })
            })
        }
    }
    
    func insertRowMode3(ind:Int,str:String,comp:@escaping ()->Void) {
        
        let indPath = IndexPath(row: ind, section: 0)
        ary.append(str)
        tableView.insertRows(at: [indPath], with: .right)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.02) {
            comp()
        }
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ary.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.lbl.text = ary[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
