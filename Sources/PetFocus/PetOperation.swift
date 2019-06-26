//  Created by Geoff Pado on 6/25/19.
//  Copyright © 2019 Geoff Pado. All rights reserved.

import UIKit
import Vision

struct PetObservation: Equatable {
    init(_ petObservation: VNRecognizedObjectObservation, in image: UIImage) {
        let boundingBox = petObservation.boundingBox
        let imageSize = image.size * image.scale
        self.bounds = CGRect.flippedRect(from: boundingBox, scaledTo: imageSize)

        let observationUUID = petObservation.uuid
        self.uuid = observationUUID
    }

    let bounds: CGRect
    let uuid: UUID
}
