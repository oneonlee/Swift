# Swift - Ramen Timer
* 스파르타코딩클럽 - iOS 앱개발 기초반을 수강하면서 배우는 Swift

## [2주차 (2)](https://www.notion.so/iOS-2-4ee47ef3612d4efca430e784f0ec3bb8)

<img src="https://user-images.githubusercontent.com/73745836/122509209-5a82bf80-d03e-11eb-9672-0fede175a5a0.png" width="20%" height="20%">

## 5. Swift 심화 문법 - 옵셔널 `?`
먼저 옵셔널이 무엇인지 본격적으로 알아보기 전에 아래의 코드를 한 번 살펴보자.

```swift
var someFruits = ["딸기", "사과", "망고", "수박", "복숭아"]
print(someFruits.first) // Optional("딸기")

someFruits = []
print(someFruits.first) // nil
```

Q. 옵셔널이란?

A. 옵셔널은 '값이 채워져 있을 수도 있고, 비어 있을 수도 있다' 라는 뜻이다. Swift는 어떤 변수의 값이 비어있다면 ``nil``이라고 표현한다. (다른 언어에서는 ``null`` 이라고 히는 그것.) 그리고 Swift에서는 어떤 변수가 비어 있을 수도 있다면 명시적으로 해당 변수가 ``Optional`` 이라고 선언해 주어야 한다.

선언은 해당 타입에 물음표(`?`)를 붙여줍니다.

```swift
var someValue: String? = "어떤 값"
someValue = nil
someValue = "다른 값"

var anotherValue: String = "또 어떤 값"
anotherValue = "또 다른 값"
anotherValue = nil // error! String 으로 선언된 값은 nil 이 될 수 없습니다
```

그래서 옵셔널 즉 물음표(`?`) 를 보면

> 오 이 변수는 `nil` 일지도`?`

라고 생각해보자.


Q: 옵셔널을 쓰는 이유가 무엇일까요?

A: 태초에는 **비어 있는 값**이라는 개념이 없었다. 그래서 C언어와 그 이전 언어에서는 `0`과 같은 값을 **비어 있는 값**이라고 약속하곤 했다. 그 뒤로 자바 정도의 언어에서는 `null` 이라는 값이 도입되었고, 이를 통해 해당 변수가 비어 있는지를 확인할 수 있었다. 하지만 여기서 문제가 발생했다. 해당 변수가 `null` 인지 모르기 때문에 이를 확인하는 코드를 매번 작성해야 했다. 이 때문에 **코드가 쓸데없이 길어지게** 되었다. 그래서 Swift 정도의 언어에서는 Optional 이라는 개념을 도입하였다. 코드를 봤을 때 언어 단계에서 이 변수가 `nil(null)`  일 가능성이 있는지 미리 알고 시작한다. `nil` 이 아니라고 확신하는 곳에는 굳이 값이 비어 있는지 **확인할 필요가 없어졌다!**

옵셔널은 이런 특징들이 있다. 

```swift
//옵셔널 체인(Optional Chaining): 어디에선가 한번 nil이면 그 뒤로 쭉 nil
var someFruits = ["딸기", "사과", "망고", "수박", "복숭아"]
print(someFruits.**first?.count**) // Optional(2)

someFruits = []
print(someFruits.**first?.count**) // nil

//옵셔널 강제 해제: 옵셔널인 변수를 nil 이 될 리 없다고 확인시켜주는 느낌표 !
var obviousFruit: String = someFruit.first**!
print(obviousFruit) // 딸기**
```

그래서 옵셔널 근처에서 느낌표(!) 를 보면

> 이 변수는 `nil`이 아니야`!`

라고 생각해보자.

- `!` 더 자세히 알아보기

    변수의 옵셔널 관련된 선언은 사실 3가지가 있다.

    ```swift
    //살짝만 살펴보고 이해가 안 된다 싶으면 너무 고민하지 말고 넘어가기!

    var value: Int = 3 
    var valueToBeSet: Int! = 4
    var valueCanBeNil: Int? = 5

    value = nil // 에러!
    valueToBeSet = nil // 가능
    valueCanBeNil = nil // 가능

    value = valueToBeSet // 가능
    value = valueCanBeNil // 불가능
    value = valueCanBeNil! // 가능
    ```

    변수 뒤에 `?` 대신 `!` 가 붙어서 선언된 친구들이 종종 있다. 

    사실  `!`는 Optional과 Non-Optional 사이 어딘가입니다. 프로그래머 입장에서 처음부터 모든 변수에 값을 넣는 게 어려울 때도 있다. 하지만 변수를 선언한 직후 대부분은 값을 바로 넣기 때문에 `!`는 변수가 `nil` 일 확률이 매우 작은 경우에 사용하곤 한다.

    그럼 처음부터 변수를 Optional 로 선언하면 되는 거 아니냐고 생각할 수도 있다.

    그건 프로그래머들 사이에서도 의견이 분분하지만.. **지금 당장은 값이 없지만 곧 값이 채워질 변수** 라고 생각해면 된다. ~~라고 한다.~~
    
