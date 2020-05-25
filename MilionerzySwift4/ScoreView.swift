//
//  ScoreView.swift
//  MilionerzySwift4
//
//  Created by LM88 on 25/05/2020.
//  Copyright © 2020 LM88. All rights reserved.
//

import UIKit

class ScoreView: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let data = try! ScoreV.getScores()
    
    var cellReuseIdentifier = "cell"
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        if(data[indexPath.row].score != 0){
            cell.textLabel?.text = " \(self.data[indexPath.row].name) with: \(self.data[indexPath.row].score)"
        }
        
        return cell
    }
    
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
