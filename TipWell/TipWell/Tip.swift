//
//  Tip.swift
//  TipWell
//
//  Created by Joseph Hansen on 9/20/16.
//  Copyright © 2016 Joseph Hansen. All rights reserved.
//

import Foundation


struct Tip {
    
    enum qualityOfService: Double {
        //15%
        case Low = 0.15
        //19%
        case Average = 0.19
        //23%
        case High = 0.23
    }
    
    enum paymentMethod: Double {
        //+2.5%
        case Card = 0.025
        //+0%
        case Cash = 0.0
    }
    
    var selectedQualityOfService: qualityOfService = .Average
    
    var selectedPaymentMethod: paymentMethod = .Card
    
    var subTotal: Double
    
    var splitNumber: Int = 1
    
    var minTipAmount: Double
    
    var minTotal: Double
    
    
    init(selectedQualityOfService: qualityOfService = .Average, selectedPaymentMethod: paymentMethod = .Card, subTotal: Double, splitNumber: Int, minTipAmount: Double, minTotal: Double) {
        
        self.selectedQualityOfService = selectedQualityOfService
        self.selectedPaymentMethod = selectedPaymentMethod
        self.subTotal = subTotal
        self.splitNumber = splitNumber
        self.minTipAmount = minTipAmount
        self.minTotal = minTotal
        
    }
    
    
    
}
