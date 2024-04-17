//
//  AddRegisterationTableViewController.swift
//  Hotel Codable
//
//  Created by student on 10/04/24.
//

import UIKit

class AddRegisterationTableViewController: UITableViewController {
    //Screen Outlets
    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    
    

    @IBOutlet weak var checkinDateLabel: UILabel!
    
    @IBOutlet weak var checkoutDateLabel: UILabel!
    
    
    @IBOutlet weak var checkinDatePicker: UIDatePicker!
    
    @IBOutlet weak var checkoutDatePicker: UIDatePicker!
    
    let checkInDateLabelIndexPath = IndexPath(row: 0, section: 1)
    let checkinDatePickerIndexPath = IndexPath(row: 1, section: 1)
    let checkOutdateLabelIndexPath = IndexPath(row: 2, section: 1)
    let checkoutDatePickerIndexPath = IndexPath(row: 3, section: 1)
    
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    
    @IBOutlet weak var numberOfChildreLabel: UILabel!
    
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    
    var isCheckinDatePickerVisible : Bool = false {
        didSet{
            checkinDatePicker.isHidden = !isCheckinDatePickerVisible
        }
    }
    var isCheckoutDatePickerVisible : Bool = false{
        didSet{
            checkoutDatePicker.isHidden = !isCheckoutDatePickerVisible
        }
    }
    
    var roomType :RoomType?
    
    func updateCount(){
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildreLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let midnight = Calendar.current.startOfDay(for: Date())
       
        checkinDatePicker.minimumDate = midnight
        print(midnight)
        updateViews()
        updateCount()
       //row , section
        
        
    }

    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        //how to extract text from text fields
        let firstName = FirstNameTextField.text ?? ""
        let lastName = LastNameTextField.text ?? ""
        let email = EmailTextField.text ?? ""
        
        print(firstName,lastName,email)
    }
    
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        updateViews()
        
    }
    
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        updateCount()
    }
    
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> RoomTypeTableViewController? {
        let roomTypeVC = RoomTypeTableViewController(coder: coder)
        roomTypeVC?.delegate = self
        roomTypeVC?.roomType = roomType
        return roomTypeVC
    }
    
    func updateViews(){
        checkoutDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value:1,to: checkinDatePicker.date)
        
        checkinDateLabel.text = checkinDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        
        checkoutDateLabel.text = checkoutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        
    }
   
   //MARK: - Table Deligate Methods
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkinDatePickerIndexPath where isCheckinDatePickerVisible == false: return 0
        case checkoutDatePickerIndexPath where isCheckoutDatePickerVisible == false: return 0
        default: return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkinDatePickerIndexPath: return 190
        case checkoutDatePickerIndexPath: return 190
        default: return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if(indexPath == checkInDateLabelIndexPath && isCheckoutDatePickerVisible == false) {
            isCheckinDatePickerVisible.toggle()
            
        }else if(indexPath == checkOutdateLabelIndexPath && isCheckinDatePickerVisible == false){
            isCheckoutDatePickerVisible.toggle()
        } else if (indexPath == checkOutdateLabelIndexPath || indexPath == checkOutdateLabelIndexPath){
            isCheckinDatePickerVisible.toggle()
            isCheckoutDatePickerVisible.toggle()
        } else { return }
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
}
