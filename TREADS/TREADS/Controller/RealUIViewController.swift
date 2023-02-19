import UIKit
import CoreBluetooth



class RealUIViewController: UIViewController {
    
    @IBOutlet weak var TreadsLabel: UILabel!
    @IBOutlet weak var RunningLabel: UILabel!
    @IBOutlet weak var TemperatureLabel: UILabel!
    @IBOutlet weak var HumidityLabel: UILabel!
    
    var peripheralManager: CBPeripheralManager?
    var peripheral: CBPeripheral?
    var periperalTXCharacteristic: CBCharacteristic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateLabels(notification:)), name: NSNotification.Name(rawValue: "Notify"), object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    @objc func updateLabels(notification: Notification) -> Void{
        let recv = (notification.object! as! NSString)
        if (recv.contains("T")) {
            self.TemperatureLabel.text = "\(recv.substring(from: 1)) °F"
        }
        if (recv.contains("H")) {
            self.HumidityLabel.text = "\(recv.substring(from: 1)) %"
        }

    }

    

}
