import UIKit

final class ViewController: UICollectionViewController {
  // MARK: - Properties
  private let reuseIdentifier = "Cell"
  private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
  private let itemsPerRow: CGFloat = 3
}

// MARK: - UICollectionViewDataSource
extension ViewController {

  override func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
    return 10
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                  for: indexPath) as! Cell
    cell.backgroundColor = .blue

    cell.imageURL = "https://images.pexels.com/photos/736230/pexels-photo-736230.jpeg"
    cell.videoId = "eNUZIOd2"

    return cell
  }
}