## 6. Swift 심화 문법 - 구조체(Struct)와 클래스(Class)
Swift가 객체지향 프로그래밍(OOP; Object-Oriented Programming) 언어라고 했던 것 기억하나?

지금까지 우리는 크게 생각하지 않고 `.` 이라는 연산자를 쓰곤 했다. `a.b` 라고 한다면, `a`의 하위 속성인 `b`를 언급하는 것이다. 혹은 `a.c()` 처럼 `a`에게 `c라는 함수`를 실행시키라고 명령하기도 했다. 그 이유를 여기서 다뤄보도록 하겠다. 진지하게 다루면 무척이나 심오한 영역이 될 수도 있어서, 가벼운 마음으로 설명을 들어보고 재미없거나 어렵다면 섣불리(?) 포기하기 바란다.

일단 구조체(Struct)와 클래스(Class)의 코드를 한 번 살펴보자.

- 구조체(Struct)

```swift
struct Work {
    var task: String
    var hoursToDo: Int
}

var firstWork = Work(task: "강의자료 작성하기", hoursToDo: 3)
var secondWork = Work(task: "분리수거 하기", hoursToDo: 1)
```

- 클래스(Class)

```swift
class Student {
    var name: String
    var house: String

    init(name: String, house: String) {
        self.name = name
        self.house = house
    }
}

var joo = Student(name: "주정한", house: "슬리데린")
var kim = Student(name: "김민주", house: "그리핀도르")
```

구조체와 클래스...  둘이 무척 비슷해 보이지 않는가?
사실 이 둘은 많은 공통점을 지니고 있다. 어떤 공통점이 있는지 알아보자.

- 자신 있게 공통점 알아보기
  1. 구조체와 클래스 모두 내부에 변수(프로퍼티)를 가질 수 있고 `.` 연산자를 통해 접근한다.

```swift
struct Work {
    var task: String
    var hoursToDo: Int
}

class Student {
    var name: String
    var house: String

    init(name: String, house: String) {
        //클래스 내부에서 self 라는 키워드는 본인 스스로를 의미한다.
        //init의 매개변수로 받은 name 과 프로퍼티인 name 을 구별하기 위해서
        //self라는 키워드를 사용하였다. 
        self.name = name
        self.house = house
    }
}
```

  2. 구조체와 클래스 모두 내부에 함수(메소드)를 가질 수 있고 `.` 연산자를 통해 접근한다.

```swift
struct Work {
    var task: String
    var hoursToDo: Int

    func alert() {
        // 문자열 안에 (변수) 로 해당 변수 값을 쉽게 끼워넣을 수 있다.
        print("\(task)가 앞으로 \(self.hoursToDo) 시간 더 해야 합니다.")
        // 구조체(or 클래스) 내부의 함수에서는 self 라는 단어로 자신의 변수, 함수에 접근한다.
        // 하지만 모호하지 않은 경우엔 self 를 생략해도 된다. 
    }
}

var firstWork = Work(task: "강의자료 작성하기", hoursToDo: 3)
firstWork.alert() // 강의자료 작성하기가 앞으로 3 시간 더 해야 합니다.

class Student {
    var name: String
    var house: String

    init(name: String, house: String) {
        self.name = name
        self.house = house
    }

    func introduce() {
        print("\(house) 기숙사에 사는 \(name) 입니다")
    }
}

var joo = Student(name: "주정한", house: "슬리데린")
joo.introduce() // 슬리데린 기숙사에 사는 주정한 입니다
```

  그리고 이 둘은 공통점뿐만 아니라 차이점도 갖고 있다!

- 구조체의 특징 알아보기 (읽기 전에 심호흡할 것)

