//
//  BooksLocation.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 24/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class BooksLocation: UITableViewCell {

    var method = ["Self Pickup", "Ojek DQ Same Day", "Ojek DQ Instant"]
    
    @IBOutlet weak var deliveryMethod: UITextField!
    @IBOutlet weak var pickupTime: UITextField!
    @IBOutlet weak var deliveryCost: UILabel!
    
    let timePick = UIDatePicker()
    let locale = Locale.preferredLanguages.first
    var deliverPay = 15000
    
    func setUpTimePick() {
        pickupTime.inputView = timePick
        timePick.datePickerMode = .time
        timePick.locale = Locale(identifier: locale!)
        
        timePick.minimumDate = Date()
        timePick.addTarget(self, action: #selector(timePickerChange), for: .valueChanged)
    }
    
    func createPickerView() {
       let pickerView = UIPickerView()
       pickerView.delegate = self
       deliveryMethod.inputView = pickerView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadowDecorate()
        createPickerView()
        setUpTimePick()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension BooksLocation {
    @objc func timePickerChange() {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        pickupTime.text = formatter.string(from: timePick.date)
    }
}

extension BooksLocation: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return method.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return method[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            deliveryMethod.text = method[row]
            pickupTime.text = ""
            pickupTime.isEnabled = true
            deliveryCost.text = "Rp0"
        } else {
            deliveryMethod.text = method[row]
            pickupTime.text = "-"
            pickupTime.isEnabled = false
            deliveryCost.text = "Rp\(idrFormat(harga: deliverPay))"
        }
    }
}
