//
//  model.swift
//  Todolist
//
//  Created by jaegu park on 2022/10/04.
//

import Foundation

class Memo {
    var content: String
    var insertDate: Date
    
    init(content: String) {
        self.content = content
        insertDate = Date()
    }
    
    static var dummyMemoList = [
        Memo(content: "산책하기"),
        Memo(content: "과제하기"),
        Memo(content: "낮잠자기"),
        Memo(content: "넷플릭스 시청"),
        Memo(content: "샤워하기"),
        Memo(content: "유튜브 보기"),
        Memo(content: "뒹굴뒹굴 하기"),
        Memo(content: "Swift 공부하기"),
        Memo(content: "강의 듣기"),
        Memo(content: "친구랑 놀기"),
        Memo(content: "산책하기"),
        Memo(content: "과제하기"),
        Memo(content: "낮잠자기"),
        Memo(content: "넷플릭스 시청"),
        Memo(content: "샤워하기"),
        Memo(content: "유튜브 보기"),
        Memo(content: "뒹굴뒹굴 하기"),
        Memo(content: "Swift 공부하기"),
        Memo(content: "강의 듣기"),
        Memo(content: "친구랑 놀기"),
        Memo(content: "산책하기"),
        Memo(content: "과제하기"),
        Memo(content: "낮잠자기"),
        Memo(content: "넷플릭스 시청"),
        Memo(content: "샤워하기"),
        Memo(content: "유튜브 보기"),
        Memo(content: "뒹굴뒹굴 하기"),
        Memo(content: "Swift 공부하기"),
        Memo(content: "강의 듣기"),
        Memo(content: "친구랑 놀기"),
        Memo(content: "산책하기"),
        Memo(content: "과제하기"),
        Memo(content: "낮잠자기"),
        Memo(content: "넷플릭스 시청"),
        Memo(content: "샤워하기"),
        Memo(content: "유튜브 보기"),
        Memo(content: "뒹굴뒹굴 하기"),
        Memo(content: "Swift 공부하기"),
        Memo(content: "강의 듣기"),
        Memo(content: "친구랑 놀기"),
    ]
}
