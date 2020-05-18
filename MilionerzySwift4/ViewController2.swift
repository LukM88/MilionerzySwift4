//
//  ViewController2.swift
//  MilionerzySwift4
//
//  Created by LM88 on 12/05/2020.
//  Copyright © 2020 LM88. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var pnpButton: UIButton!
    @IBOutlet weak var crudeBtn: UIButton!
    
    @IBOutlet weak var progres: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answersList: UITableView!
    var cellReuseIdentifier = "cell"
    let data = Menager.getQuestions()
    var numbers = Array<Int>()
    var i = 0
    var gwarantowana = 0
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
        while(iterator<12){
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
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! UITableViewCell
        
        // set the text from the data model
        cell.textLabel?.text = self.data[numbers[i]].Answers[indexPath.row][data[0].Answers[indexPath.row].keys.first!.description]
        cell.textLabel?.textAlignment = NSTextAlignment.left
        cell.textLabel?.numberOfLines=3
        cell.backgroundColor=#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == data[numbers[i]].Corect && i<11){
            
            progres.progress+=0.083
            answersList.cellForRow(at: indexPath)?.backgroundColor=#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            answersList.cellForRow(at: indexPath)?.isSelected=false
            self.i+=1
            switch(i){
            case 3:
                gwarantowana=1000
                break
            case 6:
                gwarantowana=100000
                break
            case 9:
                gwarantowana=500000
                break
            default: break
               
            }
            run(after: 2){
                
                
                self.answersList.reloadData()
                
                self.questionLabel.text = self.data[self.numbers[self.i]].Question
                
            }
           
            
            
            
            
        }
        else{
            if(indexPath.row == data[numbers[i]].Corect){
                progres.progress=1
                
                questionLabel.text="!!!WYGRAŁEŚ!!!\n 1000000"
                questionLabel.textAlignment = NSTextAlignment.center
                answersList.removeFromSuperview()
                run(after: 2){
                    self.performSegue(withIdentifier: "goBack", sender: nil)
                }
            }
            else{
                answersList.cellForRow(at: indexPath)?.backgroundColor=#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
                answersList.cellForRow(at: [0,data[numbers[i]].Corect])?.backgroundColor=#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                answersList.cellForRow(at: indexPath)?.isSelected=false
                self.questionLabel.text="!!!PRZEGRAŁEŚ!!!\n dostajesz \(gwarantowana)"
                run(after: 2){
                    
                    self.performSegue(withIdentifier: "goBack", sender: nil)
                }
            }
            
            
        }
        
      
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[numbers[i]].Answers.count
    }
    
    func run(after seconds: Int,completion: @escaping () ->Void){
        let deadline = DispatchTime.now() + .seconds(seconds)
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            completion()
        }
    }
    @IBAction func polnapolClick(_ sender: Any) {
        var x = data[numbers[i]].Corect
        var y = data[numbers[i]].Corect
        while(x == data[numbers[i]].Corect || y==data[numbers[i]].Corect || x==y){
            x=Int.random(in: 0...3)
            y=Int.random(in: 0...3)
        }
        answersList.cellForRow(at: [0,x])?.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        answersList.cellForRow(at: [0,y])?.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        pnpButton.isEnabled=false
    }
    @IBAction func crudeVoting(_ sender: Any) {
        var ans = [0,0,0,0]
        var x=100
        
        ans[0]=Int.random(in: 1...x-2)
        x-=ans[0]
        ans[1]=Int.random(in: 1...x-1)
        x-=ans[1]
        ans[2]=Int.random(in: 1...x)
        x-=ans[2]
        ans[3]=x
        var temp=0
        var temp2=0
        while temp<ans.count-1 {
            if(ans[temp2]<ans[temp+1]){
                temp2=temp+1
            }
            temp+=1
        }
        temp=ans[data[numbers[i]].Corect]
        ans[data[numbers[i]].Corect]=ans[temp2]
        ans[temp2]=temp
        
        questionLabel.text="Publiczność zagłosowała:\n A:\(ans[0])%, B:\(ans[1])%, C:\(ans[2])%, D:\(ans[3])%"
        crudeBtn.isEnabled=false
    }
    
}

