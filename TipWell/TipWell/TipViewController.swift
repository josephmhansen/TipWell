//
//  TipViewController.swift
//  TipWell
//
//  Created by Joseph Hansen on 9/21/16.
//  Copyright © 2016 Joseph Hansen. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    
    let qualityOfServiceTitleLabel = UILabel()
    //let qualityTopImageView = UIImageView()
    var qualitySegmentControl = QOSSegmentedControl()
    //(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
    
    let paymentMethodTitleLabel = UILabel()
    var paymentSegmentControl = PMSegmentedControl()
    //(frame: CGRect(x: 0, y: 50, width: 300, height: 40))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupQOSSegmentedControl()
        setupPMSegmentedControl()
        setupConstraints()
        
    }
    
    func setupQOSSegmentedControl() {
        
        setTitle(title: "Low", forSegmentAtIndex: 0)
        setTitle(title: "Average", forSegmentAtIndex: 1)
        setTitle(title: "High", forSegmentAtIndex: 2)
        
        
        qualityOfServiceTitleLabel.font = UIFont(name: "Avenir-Book", size: 21)
        qualityOfServiceTitleLabel.textColor = UIColor.white
        qualityOfServiceTitleLabel.text = "Quality Of Service"
        
        
        /*
        qualityTopImageView.image = UIImage(named: "")
        qualityTopImageView.clipsToBounds = true
        qualityTopImageView.contentMode = .scaleAspectFill
        */
        
        qualitySegmentControl.items = ["Low", "Average", "High"]
        
        
       // qualitySegmentControl.font = UIFont(name: "Avenir-Black", size: 12)
       // qualitySegmentControl.borderColor = UIColor(white: 1.0, alpha: 0.3)
        
        qualitySegmentControl.selectedIndex = 1
        
        qualitySegmentControl.addTarget(self, action: #selector(segmentValueChanged), for: .valueChanged)
        
        self.view.addSubview(qualitySegmentControl)
        self.view.addSubview(qualityOfServiceTitleLabel)
    }
    
    func setupPMSegmentedControl() {
        paymentSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        setTitle(title: "Card", forSegmentAtIndex: 0)
        setTitle(title: "Cash", forSegmentAtIndex: 1)
        
        paymentMethodTitleLabel.font = UIFont(name: "Avenir-Book", size: 21)
        paymentMethodTitleLabel.textColor = UIColor.white
        paymentMethodTitleLabel.text = "Payment Method"
        
        paymentSegmentControl.items = ["Card", "Cash"]
        
        paymentSegmentControl.selectedIndex = 0
        
        paymentSegmentControl.addTarget(self, action: #selector(segmentValueChanged), for: .valueChanged)
        
        self.view.addSubview(paymentSegmentControl)
        
        
    }
    
    func setupConstraints() {
        
        
        let QOSLabelTopConstraint = NSLayoutConstraint(item: qualityOfServiceTitleLabel, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 40)
        let QOSLabelLeadingConstraint = NSLayoutConstraint(item: qualityOfServiceTitleLabel, attribute: .leadingMargin, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 0)
        let QOSLabelTrailingConstraint = NSLayoutConstraint(item: qualityOfServiceTitleLabel, attribute: .trailingMargin, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: 0)
        let QOSLabelHeightConstraint = NSLayoutConstraint(item: qualityOfServiceTitleLabel, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 40)
        
        view.addConstraints([QOSLabelTopConstraint,QOSLabelLeadingConstraint, QOSLabelTrailingConstraint, QOSLabelHeightConstraint])
        
        qualitySegmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        let QOSSCTopConstraint = NSLayoutConstraint(item: qualitySegmentControl, attribute: .top, relatedBy: .equal, toItem: self.qualityOfServiceTitleLabel, attribute: .bottom, multiplier: 1, constant: 40)
        let QOSSCLeadingConstraint = NSLayoutConstraint(item: qualitySegmentControl, attribute: .leadingMargin, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 0)
        let QOSSCTrailingConstraint = NSLayoutConstraint(item: qualitySegmentControl, attribute: .trailingMargin, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: 0)
        let QOSSCHeightConstraint = NSLayoutConstraint(item: qualitySegmentControl, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 40)
        
        view.addConstraints([QOSSCTopConstraint, QOSSCLeadingConstraint,QOSSCTrailingConstraint, QOSSCHeightConstraint])
        
    }
    
    
    
    
    //  get segment image with color
    /*
    func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, size.width, size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    */
    
    // can only have image or title, not both. must be 0..#segments - 1 (or ignored). default is nil
    
    func setTitle(title: String?, forSegmentAtIndex segment: Int) {
        
    }
    
    
    
    
    
    func segmentValueChanged(sender: AnyObject?){
        
        if qualitySegmentControl.selectedIndex == 0 {
            //salesValue.text = "LOW"
        }else if qualitySegmentControl.selectedIndex == 1{
            //salesValue.text = "NEUTRAL"
        }else{
            //salesValue.text = "HIGH"
        }
    }
    
  
    
    

}
