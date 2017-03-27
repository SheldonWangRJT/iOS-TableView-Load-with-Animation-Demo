//
//  TableViewController.swift
//  TableViewAnimation
//
//  Created by Shinkangsan on 2/28/17.
//  Copyright © 2017 Sheldon. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var ary = ["Level 1","Level 2","Level 3","Level 4","Level 5","Level 6","Level 7"]
    var rows = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //insertRowsMode2()
        insertRowsMode3()
    }
    
    
    @IBAction func redo(_ sender: Any) {
        //adding logic to reset rows
        rows = 0
        tableView.reloadData()
        insertRowsMode3()
    }
    
    // MARK: - second way to show table
    func insertRowsMode2() {
        //clean the code for mode 2
        //using for loop
        //in this case the rows cannot be ary.count any more
        for i in 0..<ary.count {
            insertRowMode2(ind: i, str: ary[i])
        }
        
    }
    
    func insertRowMode2(ind:Int,str:String) {
        
        let indPath = IndexPath(row: ind, section: 0)
        //update number of rows
        rows = ind + 1
        tableView.insertRows(at: [indPath], with: .right)
    }
    
    // MARK: - third way to show table
    func insertRowsMode3() {
        
        //adding logic to reset rows
        rows = 0
        //invoke the new insertRowMode3 function
        insertRowMode3(ind: 0)
    }
    
    //Changed insertRowMode3 into recursive to gain reusability
    //1. removed the second input of string
    //2. removed the completion handler
    //3. added recursive invokation
    func insertRowMode3(ind:Int) {
        let indPath = IndexPath(row: ind, section: 0)
        rows = ind + 1
        tableView.insertRows(at: [indPath], with: .right)
        
        //add condition here if ind == ary.count-1 return
        guard ind < ary.count-1 else { return }
        DispatchQueue.main.asyncAfter(deadline: .now()+0.02) {
            //invoke the function itself
            self.insertRowMode3(ind: ind+1)
        }
    }

    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //changes here compare to the video tutorial
        return rows
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
