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
    {"d": "rok"}
    ],
"Corect": 2
},
{
"QNum": 2,
"Question": "Co zajmuje najdłużej przy projekcie IOS",
"Answers" : [
{"a": "Znalezienie sposobu na realizację"},
{"b": "Zmuszenie się do pisania"},
{"c": "Testowanie"},
{"d": "Szukanie tutoriali które nie odnoszą się do GitHuba"}
],
"Corect": 3
},
{
"QNum": 3,
"Question": "Najdłóższa rzeka w Afryce to?",
"Answers" : [
{"a": "Nil"},
{"b": "Ganges"},
{"c": "Dzierżęcinka"},
{"d": "Dunajec"}
],
"Corect": 0
},
{
"QNum": 4,
"Question": "Który z języków do pisania stron internetowych wykonuje się po stronie serwera?",
"Answers" : [
{"a": "HTML"},
{"b": "CSS"},
{"c": "PHP"},
{"d": "JS"}
],
"Corect": 2
},
{
"QNum": 5,
"Question": "Jakiego koloru jest czerwony maluch",
"Answers" : [
{"a": "różowy"},
{"b": "czerwony"},
{"c": "fioletowy"},
{"d": "ecru"}
],
"Corect": 1
},
{
"QNum": 6,
"Question": "Jan ma 4 lata i 2 siostry każda ma 5 lat ile lat ma jan?",
"Answers" : [
{"a": "4"},
{"b": "5"},
{"c": "7"},
{"d": "8"}
],
"Corect": 0
},
{
"QNum": 7,
"Question": "Do jakiego rodzaju literatury zalicza się Romeo i Julia",
"Answers" : [
{"a": "Epika"},
{"b": "Dramat"},
{"c": "Liryka"},
{"d": "Muzikal"}
],
"Corect": 1
},
{
"QNum": 8,
"Question": "Ukleja to ",
"Answers" : [
{"a": "Gad"},
{"b": "Ptak"},
{"c": "Ryba"},
{"d": "Ssak"}
],
"Corect": 2
},
{
"QNum": 9,
"Question": "Jak nazywa się wiecznie młoda gwiazda telewizji",
"Answers" : [
{"a": "Arnold Schwarzenegger"},
{"b": " Sylvester Stallone"},
{"c": "Tom Crise"},
{"d": "Krzysztof Ibisz"}
],
"Corect": 3
},
{
"QNum": 10,
"Question": "Na świecie znajduje się obecnie...",
"Answers" : [
{"a": "Ponad 7.5 miliarda"},
{"b": "Ponad 8 miliardów"},
{"c": "Około 6 miliardów"},
{"d": "mniej niż 7.5 miliarda"}
],
"Corect": 0
},
{
"QNum": 11,
"Question": "W którym roku wybuchła pierwsza bomba atomowa?",
"Answers" : [
{"a": "1944"},
{"b": "1938"},
{"c": "1945"},
{"d": "1943"}
],
"Corect": 2
},
{
"QNum": 12,
"Question": "Ile jest pytań w tym quizie",
"Answers" : [
{"a": "13"},
{"b": "12"},
{"c": "9"},
{"d": "10"}
],
"Corect": 1
},
{
"QNum": 13,
"Question": "Kontynent Mu według teori leżał na terenie oceanu:",
"Answers" : [
{"a": "Spokojnego"},
{"b": "Arktycznego"},
{"c": "Indyjskiego"},
{"d": "Atlantyckiego"}
],
"Corect": 0
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
