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
    
    
    var myDictionary : KeyValuePairs = ["윰차":"유무차별의 줄임말, 구독자 수의 많고 적음을 뜻"
                                          , "실매" : "실시간 매니저의 줄임말"
                                          , "만반잘부" : "만나서 반가워, 잘 부탁해의 줄임말"
                                          , "꾸안꾸" : "꾸민 듯 안꾸민 듯의 줄임말"
                                          , "억텐" : "억지 텐션의 줄임말"
                                          , "당모치" : "당연히 모든 치킨은 옳다의 줄임말"
                                          , "점메추" : "점심메뉴 추천의 줄임말"
                                          , "700" : "ㄱㅇㅇ (귀여워)의 초성을 표현한 숫자"
                                          , "우유남" : "우월한 유전자를 가진 남자의 줄임말"
                                          , "나일리지" : "나이 + 마일리지의 뜻으로 주로 꼰대를 의미"]
    
    var hastagButtonNums = [0, 1, 2, 3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designlabel(labelName: ResultLabel)
        designTextField(textFieldName: SearchTextField)
        designButton(buttonName: HastagButtons, hasNum: hastagButtonNums)
        
        
        for i in 0...HastagButtons.count - 1 {
            HastagButtons[i].tag = i
        }
        
        
    }
        
    func designlabel(labelName: UILabel) {
        
        labelName.text = "결과가 나타남"
        labelName.font = UIFont.systemFont(ofSize: 15)
        labelName.textColor = .black
        labelName.backgroundColor = .systemBackground
    }
    
    func designTextField(textFieldName: UITextField) {
        
        textFieldName.attributedPlaceholder = NSAttributedString(string: "신조어를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        textFieldName.textAlignment = .center
        textFieldName.textColor = UIColor.black
        textFieldName.font = UIFont.systemFont(ofSize: 20)
        textFieldName.keyboardType = .default
        textFieldName.borderStyle = .bezel
        
    }
    
    
    
    func designButton(buttonName: [UIButton], hasNum: [Int]){

        for i in 0...(HastagButtons.count - 1) {
            
            HastagButtons[i].setTitle(myDictionary[hastagButtonNums[i]].key, for: .normal)
            HastagButtons[i].setTitleColor(.black, for: .normal)
            HastagButtons[i].titleLabel?.font = UIFont.systemFont(ofSize: 15)
            HastagButtons[i].backgroundColor = .systemBackground
            HastagButtons[i].layer.cornerRadius = 4
            HastagButtons[i].layer.borderColor = UIColor.black.cgColor
            HastagButtons[i].layer.borderWidth = 1
        }

    }

    
    
    @IBAction func hastagButtonTapped(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            ResultLabel.text = myDictionary[sender.tag].value
        case 1:
            ResultLabel.text = myDictionary[sender.tag].value
        case 2:
            ResultLabel.text = myDictionary[sender.tag].value
        case 3:
            ResultLabel.text = myDictionary[sender.tag].value
        default:
            ResultLabel.text = "모르는 단어입니다."
        }
    }
    
    func whatWasUsed(_ myDictNum: Int) -> [Int]{
        
        hastagButtonNums.remove(at: 0)
       // print(hastagButtonNums)
        hastagButtonNums.insert(myDictNum, at: hastagButtonNums.endIndex)
        
        return hastagButtonNums
    }
    
    
    //돋보기 버튼이 눌렸을 때 (신조어의 뜻 ResultLabel에 표현)
    @IBAction func SearchButtonTapped(_ sender: UIButton) {
        
        
        guard let itemName = SearchTextField.text else { return }
        
        for (key, value) in myDictionary {
            if itemName == key {
                ResultLabel.text = value
            }
            
            for i in 0...(myDictionary.count - 1) {
                if itemName == myDictionary[i].key {
                    ResultLabel.text = myDictionary[i].value
                    designButton(buttonName: HastagButtons, hasNum: whatWasUsed(i))
                    //print(whatWasUsed((i)))
                }
            }
        }
    }
    
    @IBAction func tapGestureTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    //textField return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    //추가사항
    //1. textField, searchButton, resultlabel design
    //2. outletCollectin design
    //3. hastag button IBAction Code 짜기
    //4. textField keyboard 내려가는 tap gesture 추가
}

