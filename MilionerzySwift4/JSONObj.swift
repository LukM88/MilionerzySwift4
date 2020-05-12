//
//  File.swift
//  MilionerzySwift4
//
//  Created by LM88 on 12/05/2020.
//  Copyright © 2020 LM88. All rights reserved.
//

import Foundation
let JSON = """

[{
"QNum": 1,
"Question": "Ile czasu trzeba na napisanie aplikacji Milionerzy",
"Answers" : [
    {"a": "tydzień"},
    {"b": "miesiąc"},
    {"c": "dzień"},
    {"d": "rok"},
    ],
"Corect": 2,
},
{
"QNum": 2,
"Question": "Co zajmuje najdłużej przy projekcie IOS",
"Answers" : [
{"a": "Znalezienie sposobu na realizację"},
{"b": "Zmuszenie się do pisania"},
{"c": "Testowanie"},
{"d": "Szukanie tutoriali które nie odnoszą się do GitHuba"},
],
"Corect": 3,
},
{
"QNum": 3,
"Question": "Najdłóższa rzeka w Afryce to?",
"Answers" : [
{"a": "Nil"},
{"b": "Ganges"},
{"c": "Dzierżęcinka"},
{"d": "Dunajec"},
],
"Corect": 0,
}
]
"""
class Menager{
    struct Questions: Decodable {
        
        let QNum: Int
        let Question: String
        let Answers: Array<Dictionary<String,String>>
        let Corect: Int
    }
    
    static func getQuestions() -> [Questions]{
        let questionData = Data(JSON.data(using: .utf8)!)
        let questions: [Questions] = try! JSONDecoder().decode([Questions].self, from: questionData)
        return questions
    }
}
