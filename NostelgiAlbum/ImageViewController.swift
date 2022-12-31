//
//  ImageViewController.swift
//  NostelgiAlbum
//
//  Created by 황지웅 on 2022/12/30.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imageName: String!
    var pinch = UIPinchGestureRecognizer()
    
    var recognizerScale:CGFloat = 1.0
    var maxScale:CGFloat = 2.0
    var minScale:CGFloat = 1.0
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = loadImageFromDocumentDirectory(imageName: imageName)

    }
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer){
        guard imageView != nil else {return}
        
        if pinch.state == .began || pinch.state == .changed{
            if recognizerScale < maxScale && pinch.scale > 1.0 {
                imageView.transform = imageView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
                recognizerScale *= pinch.scale
                pinch.scale = 1.0
            }
            else if recognizerScale > minScale && pinch.scale < 1.0 {
                imageView.transform = imageView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
                recognizerScale *= pinch.scale
                pinch.scale = 1.0
            }
        }
    }
}
