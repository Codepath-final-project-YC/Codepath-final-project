//
//  TrackHabitViewController.swift
//  HabitTracker
//
//  Created by Yike Li on 11/29/20.
//

import UIKit

extension UIImage {
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
    
    @IBOutlet weak var viewForLayer: UIView!
    var imgView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupLayer()
//        viewForLayer.layer.addSublayer(layer)
        imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        imgView.contentMode = .scaleAspectFill
        imgView.image = self.setupLayer()
            view.addSubview(imgView)
    }
    
    func setupLayer() -> UIImage {
        
//        layer.frame = viewForLayer.bounds

        let ori_img = UIImage(named: "frog")
        let img = ori_img?.cgImage
  
//        let color = ori_img?.averageColor
//        print("the picked color is: ", color)

//        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
//        color!.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
//
        // select while colors
//        let colormask : [CGFloat] = [222, 255, 222, 255, 222, 255]
        
        // select green colors
        let green_mask : [CGFloat] = [0, 30, 0, 30, 0, 30]
        
        // select black colors
        let black_mask : [CGFloat] = [80, 150, 150, 220, 40, 100]
        
        let keep_green_mask = img!.copy(maskingColorComponents: green_mask)
        
        
        let keep_black_mask = img!.copy(maskingColorComponents: black_mask)
        
        let new_ui_img = UIImage(cgImage: keep_black_mask!)
        let final_img = new_ui_img.tint(color: .red)
        return final_img
//        layer.contentsGravity = .resizeAspect

    }

}
