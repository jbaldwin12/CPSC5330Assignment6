//
//  ResultsViewController.swift
//  Mod6Proj
//

import UIKit

class ResultsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var usdAmountLabel: UILabel!
    
    @IBOutlet weak var row1StackView: UIStackView!
    @IBOutlet weak var row2StackView: UIStackView!
    @IBOutlet weak var row3StackView: UIStackView!
    @IBOutlet weak var row4StackView: UIStackView!

    @IBOutlet weak var name1Label: UILabel!
    @IBOutlet weak var name2Label: UILabel!
    @IBOutlet weak var name3Label: UILabel!
    @IBOutlet weak var name4Label: UILabel!

    @IBOutlet weak var amount1Label: UILabel!
    @IBOutlet weak var amount2Label: UILabel!
    @IBOutlet weak var amount3Label: UILabel!
    @IBOutlet weak var amount4Label: UILabel!

    // MARK: - Data
    var usdAmount: Int = 0
    var switchStates: [Bool] = [false, false, false, false]

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        displayResults()
    }

    // MARK: - Display
    private func displayResults() {
        usdAmountLabel.text = "$\(usdAmount) USD"

        let currencies = CurrencyModel.currencies
        let rows: [(UIStackView, UILabel, UILabel)] = [
            (row1StackView, name1Label, amount1Label),
            (row2StackView, name2Label, amount2Label),
            (row3StackView, name3Label, amount3Label),
            (row4StackView, name4Label, amount4Label)
        ]

        for (index, (rowStack, nameLabel, amountLabel)) in rows.enumerated() {
            let isOn = index < switchStates.count ? switchStates[index] : false
            rowStack.isHidden = !isOn

            if isOn {
                let currency = currencies[index]
                nameLabel.text = "\(currency.name) (\(currency.symbol))"
                amountLabel.text = "\(CurrencyModel.convert(usd: usdAmount, to: currency)) \(currency.symbol)"
            }
        }
    }
}
