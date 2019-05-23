//
//  AddNameVC.swift
//  rxnamer
//
//  Created by Caleb Stultz on 9/4/17.
//  Copyright © 2017 Caleb Stultz. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AddNameVC: UIViewController {
    
    @IBOutlet weak var newNameTextField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    let disposeBag = DisposeBag()
    let nameSubject = PublishSubject<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindSubmitBtn()
    }

    func bindSubmitBtn() {
        submitBtn.rx.tap
            .subscribe(onNext: {
                if self.newNameTextField.text != "" {
                    self.nameSubject.onNext(self.newNameTextField.text!)
                }
            })
            .disposed(by: disposeBag)
    }
}
