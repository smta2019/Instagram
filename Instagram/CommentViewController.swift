//
//  CommentViewController.swift
//  Instagram
//
//  Created by stma2019 on 2021/06/26.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {
    var postId: String?

    @IBOutlet weak var commentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func handlePostCommentButton(_ sender: Any) {
        // コメントを格納する
        let commentData = commentTextView.text
        
        
        // コメントの保存場所を定義する
        let commentRef = Firestore.firestore().collection(Const.CommentPath).document()

        // HUDで投稿処理中の表示を開始
        SVProgressHUD.show()
        
        if commentData != "" {
            // FireStoreに投稿データを保存する
            let name = Auth.auth().currentUser?.displayName
            let commentDic = ["postId": self.postId!, "name": name!, "comment": commentData!, "date": FieldValue.serverTimestamp()] as [String:Any]
            commentRef.setData(commentDic)
            
            SVProgressHUD.showSuccess(withStatus: "コメントを投稿しました")
            
            self.dismiss(animated: true, completion: nil)
            
        }
//        let
//        imageRef.putData(imageData!, metadata: metadata) {(metadata, error) in
//            if error != nil {
//                // 画像のアップロード失敗
//                print(error!)
//                SVProgressHUD.showError(withStatus: "画像のアップロードが失敗しました")
//                // 投稿処理をキャンセルし、先頭画面に戻る
//                UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
//                return
//            }
//            // FireStoreに投稿データを保存する
//            let name = Auth.auth().currentUser?.displayName
//            let postDic = ["name": name!, "caption": self.textField.text!, "date":FieldValue.serverTimestamp()] as [String: Any]
//            postRef.setData(postDic)
//            // HUDで投稿完了を表示する
//            SVProgressHUD.showSuccess(withStatus: "投稿しました")
//            // 投稿処理が完了したので先頭画面に戻る
//            UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
//            
//        }
    }
    
    @IBAction func handleCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
