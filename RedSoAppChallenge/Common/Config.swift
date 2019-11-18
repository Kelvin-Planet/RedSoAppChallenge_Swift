import UIKit

let sw = UIScreen.main.bounds.width //SCREEN_WIDTH
let sh = UIScreen.main.bounds.height //SCREEN_HEIGHT

var statusBarH:CGFloat = UIApplication.shared.statusBarFrame.size.height
var bottomPadding:CGFloat = {
    if #available(iOS 11.0, *) {
        if let window = UIApplication.shared.keyWindow {
            return window.safeAreaInsets.bottom
        }else{
            return 0.0
        }
    }
    return 0.0 }()

func topMostController() -> UIViewController {
    var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
    while (topController.presentedViewController != nil) {
        topController = topController.presentedViewController!
    }
    return topController
}

func isValidEmail(testStr:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}

func isValidYear(testStr:String) -> Bool {
    let emailRegEx = "[1,2][0-9][0-9][0-9]"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}

func isValidPhoneNumber(testStr:String) -> Bool {
    let PHONE_REGEX = "^[56789]{1}[0-9]{7}"
    let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
    let result =  phoneTest.evaluate(with: testStr)
    return result
}

