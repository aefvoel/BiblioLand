//
//  Models.swift
//  BiblioLand
//
//  Created by Dicky Geraldi on 03/08/20.
//  Copyright © 2020 Toriq Wahid Syaefullah. All rights reserved.
//

import Foundation

class DataCheckout {
    var PickStartDate: String?
    var PickEndDate: String?
    var BooksPrice: Int?
    var Delivery: String?
    var PickupTime: String?
    var DeliveryCost: Int?
    var PaymentMethod: String?
    var TotalPay: Int
    
    init(PickStartDate: String, PickEndDate: String, BooksPrice: Int, Delivery: String, PickupTime: String, DeliveryCost: Int, PaymentMethod: String, TotalPay: Int) {
        self.PickStartDate = PickStartDate
        self.PickEndDate = PickEndDate
        self.BooksPrice = BooksPrice
        self.Delivery = Delivery
        self.PickupTime = PickupTime
        self.DeliveryCost = DeliveryCost
        self.PaymentMethod = PaymentMethod
        self.TotalPay = TotalPay
    }
}
