//
//  PageViewTableController.swift
//  IntroDemo
//
//  Created by Alex Truong on 4/17/17.
//  Copyright © 2017 Alex Truong. All rights reserved.
//

import UIKit

class PageViewTableController: UITableViewController {
    
    var pages = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "PageViewCell", bundle: nil), forCellReuseIdentifier: "PageViewCell")
        tableView.register(UINib(nibName: "NormalCell", bundle: nil), forCellReuseIdentifier: "NormalCell")
        
        // setup pages
        pages = [UIViewController]()
        for index in 0..<5 {
            let cellViewController = CellViewController(nibName: "CellViewController")
            cellViewController.image = UIImage(named: "C\(index)")
            pages.append(cellViewController)
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
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PageViewCell", for: indexPath)

            // Configure the cell...
            
            if let pageViewCell = cell as? PageViewCell {
                pageViewCell.pages = self.pages
                pageViewCell.startPageView()
            }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NormalCell", for: indexPath)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 4 {
            return 128
        } else {
            return 30
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
