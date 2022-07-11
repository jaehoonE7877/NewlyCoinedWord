//
//  ViewController.swift
//  NewlyCoinedWord
//
//  Created by Seo Jae Hoon on 2022/07/09.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var SearchTextField: UITextField! { didSet { SearchTextField.delegate = self} }
    
    
    @IBOutlet var HastagButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designlabel(labelName: ResultLabel)
        designTextField(textFieldName: SearchTextField)
        
        HastagButtons[0].setTitle("윰차", for: .normal)
        HastagButtons[1].setTitle("실매", for: .normal)
        HastagButtons[2].setTitle("만반잘부", for: .normal)
        HastagButtons[3].setTitle("꾸안꾸", for: .normal)

        
        designButton(buttonName: HastagButtons)
    }
        
    func designlabel(labelName: UILabel) {
        
        labelName.text = "결과가 나타남"
        labelName.font = UIFont.systemFont(ofSize: 15)
        labelName.textColor = .black
        labelName.backgroundColor = .systemBackground
    }
    
    func designTextField(textFieldName: UITextField) {
        
        textFieldName.attributedPlaceholder = NSAttributedString(string: "신조어를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textFieldName.textAlignment = .center
        textFieldName.textColor = UIColor.black
        textFieldName.keyboardType = .default
        textFieldName.borderStyle = .line
        textFieldName.layer.borderWidth = 2
        
    }
    
    //textField return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func designButton(buttonName: [UIButton]){

        for item in buttonName{
            item.setTitleColor(.black, for: .highlighted)
            item.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            item.backgroundColor = .systemBackground
            item.layer.cornerRadius = 4
            item.layer.borderColor = UIColor.black.cgColor
            item.layer.borderWidth = 1
        }

    }

    
    // hastag action 설정
    @IBAction func hastag1Tapped(_ sender: UIButton) {
        ResultLabel.text = "유무차별의 줄임말, 구독자 수의 많고 적음을 뜻"
    }
    
    @IBAction func hastag2Tapped(_ sender: UIButton) {
        ResultLabel.text = "실시간 매니저의 줄임말"
    }
    
    @IBAction func hastag3Tapped(_ sender: UIButton) {
        ResultLabel.text = "만나서 반가워, 잘 부탁해의 줄임말"
    }
    
    @IBAction func hastag4Tapped(_ sender: UIButton) {
        ResultLabel.text = "꾸민 듯 안꾸민 듯의 줄임말"
    }
    
    //돋보기 버튼이 눌렸을 때 (신조어의 뜻 ResultLabel에 표현)
    @IBAction func SearchButtonTapped(_ sender: UIButton) {
        
        let itemName = SearchTextField.text
        
        switch itemName{
        case "윰차":
            ResultLabel.text = "유무차별의 줄임말, 구독자 수의 많고 적음을 뜻"
        case "실매":
            ResultLabel.text = "실시간 매니저의 줄임말"
        case "만반잘부":
            ResultLabel.text = "만나서 반가워, 잘 부탁해의 줄임말"
        case "꾸안꾸":
            ResultLabel.text = "꾸민 듯 안꾸민 듯의 줄임말"
        case "억텐":
            ResultLabel.text = "억지 텐션의 줄임말"
        case "당모치":
            ResultLabel.text = "당연히 모든 치킨은 옳다의 줄임말"
        case "점메추":
            ResultLabel.text = "점심메뉴 추천의 줄임말"
        case "700":
            ResultLabel.text = "ㄱㅇㅇ (귀여워)의 초성을 표현한 숫자"
        case "우유남":
            ResultLabel.text = "우월한 유전자를 가진 남자의 줄임말"
        case "나일리지":
            ResultLabel.text = "나이 + 마일리지의 뜻으로 주로 꼰대를 의미"
        default:
            ResultLabel.text = "모르는 단어입니다:("
        }
            
        textFieldShouldReturn(SearchTextField)
        
    }
    
    @IBAction func tapGestureTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    
    //추가사항
    //1. textField, searchButton, resultlabel design
    //2. outletCollectin design
    //3. hastag button IBAction Code 짜기
    //4. textField keyboard 내려가는 tap gesture 추가
}

