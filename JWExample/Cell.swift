import UIKit

class Cell: UICollectionViewCell {

  public var imageURL: String? { didSet { videoView?.imageURL = imageURL } }
  public var videoId: String? { didSet { videoView?.videoId = videoId } }

  @IBOutlet private var videoView: JWVideoView?

  override func prepareForReuse() {
    super.prepareForReuse()

    videoView?.stopPlayingVideo()
  }

  deinit {

    videoView?.stopPlayingVideo()
  }
}
