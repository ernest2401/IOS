//
//  PresentationController.swift
//  FluidTransition
//
//  Created by Mikhail Rubanov on 29/06/2019.
//  Copyright © 2019 akaDuality. All rights reserved.
//

import UIKit

class PresentationController: UIPresentationController {
    
    var height: CGFloat!
    
    override var shouldPresentInFullscreen: Bool {
        return false
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        let bounds = containerView!.bounds
        let halfHeight = (containerView?.frame.height)! - height
        return CGRect(x: 0,
                      y: height ,
                      width: bounds.width,
                      height: halfHeight)
        
    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        containerView?.addSubview(presentedView!)
    }
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    var driver: TransitionDriver!
    override func presentationTransitionDidEnd(_ completed: Bool) {
        super.presentationTransitionDidEnd(completed)
        
        if completed {
            driver.direction = .dismiss
        }
    }
}
