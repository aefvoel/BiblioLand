//
//  PickingDate.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 24/07/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import UIKit

class PickingDate: UITableViewCell {

    @IBOutlet weak var startDatePick: UITextField!
    @IBOutlet weak var durationOfBorrow: UILabel!
    @IBOutlet weak var endDatePick: UITextField!
    @IBOutlet weak var totalToPay: UILabel!
    
    var harga: [Int] = [0]
        
    let startPicker = UIDatePicker()
    let endPicker = UIDatePicker()
    let locale = Locale.preferredLanguages.first
    
    func setUpStartDate() {
        startDatePick.inputView = startPicker
        startPicker.datePickerMode = .date
        startPicker.locale = Locale(identifier: locale!)
        
        startPicker.minimumDate = Date()
        
        startPicker.addTarget(self, action: #selector(startPickerChange), for: .valueChanged)
    }
    
    func setUpEndDate() {
        endDatePick.inputView = endPicker
        endPicker.datePickerMode = .date
        endPicker.locale = Locale(identifier: locale!)
        
        endPicker.minimumDate = Date()
        
        endPicker.addTarget(self, action: #selector(endPickerChange), for: .valueChanged)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpStartDate()
        setUpEndDate()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension PickingDate {
    
    @objc func startPickerChange() {
        getDateFromPicker(sender: startPicker)
        checkingIsFilled()
    }
    
    @objc func endPickerChange() {
        getDateFromPicker(sender: endPicker)
        checkingIsFilled()
    }
    
    func checkingIsFilled() {
        if startDatePick.text != "" && endDatePick.text != "" {
            let start = startPicker.date
            let end = endPicker.date
            
            let diff = Date.daysBetween(start: start, end: end)
            durationOfBorrow.text = "\(diff) Days"
            
            var sumAmount = 0
            for data in harga {
                sumAmount = sumAmount + (data * diff)
            }
            
            totalToPay.text = "Rp\(idrFormat(harga: sumAmount))"
        }
    }
    
    func getDateFromPicker(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
                
        if sender == startPicker {
            startDatePick.text = formatter.string(from: startPicker.date)
            
            endPicker.minimumDate = startPicker.date
        } else {
            endDatePick.text = formatter.string(from: endPicker.date)

            startPicker.maximumDate = endPicker.date
        }
    }
}
