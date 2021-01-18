
import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  var video: RTSPPlayer!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let rtspUrl: String = "PUT YOUR URL"
    
    video = RTSPPlayer(video: rtspUrl, usesTcp: false)
    video.outputWidth = Int32(UIScreen.main.bounds.width)
    video.outputHeight = Int32(UIScreen.main.bounds.height)
    video.seekTime(0.0)
    
    let timer = Timer.scheduledTimer(timeInterval: 1.0/30, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
    timer.fire()
  }
  
  @objc func update(timer: Timer) {
    if(!video.stepFrame()){
      timer.invalidate()
      video.closeAudio()
    }
    imageView.image = video.currentImage
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

