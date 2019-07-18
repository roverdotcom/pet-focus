//  Created by Geoff Pado on 6/25/19.
//  Copyright © 2019 Geoff Pado. All rights reserved.

import UIKit

extension CGSize {
    static func * (size: CGSize, multiplier: CGFloat) -> CGSize {
        return CGSize(width: size.width * multiplier, height: size.height * multiplier)
    }
}

extension CGRect {
    static func * (rect: CGRect, multiplier: CGFloat) -> CGRect {
        return CGRect(x: rect.origin.x * multiplier, y: rect.origin.y * multiplier, width: rect.size.width * multiplier, height: rect.size.height * multiplier)
    }

    init(center: CGPoint, size: CGSize) {
        let origin = CGPoint(x: center.x - (size.width / 2.0), y: center.y - (size.height / 2.0))
        self.init(origin: origin, size: size)
    }

    var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }

    static func flippedRect(from rect: CGRect, scaledTo size: CGSize) -> CGRect {
        var scaledRect = rect
        scaledRect.origin.y = (1.0 - scaledRect.origin.y)

        scaledRect.origin.x *= size.width
        scaledRect.origin.y *= size.height
        scaledRect.size.width *= size.width
        scaledRect.size.height *= size.height
        scaledRect.origin.y -= scaledRect.size.height

        return scaledRect.integral
    }
}
