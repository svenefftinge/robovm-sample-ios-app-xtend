package org.robovm

import org.robovm.apple.coregraphics.CGRect
import org.robovm.apple.foundation.NSAutoreleasePool
import org.robovm.apple.foundation.NSDictionary
import org.robovm.apple.foundation.NSString
import org.robovm.apple.uikit.UIApplication
import org.robovm.apple.uikit.UIApplicationDelegateAdapter
import org.robovm.apple.uikit.UIButton
import org.robovm.apple.uikit.UIButtonType
import org.robovm.apple.uikit.UIColor
import org.robovm.apple.uikit.UIControlState
import org.robovm.apple.uikit.UIScreen
import org.robovm.apple.uikit.UIWindow

class IOSDemo extends UIApplicationDelegateAdapter {
	
	UIWindow window = null
    var clickCount = 0

    override didFinishLaunching(UIApplication application, NSDictionary<NSString, ?> launchOptions) {
  
        val button = UIButton.create(UIButtonType.RoundedRect)
        button.frame = new CGRect(115.0f, 121.0f, 91.0f, 37.0f)
        button.setTitle("Click me!", UIControlState.Normal)

        button.addOnTouchUpInsideListener [control, event |
                button.setTitle("Click #" + (clickCount++), UIControlState.Normal)
        ]

        window = new UIWindow(UIScreen.mainScreen.bounds)
        window.backgroundColor = UIColor.colorLightGray
        window.addSubview(button)
        window.makeKeyAndVisible
        
        return true
    }

    def static void main(String[] args) {
        val pool = new NSAutoreleasePool
        UIApplication.main(args, null, IOSDemo)
        pool.close
    }
}