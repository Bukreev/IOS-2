
import UIKit

class BenchmarkViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var timers:[TimerItem] = []
    
    
    
    let updateTimerBehavior: UpdateTimersBehavior = UpdateTimersBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTimers()
        addBehaviors(behaviors: [updateTimerBehavior])
    }
    
    func updateCell(_ indexPath:IndexPath) {
        if let cellView = collectionView.cellForItem(at: indexPath) as? TimerViewCell {
            cellView.timerItem = timers[indexPath.row]
        }
    }
    
    func resetTimers() {
        timers.removeAll()
        initTimers()
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "timerViewCell", for: indexPath) as? TimerViewCell {
            cell.timerItem = timers[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        updateTimerBehavior.didSelectTimer(indexPath, timers[indexPath.row])
        updateCell(indexPath)
    }
    
    func initTimers() {
        for _ in 1...30 {
            timers.append(TimerItem())
        }
    }
    
    
}
