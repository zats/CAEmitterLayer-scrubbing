import UIKit

private var blockKey = 0

public extension UIGestureRecognizer {
  public typealias Handler = (UIGestureRecognizer) -> Void

  public convenience init(handler: Handler) {
    self.init()
    objc_setAssociatedObject(self, &blockKey, handler, .OBJC_ASSOCIATION_COPY_NONATOMIC)
    self.addTarget(self, action: #selector(gestureHandler))
  }

  @objc private func gestureHandler(_ gesture: UIGestureRecognizer) {
    guard let block = objc_getAssociatedObject(self, &blockKey) as? Handler else {
      return
    }
    block(gesture)
  }
}
