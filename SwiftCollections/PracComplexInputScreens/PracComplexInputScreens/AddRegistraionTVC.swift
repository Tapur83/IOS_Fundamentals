//
//  AddRegistraionTVC.swift
//  PracComplexInputScreens
//
//  Created by Akshit Goyal on 27/08/25.
//

import UIKit

class AddRegistraionTVC: UITableViewController, SelectRoomTypeTVC.SelectRoomTypeTVCD {
    func selectRoomTypeTVC(_ controller: SelectRoomTypeTVC, didSelect roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
    
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var noOfAdultsLabel: UILabel!
    
    @IBOutlet weak var noOfChildrenLabel: UILabel!
    
    @IBOutlet weak var noOfAdultsStepper: UIStepper!
    
    @IBOutlet weak var noOfChildrenStepper: UIStepper!
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    var roomType: RoomType?
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    let checkInDatePickerLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let checkOutDatePickerLabelCellIndexPath = IndexPath(row: 2, section: 1)
    
    
    var isCheckInDatePickerVisible: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }
    
    var isCheckOutDatePickerVisible: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    
    var registration: Registration?{
        guard let roomType = roomType else{return nil}
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let address = addressTextField.text ?? ""
        
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        
        let numberOfAdults = Int(noOfAdultsStepper.value)
        let numberOfChildren = Int(noOfChildrenStepper.value)
        
        let hasWifi = wifiSwitch.isOn
       
        return Registration(firstName: firstName, lastName: lastName, emailAddress: address, checkInDate: checkInDate, checkOutDate: checkOutDate, numberOfAdults: numberOfAdults, numberOfChildren: numberOfChildren, wifi: hasWifi, roomType: roomType)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
        updateDateViews()
        updateNumberOfGuests()
        updateRoomType()
    }
    
    
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> SelectRoomTypeTVC? {
        
        let selectRoomTypeController = SelectRoomTypeTVC(coder: coder)
        selectRoomTypeController?.delegate = self
        selectRoomTypeController?.roomType = roomType
        
        return selectRoomTypeController
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
            
        case checkInDatePickerCellIndexPath where isCheckInDatePickerVisible == false:
            return 0
            
        case checkOutDatePickerCellIndexPath where isCheckOutDatePickerVisible == false:
            return 0
            
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
            
        case checkInDatePickerCellIndexPath:
            return 190
            
        case checkOutDatePickerCellIndexPath:
            return 190
            
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath == checkInDatePickerLabelCellIndexPath && isCheckOutDatePickerVisible == false {
            isCheckInDatePickerVisible.toggle()
        } else if indexPath == checkOutDatePickerLabelCellIndexPath && isCheckInDatePickerVisible == false {
            isCheckOutDatePickerVisible.toggle()
        } else if indexPath == checkInDatePickerLabelCellIndexPath || indexPath == checkOutDatePickerLabelCellIndexPath {
            isCheckInDatePickerVisible.toggle()
            isCheckOutDatePickerVisible.toggle()
        } else {
            return
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
//    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
//        let firstName = firstNameTextField.text ?? ""
//        let lastName = lastNameTextField.text ?? ""
//        let address = addressTextField.text ?? ""
//        
//        let checkInDate = checkInDatePicker.date
//        let checkOutDate = checkOutDatePicker.date
//        
//        let numberOfAdults = Int(noOfAdultsStepper.value)
//        let numberOfChildren = Int(noOfChildrenStepper.value)
//        
//        let hasWifi = wifiSwitch.isOn
//        let roomChoice = roomType?.name ?? "Not Set"
//
//        
//        print("Tapped DONE!")
//        print("First Name: \(firstName)")
//        print("Last Name: \(lastName)")
//        print("Address: \(address)")
//        print("check-In: \(checkInDate)")
//        print("check-Out: \(checkOutDate)")
//        print("numberOfAdults: \(numberOfAdults)")
//        print("numberOfChildren: \(numberOfChildren)")
//        print("wifi: \(hasWifi)")
//        print("roomType: \(roomChoice)")
//    }
//    
    @IBAction func updateDateViews() {
        
        checkOutDatePicker.minimumDate = Calendar.current.date(byAdding: .day,value: 1, to: checkInDatePicker.date)
        
        checkInDateLabel.text = checkInDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        
        checkOutDateLabel.text = checkOutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }
    
    
    func updateNumberOfGuests(){
        noOfAdultsLabel.text = "\(Int(noOfAdultsStepper.value))"
        noOfChildrenLabel.text = "\(Int(noOfChildrenStepper.value))"
    }
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
    }
    
    func updateRoomType(){
        if let roomType = roomType{
            roomTypeLabel.text = roomType.name
        }else{
            roomTypeLabel.text = "Not Set"
        }
    }
    
    
 
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
