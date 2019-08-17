import Foundation

public protocol ImageZoomControllerDelegate: class {

    func didBeginPresentingOverlay(for imageView: UIImageView)
    func didEndPresentingOverlay(for imageView: UIImageView)
    func willDismissOverlay()
    func contentStateDidChange(from fromState: ImageZoomControllerContentState, to toState: ImageZoomControllerContentState)
    func animator(for event: AnimationEvent) -> CanAnimate?
    
    /// Called right before the imageView for which zoombehavior is added is replaced by the overlayImageView
    /// or right before transitioning back from the state in which the scrollable imageView was shown to displaying the original
    /// imageView again.
    ///
    /// - Parameters:
    ///   - overlayImageView: view that mimics the original imageview that appears to be zoomed
    func overlayImageViewWillAppear(_ overlayImageView: UIImageView)
    
    /// Called right before the overlayImageView will stop being displayed, either because the scrollableImageView will be shown.
    /// or because the original imageView will be shown again.
    ///
    /// - Parameters:
    ///   - overlayImageView: view that mimics the original imageview that appears to be zoomed
    func overlayImageViewWillDisappear(_ overlayImageView: UIImageView)
    
    /// Called right before the overlayImageView will stop being displayed and the scrollable imageView will be shown instead
    ///
    /// - Parameters:
    ///   - scrollableImageView: view that mimics the original imageview that appears to be zoomed
    func scrollableImageViewWillAppear(_ scrollableImageView: UIImageView)
    
    /// Called right before the scrollableImageView will stop being displayed, in any case because the overlayImageView will be
    /// displayed again
    ///
    /// - Parameters:
    ///   - scrollableImageView: view that mimics the original imageview that appears to be zoomed
    func scrollableImageViewWillDisappear(_ scrollableImageView: UIImageView)
}

public extension ImageZoomControllerDelegate {
    
    func didBeginPresentingOverlay(for imageView: UIImageView) {}
    func didEndPresentingOverlay(for imageView: UIImageView) {}
    func willDismissOverlay() {}
    func contentStateDidChange(from fromState: ImageZoomControllerContentState, to toState: ImageZoomControllerContentState) {}
    func animator(for event: AnimationEvent) -> CanAnimate? {
        return nil
    }
    func overlayImageViewWillAppear(_ overlayImageView: UIImageView) {}
    func overlayImageViewWillDisappear(_ overlayImageView: UIImageView) {}
    func scrollableImageViewWillAppear(_ scrollableImageView: UIImageView) {}
    func scrollableImageViewWillDisappear(_ scrollableImageView: UIImageView) {}
}
