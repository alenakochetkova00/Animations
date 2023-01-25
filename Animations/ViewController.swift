
import UIKit
import ViewAnimator

class ViewController: UIViewController {
    
    
    @IBOutlet var viewTitle: UIView!
    @IBOutlet var text: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.text = "combined animations"
        text.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func buttonClick(_ sender: UIButton) {
        if text.text == "combined animations" {
            text.isHidden = false
            viewTitle.animate(animations: [AnimationType.rotate(angle: .pi/5)], delay: 0.5, duration: 1)
            text.text = "rotate"
        } else if text.text == "rotate" {
            viewTitle.animate(animations: [AnimationType.zoom(scale: 0.5)], delay: 0.5, duration: 1)
            text.text = "zoom"
        } else if text.text == "zoom" {
            viewTitle.animate(animations: [AnimationType.random()], delay: 0.5, duration: 1)
            text.text = "random"
        } else if text.text == "random" {
            
            let animations: [Animation] = [
                AnimationType.from(direction: .bottom, offset: 200),
                AnimationType.rotate(angle: .pi/5),
                AnimationType.zoom(scale: 3)
            ]
            
            viewTitle.animate(animations: animations, delay: 0.5, duration: 1)
            text.text = "combined animations"
        }
    }
}


// MARK: - Label corner rounding
extension UIView {

@IBInspectable var cornerRadiusV: CGFloat {
    get {
        return layer.cornerRadius
    }
    set {
        layer.cornerRadius = newValue
        layer.masksToBounds = newValue > 0
    }
}

@IBInspectable var borderWidthV: CGFloat {
    get {
        return layer.borderWidth
    }
    set {
        layer.borderWidth = newValue
    }
}

@IBInspectable var borderColorV: UIColor? {
    get {
        return UIColor(cgColor: layer.borderColor!)
    }
    set {
        layer.borderColor = newValue?.cgColor
    }
}
}
