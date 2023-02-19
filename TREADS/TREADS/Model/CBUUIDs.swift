import Foundation
import CoreBluetooth

struct CBUUIDs{

    static let kBLEService_UUID = "6e400001-b5a3-f393-e0a9-e50e24dcca9e"
    static let kBLE_Characteristic_uuid_Tx = "6e400002-b5a3-f393-e0a9-e50e24dcca9e"
    static let kBLE_Characteristic_uuid_Rx = "6e400003-b5a3-f393-e0a9-e50e24dcca9e"
    static let MaxCharacters = 20

    static let BLEService_UUID = CBUUID(string: kBLEService_UUID)
    static let BLE_Characteristic_uuid_Tx = CBUUID(string: kBLE_Characteristic_uuid_Tx)//(Property = Write without response)
    static let BLE_Characteristic_uuid_Rx = CBUUID(string: kBLE_Characteristic_uuid_Rx)// (Property = Read/Notify)

}
//struct CBUUIDs{
//
//    static let kBLEService_UUID = "97ac466a-c101-7e23-3237-de8bda655f26"
//    static let kBLE_Characteristic_uuid_Tx = "97ac466a-c101-7e23-3237-de8bda655f26"
//    static let kBLE_Characteristic_uuid_Rx = "97ac466a-c101-7e23-3237-de8bda655f26"
//    static let MaxCharacters = 20
//
//    static let BLEService_UUID = CBUUID(string: kBLEService_UUID)
//    static let BLE_Characteristic_uuid_Tx = CBUUID(string: kBLE_Characteristic_uuid_Tx)//(Property = Write without response)
//    static let BLE_Characteristic_uuid_Rx = CBUUID(string: kBLE_Characteristic_uuid_Rx)// (Property = Read/Notify)
//
//}
//struct CBUUIDs{
//
//    static let kBLEService_UUID = "30D8C4EF-A5CB-9869-AC2C-DF51A1C80700"
//    static let kBLE_Characteristic_uuid_Tx = "30D8C4F0-A5CB-9869-AC2C-DF51A1C80700"
//    static let kBLE_Characteristic_uuid_Rx = "30D8C4F1-A5CB-9869-AC2C-DF51A1C80700"
//    static let MaxCharacters = 20
//
//    static let BLEService_UUID = CBUUID(string: kBLEService_UUID)
//    static let BLE_Characteristic_uuid_Tx = CBUUID(string: kBLE_Characteristic_uuid_Tx)//(Property = Write without response)
//    static let BLE_Characteristic_uuid_Rx = CBUUID(string: kBLE_Characteristic_uuid_Rx)// (Property = Read/Notify)
//
//}


