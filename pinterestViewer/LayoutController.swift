//
//  LayoutController.swift
//  pinterestViewer
//
//  Created by Srinivas, Thirumalaa on 3/3/15.
//  Copyright (c) 2015 Srinivas, Thirumalaa. All rights reserved.
//
import UIKit

let reuseIdentifier = "collCell"

class LayoutController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    let titles = [
        "Creative",
        "Intellect",
        "Leader",
        "Adventurer",
        "Tinkerer",
        "Maker"
    ]
    let pictures = [
        "creative_typewriter_square_blur",
        "intellect_coffee_square_blur",
        "royal_tiger_square_blur",
        "adventurer_paddler_square_blur",
        "tinkerer_camera_square_blur",
        "maker_mac_square_blur"
    ]
    let icons = [
        "pen_L",
        "glasses_L",
        "crown_L",
        "map_L",
        "wrench_L",
        "iMac_L"
    ]
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> CollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collCell", forIndexPath: indexPath) as CollectionViewCell
        
        var title = self.titles[indexPath.row]
        var picture = self.pictures[indexPath.row]
        var icon = self.icons[indexPath.row]
        
        cell.title.text = self.titles[indexPath.row]
        
        let imgName = "\(picture).jpg"
        cell.pinImage.image = self.imageResize(UIImage(named: imgName)!, sizeChange: CGSizeMake(screenWidth/2, screenWidth/2))
        
        let iconName = "\(icon).png"
        cell.iconImage.image = UIImage(named: iconName)
        
        return cell
    }
    
    func imageResize (imageObj:UIImage, sizeChange:CGSize)-> UIImage{
        
        let hasAlpha = false
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
        imageObj.drawInRect(CGRect(origin: CGPointZero, size: sizeChange))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
            return CGSize(width: screenWidth/2, height: screenWidth/2);
    }
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
    }
    
}