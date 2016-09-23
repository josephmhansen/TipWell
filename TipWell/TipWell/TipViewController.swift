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
    let topStackView = UIStackView()
    
    //let qualityTopImageView = UIImageView()
    var qualitySegmentControl = QOSSegmentedControl()
    //(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
    
    let paymentMethodTitleLabel = UILabel()
    var paymentSegmentControl = PMSegmentedControl()
    //(frame: CGRect(x: 0, y: 50, width: 300, height: 40))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topColor = UIColor.cyan.cgColor
        let bottomColor = UIColor.lightGray.cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor, bottomColor]
        gradientLayer.locations = [0.0, 1.0]
        
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.addSublayer(gradientLayer)
        
        
        setupQOSSegmentedControl()
        setupPMSegmentedControl()
        setupStackView()
        setupConstraints()
        
    }
    
    func setupQOSSegmentedControl() {
        
        
        
        setTitle(title: "Low", forSegmentAtIndex: 0)
        setTitle(title: "Average", forSegmentAtIndex: 1)
        setTitle(title: "High", forSegmentAtIndex: 2)
        
        // quality of service label
        
        qualityOfServiceTitleLabel.font = UIFont(name: "Avenir-Book", size: 21)
        qualityOfServiceTitleLabel.textColor = UIColor.white
        qualityOfServiceTitleLabel.text = "Quality Of Service:"
        
        qualitySegmentControl.items = ["Low", "Average", "High"]
        qualitySegmentControl.selectedIndex = 1
        qualitySegmentControl.addTarget(self, action: #selector(segmentValueChanged), for: .valueChanged)
        
        self.view.addSubview(qualityOfServiceTitleLabel)
        self.view.addSubview(qualitySegmentControl)
    }
    
    func setupPMSegmentedControl() {
        
        
        
        setTitle(title: "Card", forSegmentAtIndex: 0)
        setTitle(title: "Cash", forSegmentAtIndex: 1)
        
        //payment method label
        
        paymentMethodTitleLabel.font = UIFont(name: "Avenir-Book", size: 21)
        paymentMethodTitleLabel.textColor = UIColor.white
        paymentMethodTitleLabel.text = "Payment Method:"
        
        paymentSegmentControl.items = ["Card", "Cash"]
        paymentSegmentControl.selectedIndex = 0
        paymentSegmentControl.addTarget(self, action: #selector(segmentValueChanged), for: .valueChanged)
        
        
        self.view.addSubview(paymentMethodTitleLabel)
        self.view.addSubview(paymentSegmentControl)
    }
    
    func setupStackView() {
        topStackView.addArrangedSubview(qualityOfServiceTitleLabel)
        topStackView.addArrangedSubview(qualitySegmentControl)
        topStackView.addArrangedSubview(paymentMethodTitleLabel)
        topStackView.addArrangedSubview(paymentSegmentControl)
        topStackView.axis = .vertical
        topStackView.distribution = .equalSpacing
        topStackView.spacing = 8
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.alignment = .leading
        self.view.addSubview(topStackView)
    }
    
    
    
    func setupConstraints() {
        let stackViewTopConstraint = NSLayoutConstraint(item: topStackView, attribute: .topMargin, relatedBy: .equal, toItem: self.view, attribute: .topMargin, multiplier: 1, constant: 40)
        let stackViewLeadingConstraint = NSLayoutConstraint(item: topStackView, attribute: .leadingMargin, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 0)
        let stackViewTrailingConstraint = NSLayoutConstraint(item: topStackView, attribute: .trailingMargin, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: 0)
        let stackViewHeightConstraint = NSLayoutConstraint(item: topStackView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 160)
        
        view.addConstraints([stackViewTopConstraint, stackViewLeadingConstraint, stackViewTrailingConstraint, stackViewHeightConstraint])
        
        //let QOSSCTopConstraint = NSLayoutConstraint(item: qualitySegmentControl, attribute: .top, relatedBy: .equal, toItem: self.qualityOfServiceTitleLabel, attribute: .bottom, multiplier: 1, constant: 8)
        let QOSSCLeadingConstraint = NSLayoutConstraint(item: qualitySegmentControl, attribute: .leadingMargin, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 0)
        let QOSSCTrailingConstraint = NSLayoutConstraint(item: qualitySegmentControl, attribute: .trailingMargin, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: 0)
        let QOSSCHeightConstraint = NSLayoutConstraint(item: qualitySegmentControl, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 40)
        
        view.addConstraints([QOSSCLeadingConstraint,QOSSCTrailingConstraint, QOSSCHeightConstraint])
        
        //let PMSCTopConstraint = NSLayoutConstraint(item: paymentSegmentControl, attribute: .top, relatedBy: .equal, toItem: self.paymentMethodTitleLabel, attribute: .bottom, multiplier: 1, constant: 8)
        let PMSCLeadingConstraint = NSLayoutConstraint(item: paymentSegmentControl, attribute: .leadingMargin, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 0)
        let PMSCTrailingConstraint = NSLayoutConstraint(item: paymentSegmentControl, attribute: .trailingMargin, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: 0)
        let PMSCHeightConstraint = NSLayoutConstraint(item: paymentSegmentControl, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 40)
        
        view.addConstraints([PMSCLeadingConstraint, PMSCTrailingConstraint, PMSCHeightConstraint])
    }
    
    /*
    
    
    func setupConstraints() {
        qualityOfServiceTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        qualitySegmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        paymentMethodTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        paymentSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        
        let QOSLabelTopConstraint = NSLayoutConstraint(item: qualityOfServiceTitleLabel, attribute: .topMargin, relatedBy: .equal, toItem: self.view, attribute: .topMargin, multiplier: 1, constant: 40)
        let QOSLabelLeadingConstraint = NSLayoutConstraint(item: qualityOfServiceTitleLabel, attribute: .leadingMargin, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 0)
        let QOSLabelTrailingConstraint = NSLayoutConstraint(item: qualityOfServiceTitleLabel, attribute: .trailingMargin, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: 0)
        let QOSLabelHeightConstraint = NSLayoutConstraint(item: qualityOfServiceTitleLabel, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 18)
        
        view.addConstraints([QOSLabelTopConstraint,QOSLabelLeadingConstraint, QOSLabelTrailingConstraint, QOSLabelHeightConstraint])
        
        let QOSSCTopConstraint = NSLayoutConstraint(item: qualitySegmentControl, attribute: .top, relatedBy: .equal, toItem: self.qualityOfServiceTitleLabel, attribute: .bottom, multiplier: 1, constant: 8)
        let QOSSCLeadingConstraint = NSLayoutConstraint(item: qualitySegmentControl, attribute: .leadingMargin, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 0)
        let QOSSCTrailingConstraint = NSLayoutConstraint(item: qualitySegmentControl, attribute: .trailingMargin, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: 0)
        let QOSSCHeightConstraint = NSLayoutConstraint(item: qualitySegmentControl, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 40)
        
        view.addConstraints([QOSSCTopConstraint, QOSSCLeadingConstraint,QOSSCTrailingConstraint, QOSSCHeightConstraint])
        
        let PMLabelTopConstraint = NSLayoutConstraint(item: paymentMethodTitleLabel, attribute: .top, relatedBy: .equal, toItem: self.qualitySegmentControl, attribute: .bottom, multiplier: 1, constant: 8)
        let PMLabelLeadingConstraint = NSLayoutConstraint(item: paymentMethodTitleLabel, attribute: .leadingMargin, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 0)
        let PMLabelTrailingConstraint = NSLayoutConstraint(item: paymentMethodTitleLabel, attribute: .trailingMargin, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: 0)
        let PMLabelHeightConstraint = NSLayoutConstraint(item: paymentMethodTitleLabel, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 18)
        
        view.addConstraints([PMLabelTopConstraint, PMLabelLeadingConstraint, PMLabelTrailingConstraint, PMLabelHeightConstraint])
        
        let PMSCTopConstraint = NSLayoutConstraint(item: paymentSegmentControl, attribute: .top, relatedBy: .equal, toItem: self.paymentMethodTitleLabel, attribute: .bottom, multiplier: 1, constant: 8)
        let PMSCLeadingConstraint = NSLayoutConstraint(item: paymentSegmentControl, attribute: .leadingMargin, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 0)
        let PMSCTrailingConstraint = NSLayoutConstraint(item: paymentSegmentControl, attribute: .trailingMargin, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: 0)
        let PMSCHeightConstraint = NSLayoutConstraint(item: paymentSegmentControl, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0, constant: 40)
        
        view.addConstraints([PMSCTopConstraint, PMSCLeadingConstraint, PMSCTrailingConstraint, PMSCHeightConstraint])
        
        
        
        
        
//        let PMLabelTopConstraint = NSLayoutConstraint(item: paymentMethodTitleLabel, attribute: .top, relatedBy: <#T##NSLayoutRelation#>, toItem: <#T##Any?#>, attribute: <#T##NSLayoutAttribute#>, multiplier: <#T##CGFloat#>, constant: <#T##CGFloat#>)
        
    }
 */
    
    
    
    
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
        } else if qualitySegmentControl.selectedIndex == 1 {
            //salesValue.text = "NEUTRAL"
        } else {
            //salesValue.text = "HIGH"
        }
    }
    
  
    
    

}
