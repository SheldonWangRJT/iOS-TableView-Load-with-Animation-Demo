//
//  TableViewController.swift
//  TableViewAnimation
//
//  Created by Shinkangsan on 2/28/17.
//  Copyright © 2017 Sheldon. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var ary = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        insertRow(ind: 0, txt: "Level 1") {
            
            self.insertRow(ind: 1, txt: "Level 2") {
                
                self.insertRow(ind: 2, txt: "Level 3") {
                    
                    self.insertRow(ind: 3, txt: "Level 4") {
                    
                        self.insertRow(ind: 4, txt: "Level 5") {
                            
                            self.insertRow(ind: 5, txt: "Level 6") {
                               
                                self.insertRow(ind: 6, txt: "Level 7") {
                                    
                                    self.insertRow(ind: 7, txt: "Level 8") {}

                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func insertRow(ind:Int,txt:String,comp:@escaping ()->Void) {
        
        let indPath = IndexPath(row: ind, section: 0)
        ary.append(txt)
        tableView.insertRows(at: [indPath], with: UITableViewRowAnimation.right)
        DispatchQueue.main.asyncAfter(deadline: .now()+0.01) {
            comp()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
