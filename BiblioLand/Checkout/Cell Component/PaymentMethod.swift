//
//  PaymentMethod.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 24/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class PaymentMethod: UITableViewCell {

    var paymentMethod = ["Biblio Walet", "COD"]
    
    @IBOutlet weak var choosePayment: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadowDecorate()
        createPickerView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func createPickerView() {
       let pickerView = UIPickerView()
       pickerView.delegate = self
       choosePayment.inputView = pickerView
    }
    
    @objc func doneEdit() {
        self.endEditing(true)
    }
    
}

extension PaymentMethod: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return paymentMethod.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return paymentMethod[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        choosePayment.text = paymentMethod[row]
    }
}
