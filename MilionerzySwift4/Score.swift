//
//  Score.swift
//  MilionerzySwift4
//
//  Created by LM88 on 24/05/2020.
//  Copyright © 2020 LM88. All rights reserved.
//

import Foundation
class ScoreV{
    struct Score : Decodable{
    var name: String
    var score: Int
}
    static func getScores()throws -> [Score]{
        var scores :[Score] = [Score.init(name: "You", score: 0)]
        let file="topScore"
        let documentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = documentDirURL.appendingPathComponent(file).appendingPathExtension("txt")
        var readString = ""
        do{
            readString = try String(contentsOf: fileURL)
        }catch let e as NSError{
        print(e)
        }
        var read = readString.components(separatedBy: .newlines)
        
        
        var i = 0
        var j = 0
        if(read.count>1){
            while( j<read.count-2){
                let miniJSON =
                """
                {
                "name": "\(read[0+j])",
                "score": \(read[1+j])
                }
                """
                var scoreData = Data(miniJSON.data(using: .utf8)!)
                do{
                    if(i==0){
                        scores[i] = try! JSONDecoder().decode(Score.self, from: scoreData)
                    }
                    else{
                        scores.append( try! JSONDecoder().decode(Score.self, from: scoreData))
                    }
                    
                }catch let error as NSError{
                    print(error.localizedDescription)
                }
                i+=1
                j+=2
            }
        }
        i = 0
        while i<scores.count {
            
            i+=1
        }
        return scores
    }
}
