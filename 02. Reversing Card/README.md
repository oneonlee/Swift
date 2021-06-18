# Swift - Reversing Card
* 스파르타코딩클럽 - iOS 앱개발 기초반을 수강하면서 배우는 Swift

## [2주차 (1)](https://www.notion.so/iOS-2-4ee47ef3612d4efca430e784f0ec3bb8)

<img src="https://user-images.githubusercontent.com/73745836/122509454-c5cc9180-d03e-11eb-8aab-7355d412b3e3.png" width="20%" height="20%"> <img src="https://user-images.githubusercontent.com/73745836/122509459-c9601880-d03e-11eb-996b-5f9fbe9e00e6.png" width="20%" height="20%">

## 1. Swift 기본 문법 - 조건문
* 20 보다 작으면 청소년, 크면 성인이라고 알려주는 코드
``` Swift
var age = 30

if age > 20 {
    print("성인이에요")
} else {
    print("청소년이에요")
}
```

* 조건이 여러 개일 경우 사용할 수 있는 if, else if, else
``` Swift
var fruitName = "사과"

if fruitName == "사과" {
    print("제가 좋아하는 사과네요!")
} else if fruitName == "딸기" {
    print("딸기는 논산 딸기")
} else if fruitName == "수박" {
    print("여름은 역시 수박!")
} else {
    print("다른 과일들도 맛있죠!")
}
```
* switch문
``` Swift
var fruitName = "사과"

switch fruitName {
case "사과":
    print("제가 좋아하는 사과네요!")
case "딸기":
    print("딸기는 논산 딸기")
case "수박":
    print("여름은 역시 수박!")
default:
    print("다른 과일들도 맛있죠!")
}
```

## 2. Swift 기본 문법 - 반복문
* 0부터 **99까지** 출력해 주는 코드
```swift
for i in 0..<100 {
    print(i)
}

//이거면 단 3줄 만에 출력할 수 있습니다!
```

* 0부터 100까지 출력해 주는 코드
``` Swift
for i in 0...100 {
    print(i)
}

//어떤 차이인지 눈에 보이시죠?
```

* 리스트와 반복문
``` Swift
var people = ["철수","영희","민수","형준","기남","동희"]

for person in people {
    print(person)
}

//Swift 는 참 편리합니다. 알아서 철수, 영희, 민수, 형준... 
//순서대로 person 에 문자열 값을 넣어줍니다
```
``` swift
var people = ["철수","영희","민수","형준","기남","동희"]

for i in 0..<people.count {
		var person = people[i] // people 리스트의 i 번째 요소 가져오기
    print(person)
}

//이렇게 쓸 수도 있지만, 편한 방법이 더 좋겠죠?
```

## 3. UI 컴포넌트로 조건문 연습해보기
스토리보드 세팅 후, ...
1. 여기서부터 시작
```swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonDidClick(_ sender: Any) {
    }
    
}
```

2. '뒤집힌 상태' 를 저장하는 변수 만들기
```swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var isBackSide = true
    
    @IBAction func buttonDidClick(_ sender: Any) {
    }
    
}
```

3. '뒤집힌 상태' 에 따라 이미지 넣어주기
```swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var isBackSide = true
    
    @IBAction func buttonDidClick(_ sender: Any) {
        if isBackSide {
            imageView.image = UIImage(named: "ace")
        } else {
            imageView.image = UIImage(named: "poker")
        }
        
        isBackSide = !isBackSide // true | false 를 뒤집어줍니다
    }
    
}
```

4. 카드 뒤집는 애니메이션 맛보기
```swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var isBackSide = true
    
    @IBAction func buttonDidClick(_ sender: Any) {
        UIView.transition(with: imageView, duration: 0.6, options: .transitionFlipFromLeft) {
            if self.isBackSide {
                self.imageView.image = UIImage(named: "ace")
            } else {
                self.imageView.image = UIImage(named: "poker")
            }
        } completion: { (finished) in
            self.isBackSide = !self.isBackSide
        }
    }
    
}
```

## 4. UI 컴포넌트로 반복문 연습해보기
### 텍스트 필드 자동 입력하기
* 프로젝트 및 스토리보드 준비
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F17bc88f6-8b5f-42b7-8525-100a645186f9%2FUntitled.png?table=block&id=3902f3a3-e48c-4661-a3f8-ef9c239fb78e&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=4940&userId=&cache=v2)

* 자동 입력하기 버튼 구현하기
1. 모든 UITextField에 텍스트 입력하기
```swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet var textFields: [UITextField]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func autoInputButtonDidClick(_ sender: Any) {
        for textField in textFields {
            textField.text = "모두 텍스트가 들어갑니다"
        }
    }
    
}
```
2. 홀수 번째 UITextField에만 텍스트 입력하기
```swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet var textFields: [UITextField]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func autoInputButtonDidClick(_ sender: Any) {
        var i = 0 // 프로그래밍 언어에서는 0번째부터 시작입니다!
        for textField in textFields {
            if i % 2 == 1 {   // a % b 는 a를 b로 나눴을 때 나머지를 계산해줍니다!
                textField.text = "홀수번째 텍스트가 들어갑니다"
            }
            i += 1
        }
    }
}
```
아래와 같이 작성해도 똑같은 결과가 나온다.
```swift
//정확하게 같은 의미입니다!

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textFields: [UITextField]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func autoInputButtonDidClick(_ sender: Any) {
        for i in 0..<textFields.count {
            var textField = textFields[i]
            if i % 2 == 1 {
                textField.text = "홀수 번째 텍스트가 들어갑니다"
            }
        }
    }
}
```


