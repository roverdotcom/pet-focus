//  Created by Geoff Pado on 6/18/19.
//  Copyright © 2019 Geoff Pado. All rights reserved.

import AVFoundation
import UIKit

@available(iOS 13.0, *)
class PetFocusedImageCropper {
    func crop(_ image: UIImage, aspectRatio: CGSize, completionHandler: @escaping ((UIImage?, Error?) -> Void)) {
        let detectionOperation = PetDetectionOperation(image: image) { [weak self] observations, error in
            // if an error occurred, error out
            guard let observations = observations, let cropper = self else {
                completionHandler(nil, error)
                return
            }

            let croppedImage = cropper.croppedImage(from: image, aspectRatio: aspectRatio, observations: observations)
            completionHandler(croppedImage, nil)
        }

        PetFocusedImageCropper.operationQueue.addOperation(detectionOperation)
    }

    func croppedImage(from image: UIImage, aspectRatio: CGSize, observations: [PetObservation]) -> UIImage {
        // if there are no observations, return the original image
        guard observations.count > 0 else {
            return image
        }

        // crop all the rectangles to the image — the animal detector sometimes goes outside the image
        let actualImageSize = image.size * image.scale
        let imageBounds = CGRect(origin: .zero, size: actualImageSize)
        let croppedRectangles = observations.map { $0.bounds.intersection(imageBounds) }

        // Union all of the located rectangles together
        let first = croppedRectangles[0]
        let remainingRectangles = croppedRectangles.suffix(from: 1)
        let petBounds = remainingRectangles.reduce(first) { $0.union($1) }

        // Find the center of the dog rectangle
        let dogCenter = petBounds.center

        // Create a crop rectangle of the appropriate aspect ratio centered on the dog center
        let maxRect = AVMakeRect(aspectRatio: aspectRatio, insideRect: CGRect(origin: .zero, size: actualImageSize))
        var cropRect = CGRect(center: dogCenter, size: maxRect.size)

        // Shift the rectangle until it is entirely within the image (i.e., fix any origin < minX/Y or origin+size > maxX/Y)
        if cropRect.origin.x < 0 {
            cropRect.origin.x = 0
        }

        if cropRect.origin.y < 0 {
            cropRect.origin.y = 0
        }

        if cropRect.origin.x + cropRect.size.width > actualImageSize.width {
            cropRect.origin.x -= ((cropRect.origin.x + cropRect.size.width) - actualImageSize.width)
        }

        if cropRect.origin.y + cropRect.size.height > actualImageSize.height {
            cropRect.origin.y -= ((cropRect.origin.y + cropRect.size.height) - actualImageSize.height)
        }

        // Grab the portion of the image that is in that rect and return
        let format = UIGraphicsImageRendererFormat()
        format.scale = image.scale

        let renderer = UIGraphicsImageRenderer(size: cropRect.size * (1 / image.scale), format: format)
        let finalImage = renderer.image { _ in
            image.draw(at: CGPoint(x: cropRect.origin.x * -1, y: cropRect.origin.y * -1))
        }

        return finalImage
    }

    // MARK: Boilerplate

    private static let operationQueue = OperationQueue()
}

enum PetCroppingError: Error {
    case invalidSourceImage
}
