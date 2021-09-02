//
//  ViewController.swift
//  Alert
//
//  Created by kwon on 2021/09/02.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func touchUpShowAlertButton() {
        self.showAlertController(style: UIAlertController.Style.alert)
    }
    
    @IBAction func touchUpShowActionSheetButton() {
        self.showAlertController(style: UIAlertController.Style.actionSheet)
    }
    
    func showAlertController(style: UIAlertController.Style) {
        let alertController: UIAlertController = UIAlertController(title: "Title", message: "Message", preferredStyle: style)
        
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) in print("OK pressed") })
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        let handler: (UIAlertAction) -> Void
        handler = { (action: UIAlertAction) in
            print("action pressed \(action.title ?? "")")
        }
        
        let someAction: UIAlertAction = UIAlertAction(title: "Some", style: UIAlertAction.Style.destructive, handler: handler)
        
        let anotherAction: UIAlertAction = UIAlertAction(title: "Another", style: UIAlertAction.Style.destructive, handler: handler)
        
        // text field는 alert에서만 쓸 수 있고 action sheet에서 사용할 경우 런타임 에러 발생
        if style == UIAlertController.Style.alert {
            alertController.addTextField(configurationHandler: { (field: UITextField) in
                field.placeholder = "플레이스 홀더"
                field.textColor = UIColor.red
            })
        }
        
        // okAction과 cancelAction의 순서는 alertController가 자체적으로 지정해 줌
        alertController.addAction(someAction)
        alertController.addAction(anotherAction)
        
        self.present(alertController, animated: true, completion: { print("alert controller shown") })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

