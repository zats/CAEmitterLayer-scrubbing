// pan from left to right to go from 0 second to 2 seconds in the layer time

import PlaygroundSupport
import UIKit

let container = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
container.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
container.isUserInteractionEnabled = true
PlaygroundPage.current.liveView = container


let emitter = CAEmitterLayer()
emitter.frame = container.bounds
var point = emitter.position
point.y += 80
emitter.emitterPosition = point

let cell = CAEmitterCell()
cell.contents = #imageLiteral(resourceName: "like.png").cgImage

cell.minificationFilter = kCAFilterTrilinear
cell.scale = 0.2
cell.scaleRange = 0.1
cell.scaleSpeed = -0.2

cell.birthRate = 100
cell.lifetime = 3
cell.lifetimeRange = 1

cell.velocity = 200
cell.yAcceleration = -300

cell.alphaRange = 1
cell.alphaSpeed = -0.2

cell.spin = .pi
cell.spinRange = .pi / 2

cell.emissionLongitude = .pi / -2
cell.emissionRange = .pi / 2

emitter.emitterCells = [cell]
emitter.speed = 0.0
container.addGestureRecognizer(UIPanGestureRecognizer { gesture in
  let l = gesture.location(in: container)
  let ratio = l.x / container.frame.width
  emitter.timeOffset = 2 * CFTimeInterval(ratio)
})

container.layer.addSublayer(emitter)

