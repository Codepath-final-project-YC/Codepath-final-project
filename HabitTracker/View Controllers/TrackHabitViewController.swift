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
}
class TrackHabitViewController: UIViewController {

    
    let layer = CALayer()
    
    @IBOutlet weak var viewForLayer: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayer()
        viewForLayer.layer.addSublayer(layer)
    }
    
    func setupLayer() {
        
        layer.frame = viewForLayer.bounds

        let ori_img = UIImage(named: "frog")
        let img = ori_img?.cgImage
  
        let color = ori_img?.averageColor
        print("the picked color is: ", color)

        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        color!.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
//        let colormask : [CGFloat] = [222, 255, 222, 255, 222, 255]
//        let colormask2 : [CGFloat] = [0, 30, 0, 30, 0, 30]
        let colormask3 : [CGFloat] = [80, 150, 150, 220, 40, 100]
        
        print("red", red)
        print("green", green)
        print("blue", blue)
//        let mask = img!.copy(maskingColorComponents: colormask)
//        let mask2 = img!.copy(maskingColorComponents: colormask2)
        let mask3 = img!.copy(maskingColorComponents: colormask3)
        
        CGContextSetRGBFillColor (myContext, 0.6373,0.6373, 0, 1);
        CGContextFillRect(context, rect);
        CGContextDrawImage(context, rect, myColorMaskedImage);
        
        layer.contents = mask3

        layer.contentsGravity = .resizeAspect

    }

}
