import UIKit

class JWVideoView: UIView, JWPlayerDelegate {

  // MARK: Properties

  public var imageURL: String?
  public var videoId: String? { didSet { setupPlayer() } }

  private var jwPlayer: JWPlayerController?
  private let jwPlayerURL = "https://content.jwplatform.com/manifests/"
  private var didPause = false

  // MARK: - Initialization

  override init(frame: CGRect) {

    super.init(frame: frame)
    setup()
  }

  convenience init() {

    self.init(frame: CGRect.zero)
  }

  required init?(coder aDecoder: NSCoder) {

    super.init(coder: aDecoder)
    setup()
  }

  // MARK: - Setup

  private func setup() {}

  private func setupPlayer() {

      guard let videoId = self.videoId else { return }

      let playerURL = jwPlayerURL + videoId + ".m3u8"

      let configuration: JWConfig = JWConfig(contentURL: playerURL)
      configuration.controls = true
      configuration.autostart = true
      configuration.image = imageURL

      jwPlayer = JWPlayerController(config: configuration)

      if let player = jwPlayer {

        player.forceFullScreenOnLandscape = true
        player.forceLandscapeOnFullScreen = true
        player.view?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        player.view?.frame = bounds
        player.delegate = self
        player.volume = 0.0
        if let view = player.view {
          addSubview(view)
        }
      }
  }

  // MARK: API

  public func stopPlayingVideo() {

    

    if jwPlayer != nil {

      jwPlayer!.stop()
    }
  }

  // MARK: - JWPlayerDelegate

  internal func onFullscreen(_ status: Bool) {

    if status == false {

      let value = UIInterfaceOrientation.portrait.rawValue
      UIDevice.current.setValue(value, forKey: "orientation")
    }
  }

  internal func onPlayAttempt() {

    if jwPlayer != nil {


    }
  }

  internal func onPlay(_ oldValue: String) {

    if didPause {

      didPause = false


    }
  }

  internal func onPause(_ oldValue: String) {

    didPause = true


  }

  internal func onComplete() {
  }

}
