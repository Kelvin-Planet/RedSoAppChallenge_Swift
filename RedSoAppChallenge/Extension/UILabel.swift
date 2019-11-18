import UIKit

extension UILabel {
    convenience init(fontSize: CGFloat, color: UIColor) {
        self.init()
        self.font = self.font.withSize(fontSize)
        self.textColor = color
    }
    convenience init(fontSize: CGFloat, color: UIColor, str: String) {
        self.init()
        self.font = self.font.withSize(fontSize)
        self.textColor = color
        self.text = str
    }
}