```swift
struct Work {
    var task: String
    var hoursToDo: Int
}

//1. 구조체는 init 함수를 만들지 않아도 자동으로 만들어준다. 
var firstWork = Work(task: "강의자료 작성하기", hoursToDo: 3)
var secondWork = Work(task: "분리수거 하기", hoursToDo: 1)

//2. 구조체를 대입하면 그 '값'을 복제한다.
var firstWorkCopy = firstWork

//3. 원본 구조체 변수에 접근해서 값을 변경해보자.
firstWork.hoursToDo -= 1

//원본과 복사본 둘이 서로 다른 값을 가진다.
print(firstWork) //  Work(task: "강의자료 작성하기", hoursToDo: 2)
print(firstWorkCopy) // Work(task: "강의자료 작성하기", hoursToDo: 3)
```

- 클래스의 특징 알아보기 (후하 후하)

```swift
class Student {
    var name: String
    var house: String

    init(name: String, house: String) {
        self.name = name
        self.house = house
    }

    func introduce() {
        print("\(house) 기숙사에 사는 \(name) 입니다")
    }
}

// 1. 클래스는 init 함수를 꼭 만들어 주어야 한다.
var joo = Student(name: "주정한", house: "슬리데린")

// 2. 클래스를 대입하면 복제인간을 만드는 게 아니라 그냥 별명을 하나 새로 붙인다 정도
var anotherJoo = joo
joo.introduce() // 슬리데린 기숙사에 사는 주정한 입니다
anotherJoo.introduce() // 슬리데린 기숙사에 사는 주정한 입니다

joo.house = "레번클로" // 전학(?)
joo.introduce() // 레번클로 기숙사에 사는 주정한 입니다
anotherJoo.introduce() // 레번클로 기숙사에 사는 주정한 입니다
```

## 7. 라면 타이머 앱 만들기
### 스토리보드 세팅하기
1. Main.storyboard

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F449cf147-bf4b-4d89-94a4-f14bec87266b%2FUntitled.png?table=block&id=48d6f356-84e4-4f92-945b-35e827e16de8&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=580&userId=&cache=v2)

2. LaunchScreen.storyboard

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4c1d186a-1334-4e31-b325-18812b5357c3%2FUntitled.png?table=block&id=205824cb-d10d-46d2-9287-fbedeb5c95c5&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=580&userId=&cache=v2)

3. @IBOutlet, @IBAction 연결하기

```swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
				
				// Do any additional setup after loading the view.
    }

    
    @IBAction func timerButtonClicked(_ sender: Any) {
        
    }
}
```

### 코드 작성하기
1. 버튼에 코너 라운드 넣기
```swift
override func viewDidLoad() {
    super.viewDidLoad()
    timerButton.layer.cornerRadius = 10
}
```

2. 버튼 누르면 타이머 시작하기
```swift
var secondsLeft: Int = 10 //원래는 180초지만, 10초로 테스트 하기
    
@IBAction func timerButtonClicked(_ sender: Any) {
    //1초마다 타이머 반복 실행
    Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
        //남은 시간(초)에서 1초 빼기
        self.secondsLeft -= 1
        
        //남은 분
        var minutes = self.secondsLeft / 60
        //그러고도 남은 초
        var seconds = self.secondsLeft % 60
        
        //남은 시간(초)가 0보다 크면
        if self.secondsLeft > 0 {
            self.timerLabel.text = "\(minutes):\(seconds)"
        } else {
            self.timerLabel.text = "시간 끝!"
        }
    })
}
```

3. 분이랑 초가 2자리씩 나오게 하기
```swift
self.timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
```

4. 타이머니까 중간에 버튼을 누르면 타이머가 종료되게 해보기
  1. 먼저 함수로 라벨을 표시하는 함수를 분리합시다
```swift
func updateSecondsLabel() {
  //남은 분
  var minutes = self.secondsLeft / 60
  //그러고도 남은 초
  var seconds = self.secondsLeft % 60
    
  //남은 시간(초)가 0보다 크면
  if self.secondsLeft > 0 {
      self.timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
  } else {
      self.timerLabel.text = "시간 끝!"
  }
}
```

  2. 리셋하는 함수를 만들어보자
```swift
func resetTimer() {
		//타이머 종료하기
    self.timer?.invalidate()
		//타이머 없애기
    self.timer = nil
		//타이머가 종료되었으므로 버튼을 '시작하기'로 바꾸기
    self.timerButton.setTitle("타이머 시작하기", for: .normal)
}
```

  3. 타이머 함수 다시 쓰기
