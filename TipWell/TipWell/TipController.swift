//
//  TipController.swift
//  TipWell
//
//  Created by Joseph Hansen on 9/20/16.
//  Copyright © 2016 Joseph Hansen. All rights reserved.
//

import Foundation

class TipController {
    
    static let sharedController = TipController()

    
    
    func mockTip() -> Tip {
     
        return Tip(selectedQualityOfService: .High, selectedPaymentMethod: .Card, subTotal: 20.0, splitNumber: 2)
        
    }
    
    func createMinTip(tip: Tip) -> Tip {
        let qualityPercentage = (tip.subTotal * tip.selectedQualityOfService.rawValue)
        let paymentTypePercentage = (tip.subTotal * tip.selectedPaymentMethod.rawValue)
        let minTip = (paymentTypePercentage + qualityPercentage) / tip.splitNumber
        tip.minTipAmount = minTip
        return tip
        
    }
    
    func returnFullTip(tip: Tip) -> Tip? {
        let newTip = createMinTip(tip: tip)
        guard let minTipAmount = newTip.minTipAmount else { return nil }
        let minTotal = (newTip.subTotal / newTip.splitNumber) + minTipAmount
        newTip.minTotal = minTotal
        return newTip
        
    }
    
}
