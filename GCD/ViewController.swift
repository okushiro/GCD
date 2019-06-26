//
//  ViewController.swift
//  GCD
//
//  Created by 奥城健太郎 on 2019/06/25.
//  Copyright © 2019 奥城健太郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberA: UITextField!
    @IBOutlet weak var numberB: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var first:Int = 0
    var second:Int = 0
    var big:Int = 0
    var small:Int = 0
    var rem:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = ""
        
    }
    
    @IBAction func didTouchBtn(_ sender: Any) {
        
        if let tmp1_1 = numberA.text {
            if let tmp1_2 = Int(tmp1_1){
                first = abs(tmp1_2)
            }else{
                showAlert("整数を入力してください")
                return
            }
        }else{
            showAlert("整数を入力してください")
            return
        }
        
        if let tmp2_1 = numberB.text {
            if let tmp2_2 = Int(tmp2_1){
                second = abs(tmp2_2)
            }else{
                showAlert("整数を入力してください")
                return
            }
        }else{
            showAlert("整数を入力してください")
            return
        }
        
        if first == 0 || second == 0{
            showAlert("0は入力しないで・・・")
            return
        }
        
        rem = 1
        
        //ユークリッドの互除法
        if first == second {
            resultLabel.text = String(first)
            return
        }else if first > second {
            big = first
            small = second
        }else{
            big = second
            small = first
        }
        
        while rem != 0 {
            rem = big%small
            if rem == 0 {
                resultLabel.text = String(small)
                return
            }else{
                big = small
                small = rem
            }
        }
        
        
    }
    


    //キーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


extension UIViewController {
    //アラートの関数
    func showAlert(_ text: String){
        let alertController = UIAlertController(title: "エラー", message: text , preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (action) -> Void in
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}

