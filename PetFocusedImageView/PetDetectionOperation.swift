//  Created by Geoff Pado on 6/17/19.
//  Copyright © 2019 Geoff Pado. All rights reserved.

import os.log
import UIKit
import Vision

class PetDetectionOperation: Operation {
    init(image: UIImage, completionHandler: @escaping (([PetObservation]?, Error?) -> Void)) {
        self.image = image
        self.completionHandler = completionHandler
        super.init()
    }

    override func start() {
        let imageRequest = VNDetectAnimalRectanglesRequest { [weak self] request, error in
            guard let results = request.results else {
                self?.completionHandler(nil, error)
                self?._finished = true
                self?._executing = false
                return
            }


            let recognizedObjectObservations = results.compactMap { $0 as? VNRecognizedObjectObservation }
            let petObservations = recognizedObjectObservations.compactMap { PetObservation($0, in: self!.image)}
            self?.completionHandler(petObservations, nil)

            self?._finished = true
            self?._executing = false
        }

        do {
            try imageRequestHandler?.perform([imageRequest])
            _executing = true
        } catch {
            completionHandler(nil, error)
            PetDetectionOperation.log("error starting image request: \(error.localizedDescription)", type: .error)
            _finished = true
            _executing = false
        }
    }

    // MARK: Logging

    static var log: OSLog { return OSLog(subsystem: "com.cocoatype.Highlighter", category: "Text Detection") }
    static func log(_ text: String, type: OSLogType = .default) {
        os_log("%@", log: PetDetectionOperation.log, type: type, text)
    }

    // MARK: Boilerplate

    private let image: UIImage
    private let completionHandler: ([PetObservation]?, Error?) -> Void
    
    private lazy var imageRequestHandler: VNImageRequestHandler? = {
        guard let cgImage = image.cgImage else {
            assertionFailure("No CGImage available for detection source image")
            return nil
        }
        
        return VNImageRequestHandler(cgImage: cgImage, orientation: image.imageOrientation.cgImagePropertyOrientation)
    }()

    override var isAsynchronous: Bool { return true }

    private var _executing = false {
        willSet {
            willChangeValue(for: \.isExecuting)
        }

        didSet {
            didChangeValue(for: \.isExecuting)
        }
    }
    override var isExecuting: Bool { return _executing }

    private var _finished = false {
        willSet {
            willChangeValue(for: \.isFinished)
        }

        didSet {
            didChangeValue(for: \.isFinished)
        }
    }
    override var isFinished: Bool { return _finished }
}
