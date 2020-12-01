//
//  TrackHabitViewController.swift
//  HabitTracker
//
//  Created by Yike Li on 11/29/20.
//
// Tutorials: https://nsscreencast.com/episodes/406-tinting-an-image-using-masks

import UIKit

extension UIImage {
    func mergeWith(topImage: UIImage) -> UIImage {
      let bottomImage = self

      UIGraphicsBeginImageContext(size)

      let areaSize = CGRect(x: 0, y: 0, width: bottomImage.size.width, height: bottomImage.size.height)
      bottomImage.draw(in: areaSize)

      topImage.draw(in: areaSize, blendMode: .normal, alpha: 1.0)

      let mergedImage = UIGraphicsGetImageFromCurrentImageContext()!
      UIGraphicsEndImageContext()
      return mergedImage
    }
    var averageColor: UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)

        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
    }
    func tint(color: UIColor) -> UIImage {
        let maskImage = cgImage
        let bounds = CGRect(origin: .zero, size: size)

        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { context in
            let cgContext = context.cgContext
            cgContext.clip(to: bounds, mask: maskImage!)
            color.setFill()
            cgContext.fill(bounds)
        }
    }
}

class TrackHabitViewController: UIViewController {

    
//    let layer = CALayer()
    var changePaint : Bool = true
    @IBAction func habitLoggedButtonClick(_ sender: UIButton) {
        changePaint.toggle()
        print(changePaint)
        let myframe = CGRect(x: 50, y: 400, width: 300, height: 300)
        imgView.image = nil;
        imgView = UIImageView(frame: myframe)
        imgView.contentMode = .scaleAspectFill
        imgView.image = self.paintImage(color: .red, frame: myframe, paint: changePaint)
            view.addSubview(imgView)
    }
    
    
    @IBOutlet weak var viewForLayer: UIView!
    var imgView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupLayer()
//        viewForLayer.layer.addSublayer(layer)
        let myframe = CGRect(x: 50, y: 400, width: 300, height: 300)
        imgView = UIImageView(frame: myframe)
        imgView.contentMode = .scaleAspectFill
        imgView.image = self.paintImage(color: .red, frame: myframe, paint: changePaint)
            view.addSubview(imgView)
    }
    
    func paintImage(color: UIColor, frame: CGRect, paint: Bool) -> UIImage {
//        let context = UIGraphicsGetCurrentContext()
        
        let ori_img = UIImage(named: "frog")
        let img = ori_img?.cgImage
  
        // select white colors
        let white_mask : [CGFloat] = [222, 255, 222, 255, 222, 255]
        
        // select green colors
        let green_mask : [CGFloat] = [0, 30, 0, 30, 0, 30]
        
        // select black colors
        let black_mask : [CGFloat] = [80, 150, 150, 220, 40, 100]
        
        let keep_green_mask = img!.copy(maskingColorComponents: green_mask)!
        let keep_white_mask = img!.copy(maskingColorComponents: white_mask)!
        let keep_black_mask = img!.copy(maskingColorComponents: black_mask)!
        
//        let keep_only_green =
//        context?.clip(to: frame, mask: keep_green_mask)
//        context!.fill(frame)
//        let remove_green_mask = CGContext.clip(to rect: rect, mask: keep_green_mask)
                
        
        
        let new_green_img = UIImage(cgImage: keep_green_mask)
        let new_white_img = UIImage(cgImage: keep_white_mask)
        let new_black_img = UIImage(cgImage: keep_black_mask)
        
//        let tmp_img = new_black_img.mergeWith(topImage: new_green_img)
        let final_img = new_green_img.tint(color: color)
        if paint {
            return new_black_img
        }
        else {
            return ori_img!
        }
//        layer.contentsGravity = .resizeAspect

    }

}
