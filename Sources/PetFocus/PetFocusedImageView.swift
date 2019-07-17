//  Created by Geoff Pado on 6/17/19.
//  Copyright © 2019 Geoff Pado. All rights reserved.

import UIKit
import Vision

public class PetFocusedImageView: UIImageView {
    public override var image: UIImage? {
        get { return super.image }
        set(newImage) {
            guard let newImage = newImage else { super.image = nil; return }
            setImage(from: newImage)
        }
    }

    public override func awakeFromNib() {
        super.awakeFromNib()

        if let image = image {
            setImage(from: image)
        }
    }

    private func setImage(from originalImage: UIImage) {
        if #available(iOS 13.0, *) {
            PetFocusedImageView.cropper.crop(originalImage, aspectRatio: bounds.size) { finalImage, _ in
                guard let finalImage = finalImage else { return }
                DispatchQueue.main.async {
                    super.image = finalImage
                }
            }
        } else {
            super.image = originalImage
        }
    }

    @available(iOS 13.0, *)
    private static let cropper = PetFocusedImageCropper()
}
