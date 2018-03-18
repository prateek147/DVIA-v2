//
//  CameraPermissionsViewController.swift
//  DVIA-v2
//
//  Created by Prateek Gianchandani on 3/18/18.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//

import UIKit
import AVFoundation

class FeedCell: UITableViewCell {
    @IBOutlet weak var customImageView: UIImageView!
   
}

class CameraPermissionsViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    @IBOutlet weak var tableView: UITableView!
    var session: AVCaptureSession?
    var feedImages = [CGImage]()
    var previewLayer: AVCaptureVideoPreviewLayer!
    let shapeLayer = CAShapeLayer()
    var frontCamera: AVCaptureDevice? = {
        return AVCaptureDevice.default(AVCaptureDevice.DeviceType.builtInWideAngleCamera, for: AVMediaType.video, position: .front)
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareFrontCamera()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // All UITableView methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.feedImages.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! FeedCell
        cell.customImageView?.image = UIImage.init(cgImage: self.feedImages[indexPath.item]);
        cell.customImageView.contentMode = .scaleAspectFill
        return cell;
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func prepareFrontCamera() {
        session = AVCaptureSession()
        guard let session = session, let captureDevice = frontCamera else { return }
        
        do {
            let deviceInput = try AVCaptureDeviceInput(device: captureDevice)
            session.beginConfiguration()
            if session.canAddInput(deviceInput) {
                session.addInput(deviceInput)
            }
            let output = AVCaptureVideoDataOutput()
            output.videoSettings = [
                String(kCVPixelBufferPixelFormatTypeKey) : Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)
            ]
            output.alwaysDiscardsLateVideoFrames = true
            if session.canAddOutput(output) {
                session.addOutput(output)
            }
            session.commitConfiguration()
            let queue = DispatchQueue(label: "output.queue")
            output.setSampleBufferDelegate(self as? AVCaptureVideoDataOutputSampleBufferDelegate, queue: queue)
        } catch {
        }
        
        session.startRunning()
        
        self.previewLayer = AVCaptureVideoPreviewLayer(session: session)
        self.previewLayer.videoGravity = .resizeAspectFill
        self.previewLayer.isHidden = true;
        view.layer.insertSublayer(self.previewLayer, at: 0)
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 2.0
        
        //needs to filp coordinate system for Vision
        shapeLayer.setAffineTransform(CGAffineTransform(scaleX: -1, y: -1))
        
        view.layer.addSublayer(shapeLayer)
    }

}

extension CameraPermissionsViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)
        let attachments = CMCopyDictionaryOfAttachments(kCFAllocatorDefault, sampleBuffer, kCMAttachmentMode_ShouldPropagate)
        let ciImage = CIImage(cvImageBuffer: pixelBuffer!, options: attachments as! [String : Any]?)
        let ciImageWithOrientation = ciImage.oriented(forExifOrientation: Int32(UIImageOrientation.leftMirrored.rawValue))
        editImage(on: ciImageWithOrientation)
    }
    
}

extension CameraPermissionsViewController {
    func editImage(on image: CIImage) {
        
            let filter = CIFilter(name: "CISepiaTone")!
            let context = CIContext()
            
            // Random image filters to make it look more creepy
            // via https://developer.apple.com/library/content/documentation/GraphicsImaging/Conceptual/CoreImaging/ci_tasks/ci_tasks.html
            filter.setValue(0.8, forKey: kCIInputIntensityKey)
            filter.setValue(image, forKey: kCIInputImageKey)
            let result = filter.outputImage!
            let cgImage = context.createCGImage(result, from: result.extent)
            
            DispatchQueue.main.async {
                self.feedImages.append(cgImage!)
                self.tableView.reloadData()
            }
        }
        
        
}


