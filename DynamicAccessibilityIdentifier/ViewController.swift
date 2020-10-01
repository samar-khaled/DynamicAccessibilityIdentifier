//
//  ViewController.swift
//  DynamicAccessibilityIdentifier
//
//  Created by Samar Khaled on 1/10/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var helloLabel: UILabel!
    @IBOutlet var switchSteps: UISegmentedControl!
    var testString: String = "test"
    override func viewDidLoad() {
        super.viewDidLoad()
        dynamicSetAccessibilityIdentifier()
        print("view.accessibilityIdentifier = \(self.view.accessibilityIdentifier as Any)")
        print("helloLabel.accessibilityIdentifier = \(helloLabel.accessibilityIdentifier as Any)")
        print("switchSteps.accessibilityIdentifier = \(switchSteps.accessibilityIdentifier as Any)")
    }

}

protocol AccessibilityIdentifierViewController where Self: UIViewController {
    func dynamicSetAccessibilityIdentifier()
}

extension UIViewController :AccessibilityIdentifierViewController {
    func dynamicSetAccessibilityIdentifier() {
        let m = Mirror(reflecting: self)
        print(m.description)
        self.view.accessibilityIdentifier = m.description
            
        print(m.children.count)
        for p in m.children {
            guard let control = p.value as? UIView else {
                return
            }
            control.accessibilityIdentifier = p.label
        }
    }
}
