//
//  InputViewController.swift
//  Mod6Proj
//

import UIKit

class InputViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var switch3: UISwitch!
    @IBOutlet weak var switch4: UISwitch!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = ""
        amountTextField.delegate = self
    }

    // MARK: - Validation
    private func validateInput() -> Int? {
        guard let text = amountTextField.text, !text.isEmpty else {
            errorLabel.text = "Please enter an amount."
            return nil
        }
        guard let amount = Int(text), amount > 0 else {
            errorLabel.text = "Please enter a valid amount."
            return nil
        }
        guard switch1.isOn || switch2.isOn || switch3.isOn || switch4.isOn else {
            errorLabel.text = "Please select at least one currency."
            return nil
        }
        errorLabel.text = ""
        return amount
    }

    // MARK: - Actions
    @IBAction func convertTapped(_ sender: UIButton) {
        view.endEditing(true)
        guard let amount = validateInput() else { return }
        performSegue(withIdentifier: "showResults", sender: amount)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults",
           let resultsVC = segue.destination as? ResultsViewController,
           let amount = sender as? Int {
            resultsVC.usdAmount = amount
            resultsVC.switchStates = [
                switch1.isOn,
                switch2.isOn,
                switch3.isOn,
                switch4.isOn
            ]
        }
    }
}

// MARK: - UITextFieldDelegate
extension InputViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
