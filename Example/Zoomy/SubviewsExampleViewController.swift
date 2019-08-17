//
//  FloatingActionButtonViewController.swift
//  Zoomy_Example
//
//  Created by Menno on 28/05/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import Zoomy

class SubviewsExampleViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let label = UILabel(frame: CGRect())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addZoombehavior(for: imageView)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Just a label that moves along with the zoomed image.."
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
    }
}

extension SubviewsExampleViewController {
    
    func addLabelTo(view: UIView) {
        view.addSubview(label)
        
        let leftConstraint = label.leftAnchor.constraint(greaterThanOrEqualTo: view.leftAnchor, constant: 4)
        let rightConstraint = label.rightAnchor.constraint(greaterThanOrEqualTo: view.rightAnchor, constant: 4)
        
        leftConstraint.priority = .defaultLow
        rightConstraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            leftConstraint,
            rightConstraint,
        ])
    }
}

extension SubviewsExampleViewController: Zoomy.Delegate {
    
    func overlayImageViewWillAppear(_ overlayImageView: UIImageView) {
        label.removeFromSuperview()
        addLabelTo(view: overlayImageView)
    }
    
    func overlayImageViewWillDisappear(_ overlayImageView: UIImageView) {
        if label.superview === overlayImageView {
            label.removeFromSuperview()
        }
    }
    
    func scrollableImageViewWillAppear(_ scrollableImageView: UIImageView) {
        label.removeFromSuperview()
        addLabelTo(view: scrollableImageView)
    }
    
    func scrollableImageViewWillDisappear(_ scrollableImageView: UIImageView) {
        if label.superview === scrollableImageView {
            label.removeFromSuperview()
        }
    }
}
