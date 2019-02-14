import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type, reuseIdentifier: String? = nil) {
        self.register(T.self, forCellWithReuseIdentifier: reuseIdentifier ?? String(describing: T.self))
    }
    
    func dequeue<T: UICollectionViewCell>(_: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else { fatalError("Could not deque cell with type \(T.self)") }
        
        return cell
    }
    
    func registerHeader<T: UICollectionReusableView>(_: T.Type, reuseIdentifier: String? = nil) {
        self.register(T.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: reuseIdentifier ?? String(describing: T.self))
    }
    
    func dequeueHeader<T: UICollectionReusableView>(_: T.Type, for indexPath: IndexPath) -> T {
        guard let header = dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else { fatalError("Could not deque cell with type \(T.self)") }
        return header
    }
    
    func registerFooter<T: UICollectionReusableView>(_: T.Type, reuseIdentifier: String? = nil) {
        self.register(T.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: reuseIdentifier ?? String(describing: T.self))
    }
    
    func dequeueFooter<T: UICollectionReusableView>(_: T.Type, for indexPath: IndexPath) -> T {
        guard let footer = dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else { fatalError("Could not deque cell with type \(T.self)") }
        return footer
    }
}