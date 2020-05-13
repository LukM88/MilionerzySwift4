//
//  ViewController2.swift
//  MilionerzySwift4
//
//  Created by LM88 on 12/05/2020.
//  Copyright © 2020 LM88. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[numbers[i]].Answers.count
    }
    
    
    @IBOutlet weak var progres: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answersList: UITableView!
    var cellReuseIdentifier = "cell"
    let data = Menager.getQuestions()
    var numbers = Array<Int>()
    var i = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        if(numbers.count==0){
        numbers.append(Int.random(in: 0...data.count-1))
        }
        questionLabel.text = data[numbers[i]].Question
        
        self.answersList.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        answersList.delegate = self
        answersList.dataSource = self
        answersList.rowHeight = 80
        var x = Int.random(in: 0...data.count-1)
        var iterator = 0
        while(iterator<3){
            while(numbers.contains(x)){
                x = Int.random(in: 0...data.count-1)
            }
            numbers.append(x)
            x = Int.random(in: 0...data.count-1)
            iterator+=1
        }
        
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = (self.answersList.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
        
        // set the text from the data model
        cell.textLabel?.text = self.data[numbers[i]].Answers[indexPath.row][data[0].Answers[indexPath.row].keys.first!.description]
        cell.textLabel?.textAlignment = NSTextAlignment.left
        cell.textLabel?.numberOfLines=3
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == data[numbers[i]].Corect){
            if(i<11){
                progres.progress+=0.083
            }
            else{
                progres.progress=1
                self.performSegue(withIdentifier: "goBack", sender: nil)
            }
            answersList.cellForRow(at: indexPath)?.backgroundColor=#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            answersList.cellForRow(at: indexPath)?.isSelected=false
            
            
            
            
            
            
            
        }
        else{
            answersList.cellForRow(at: indexPath)?.backgroundColor=#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            answersList.cellForRow(at: [0,data[numbers[i]].Corect])?.backgroundColor=#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            answersList.cellForRow(at: indexPath)?.isSelected=false
            self.performSegue(withIdentifier: "goBack", sender: nil)
        }
        i+=1
        //TODO
      /*  var j = 0
        while(j<data[numbers[i-1]].Answers.count){
            answersList.cellForRow(at: [0,j])?.removeFromSuperview()
            j+=1
        }
        var indexPaths = [NSIndexPath]()
        for t in 0..<data[numbers[i]].Answers.count {//hardcoded 20, this should be the number of new results received
            indexPaths.append(NSIndexPath(row:  i, section: 0))
        }
        answersList.beginUpdates();
        answersList.insertRows(at: [indexPath], with: .top)
        answersList.endUpdates();
        questionLabel.text = data[numbers[i]].Question
       */
        //answersList.addSubview( self.tableView(answersList, cellForRowAt: [0,1]))
        //answersList.addSubview( self.tableView(answersList, cellForRowAt: [0,2]))
        //answersList.addSubview( self.tableView(answersList, cellForRowAt: [0,3]))
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
