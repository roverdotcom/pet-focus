//  Created by Geoff Pado on 6/18/19.
//  Copyright © 2019 Geoff Pado. All rights reserved.

import UIKit

class PetFocusedImageCropper {
    func crop(_ image: UIImage, aspectRatio: CGFloat, completionHandler: @escaping ((UIImage?, Error?) -> Void)) {
        // Find the "best" dog rectangle
        findMostProminentPet(in: image) { (observation, error) in
            guard let observation = observation else { return }

            // Find the center of the dog rectangle
            let dogCenter = observation.bounds.center

            // Create a crop rectangle of the appropriate aspect ratio centered on the dog center

            // Shift the rectangle until it is entirely within the image (i.e., fix any origin < minX/Y or origin+size > maxX/Y)

            // Grab the portion of the image that is in that rect and return
        }
    }

    private func findMostProminentPet(in image: UIImage, completionHandler: @escaping ((PetObservation?, Error?) -> Void)) {

    }
}
