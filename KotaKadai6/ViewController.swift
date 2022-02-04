//
//  ViewController.swift
//  KotaKadai6
//
//  Created by 前田航汰 on 2022/02/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var randomNumberTextField: UILabel!
    @IBOutlet weak private var aboutNumberSlider: UISlider!

    private var randomNumberInt = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        makeRandomNum()
    }

    @IBAction private func didTapJudgeButton(_ sender: Any) {
        let aboutNumInt = Int(round(aboutNumberSlider.value))

        if randomNumberInt == aboutNumInt {
            presentAlert(judge: "あたり！", yourValue: aboutNumInt)
        } else {
            presentAlert(judge: "はずれ！", yourValue: aboutNumInt)
        }
    }

    private func presentAlert(judge: String, yourValue: Int) {
            let alert = UIAlertController(
                title: "結果",
                message: """
                \(judge)
                あなたの値:  \(String(yourValue))
                """,
                preferredStyle: .alert)

            let retry = UIAlertAction(
                title: "再挑戦",
                style: .default,
                handler: { [weak self] _ in self?.makeRandomNum() })
                alert.addAction(retry)

            present(alert, animated: true, completion: nil)
        }

    // ランダムな数字を表示・作成
    private func makeRandomNum() {
        let randomNumberInt = Int.random(in: 1...100)
        randomNumberTextField.text = String(randomNumberInt)
    }

}