```swift
@IBAction func timerButtonClicked(_ sender: Any) {
  //타이머가 안 비어있으면 타이머 종료!
  if timer != nil {
    //타이머를 리셋해주기
    self.resetTimer()
    self.timerButton.setTitle("타이머 시작하기", for: .normal)
    //종료니까 그 뒤로 동작하면 안되므로 return 해줌
    return
  }
  
  //타이머가 비어있을때는 타이머 시작!
  self.timerButton.setTitle("타이머 종료하기", for: .normal)
  //시간을 세팅
  self.secondsLeft = 10 //180초지만 10초로 테스트
  
  self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
    self.secondsLeft -= 1
    self.updateSecondsLabel()
    
    //시간이 끝나면
    if self.secondsLeft == 0 {
        //타이머 리셋
        self.resetTimer()
    }
  })
}
```

5. [옵션] 시간 돌아가는 애니메이션 넣기

```swift
func updateSecondsLabel() {
  var minutes = self.secondsLeft / 60
  var seconds = self.secondsLeft % 60
  
  if self.secondsLeft < 60 {
    self.timerLabel.textColor = UIColor(red: 0.94, green: 0.07, blue: 0.07, alpha: 1.00)
  } else {
    self.timerLabel.textColor = UIColor.black
  }
  
  
  UIView.transition(with: self.timerLabel, duration: 0.3, options: .transitionFlipFromBottom) {
    if self.secondsLeft > 0 {
      self.timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
    } else {
      self.timerLabel.text = "시간 끝!"
    }
  } completion: { (animated) in
      
  }
}
```

## 8. Segment로 시간 선택 옵션 넣어보기
1. Segment Control을 이용한다.

![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F3667aebf-b3f3-490e-85f0-063bfbfb5ac4%2FUntitled.png?table=block&id=ca732483-5d61-4726-80b6-ae5e768a9c59&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=960&userId=&cache=v2)

  * 세그멘트 컨트롤은 오른쪽 화면에서 개수(Segments)와 각 메뉴별(Segment) 텍스트를 정할 수 있다!
  
  ![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F87206cc4-5309-446a-a43b-d368b653eea3%2FUntitled.png?table=block&id=17ebac40-0cff-4146-a686-5807b9b4a1d3&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=480&userId=&cache=v2)
  
2. Segment 를 @IBAction 으로 가져올때는 Value Changed 를 선택하고, 선택된 값은 `selectedSegmentIndex`로 가져온다. 

```swift
@IBOutlet weak var segmentControl: UISegmentedControl!

@IBAction func segmentValueChanged(_ sender: Any) {
    print(segmentControl.selectedSegmentIndex)//선택에 따라 0, 1, 2
}
```

3. 코드 작성 (ViewController)
```swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerButton: UIButton!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var secondsLeft: Int = 180
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timerButton.layer.cornerRadius = 10
        
        self.updateTimeLeft()
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
        timerButton.setTitle("타이머 시작하기", for: .normal)
    }
    
    func updateTimerLabel() {
        var minutes = self.secondsLeft / 60
        var seconds = self.secondsLeft % 60
        
        if self.secondsLeft < 10 {
            self.timerLabel.textColor = UIColor.red
        } else {
            self.timerLabel.textColor = UIColor.black
        }
        
        
        UIView.transition(with: self.timerLabel, duration: 0.3, options: .transitionFlipFromBottom) {
            if self.secondsLeft > 0 {
                self.timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
            } else {
                self.timerLabel.text = "시간 끝!"
            }
        } completion: { (animated) in
            
        }
    }

    func updateTimeLeft() {
        self.secondsLeft = 180 + segment.selectedSegmentIndex * 60
        self.updateTimerLabel()
    }
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        self.resetTimer()
        self.updateTimeLeft()
    }
    
    @IBAction func timerButtonClicked(_ sender: Any) {
        if timer != nil {
            resetTimer()
            return
        }
        
        self.timerButton.setTitle("타이머 종료하기", for: .normal)
        self.updateTimeLeft()
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (t) in
            self.secondsLeft -= 1
            self.updateTimerLabel()
            
            if self.secondsLeft == 0 {
                self.resetTimer()
            }
        }
    }
}
```
