//  Created by Geoff Pado on 7/18/19.
//  Copyright © 2019 Geoff Pado. All rights reserved.

import Vision

/// Used for mocking purposes in `PetDetectionOperation`
protocol ImageRequestHandler {
    @available(iOS 13.0, *)
    func perform(_ requests: [VNRequest]) throws
}

@available(iOS 13.0, *)
extension VNImageRequestHandler: ImageRequestHandler {}
