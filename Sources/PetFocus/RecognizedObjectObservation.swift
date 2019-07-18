//  Created by Geoff Pado on 7/18/19.
//  Copyright © 2019 Geoff Pado. All rights reserved.

import Vision

/// Used for mocking purposes in `PetObservation`
protocol RecognizedObjectObservation {
    var boundingBox: CGRect { get }
    var uuid: UUID { get }
}

@available(iOS 13.0, *)
extension VNRecognizedObjectObservation: RecognizedObjectObservation {}
