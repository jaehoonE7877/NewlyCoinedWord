//
//  ViewController.swift
//  NewlyCoinedWord
//
//  Created by Seo Jae Hoon on 2022/07/09.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var textField: UITextField! { didSet { textField.delegate = self} }
    @IBOutlet var hastagButtons: [UIButton]!
    
    
    var newWord : [String : String] = [        "윰차" : "유무차별의 줄임말, 구독자 수의 많고 적음을 뜻"
                                            ,"실매" : "실시간 매니저의 줄임말"
                                            ,"만반잘부" : "만나서 반가워, 잘 부탁해의 줄임말"
                                            ,"꾸안꾸" : "꾸민 듯 안꾸민 듯의 줄임말"
                                            ,"억텐" : "억지 텐션의 줄임말"
                                            ,"당모치" : "당연히 모든 치킨은 옳다의 줄임말"
                                            ,"점메추" : "점심메뉴 추천의 줄임말"
                                            ,"700" : "ㄱㅇㅇ (귀여워)의 초성을 표현한 숫자"
                                            ,"우유남" : "우월한 유전자를 가진 남자의 줄임말"
                                            ,"나일리지" : "나이 + 마일리지의 뜻으로 주로 꼰대를 의미"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designlabel(labelName: resultLabel)
        designTextField(textFieldName: textField)
        designButton(buttonName: hastagButtons)
        
        //버튼 초기화
        hastagButtons[0].setTitle("윰차", for: .normal)
        hastagButtons[1].setTitle("실매", for: .normal)
        hastagButtons[2].setTitle("만반잘부", for: .normal)
        hastagButtons[3].setTitle("꾸안꾸", for: .normal)
        
        
        
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
    
    func designButton(buttonName: [UIButton]){

        for item in hastagButtons {
            
            item.setTitleColor(.black, for: .normal)
            item.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            item.backgroundColor = .systemBackground
            item.layer.cornerRadius = 4
            item.layer.borderColor = UIColor.black.cgColor
            item.layer.borderWidth = 1
        }

    }

    //버튼 타이틀 새로 설정
    func resetButton(button: [UIButton], itemName: String){
        
        for i in 0...2{
        button[i].setTitle(button[i+1].currentTitle, for: .normal)
        }
        button[3].setTitle(itemName, for: .normal)
    }
    
    // 버튼을 누르면 의미 보여주기
    @IBAction func hastagButtonTapped(_ sender: UIButton) {
        guard let meaning = sender.currentTitle else { return }
        resultLabel.text = newWord[meaning]
    }
    
    
    //돋보기 버튼이 눌렸을 때 (신조어의 뜻 ResultLabel에 표현) + button 마지막 label 바꾸는 함수
    @IBAction func SearchButtonTapped(_ sender: UIButton) {
        
        guard let itemName = textField.text else { return }
        resultLabel.text = newWord[itemName]
        resetButton(button: hastagButtons, itemName: itemName)
    }
    
    //tap제스쳐
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

