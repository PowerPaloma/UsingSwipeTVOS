//
//  CollectionViewCell.swift
//  UsingSwipeTVOS
//
//  Created by Paloma Bispo on 05/04/19.
//  Copyright © 2019 Paloma Bispo. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    let scaleFactor: CGFloat = 1.15
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        image.adjustsImageWhenAncestorFocused = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        if context.nextFocusedView == self {
            UIView.animate(withDuration: 0.2, animations: {
                self.image.transform = self.image.transform.scaledBy(x: self.scaleFactor, y: self.scaleFactor)
                self.image.contentScaleFactor = self.scaleFactor
            })
        }else{
            UIView.animate(withDuration: 0.2) {
                self.image.transform = CGAffineTransform.identity
            }
        }
    }
}
