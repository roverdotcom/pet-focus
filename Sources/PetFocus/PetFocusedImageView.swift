//  Created by Geoff Pado on 6/17/19.
//  Copyright © 2019 Geoff Pado. All rights reserved.

import UIKit
import Vision

public class PetFocusedImageView: UIImageView {
    public override var image: UIImage? {
        get { return super.image }
        set(newImage) {
            guard let newImage = newImage else { super.image = nil; return }
            PetFocusedImageView.cropper.crop(newImage, aspectRatio: 1) { finalImage, error in
                guard let finalImage = finalImage else { super.image = newImage; return }
                DispatchQueue.main.async {
                    super.image = finalImage
                }
            }
        }
    }

    public override func awakeFromNib() {
        super.awakeFromNib()

        if let image = image {
            PetFocusedImageView.cropper.crop(image, aspectRatio: 1) { finalImage, error in
                guard let finalImage = finalImage else { return }
                DispatchQueue.main.async {
                    super.image = finalImage
                }
            }
        }
    }

    private static let cropper = PetFocusedImageCropper()
}
