//
//  ViewController.swift
//  DTRuler iOS Example
//
//  Created by Dan Jiang on 2016/12/22.
//
//

import UIKit
import DTRuler

class ViewController: UIViewController {

  @IBOutlet weak var label: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    label.text = "59"
    
    layoutRuler()
  }

  fileprivate func layoutRuler() {
    guard let text = label.text, let scale = Int(text) else {
      return
    }
    
    DTRuler.theme = Colorful()
    
    let ruler = DTRuler(scale: .integer(scale), minScale: .integer(10), maxScale: .integer(100), width: view.bounds.width - 50)
    ruler.delegate = self
    
    view.addSubview(ruler)
    
    ruler.translatesAutoresizingMaskIntoConstraints = false
    
    let bottom = NSLayoutConstraint(item: ruler, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
    let leading = NSLayoutConstraint(item: ruler, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 25)
    let trailing = NSLayoutConstraint(item: ruler, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -25)
    
    view.addConstraints([bottom, leading, trailing])
  }
  
  struct Colorful: DTRulerTheme {
    
    var backgroundColor: UIColor {
      return UIColor(white: 1, alpha: 0.3)
    }
    
    var pointerColor: UIColor {
      return UIColor(red:0.47, green:0.30, blue:0.51, alpha:1.00)
    }
    
    var font : UIFont{
        return UIFont(name: "FONT_NAME", size: 17) ?? UIFont.systemFont(ofSize: 18, weight: .bold) //UIFont(name: "Font_Name", size: 17)
    }
    
  }

}

extension ViewController: DTRulerDelegate {
  
  func didChange(on ruler: DTRuler, withScale scale: DTRuler.Scale) {
    label.text = scale.minorTextRepresentation()
  }

}
