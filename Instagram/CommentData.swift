//
//  CommentData.swift
//  Instagram
//
//  Created by stma2019 on 2021/06/27.
//

import UIKit
import Firebase

class CommentData:NSObject {
    var id: String
    var postId: String?
    var name: String?
    var comment: String?
    var date: Date?
    
    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID
        
        let commentDic = document.data()
        
        self.postId = commentDic["postId"] as? String
        self.name = commentDic["name"] as? String
        self.comment = commentDic["comment"] as? String
        
        let timestamp = commentDic["date"] as? Timestamp
        self.date = timestamp?.dateValue()

    }
}
