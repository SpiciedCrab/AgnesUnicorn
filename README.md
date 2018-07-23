# Agnes
[![CI Status](https://img.shields.io/travis/magic_harly@hotmail.com/AgnesUnicorn.svg?style=flat)](https://travis-ci.org/magic_harly@hotmail.com/AgnesUnicorn)
[![Version](https://img.shields.io/cocoapods/v/AgnesUnicorn.svg?style=flat)](https://cocoapods.org/pods/AgnesUnicorn)
[![License](https://img.shields.io/cocoapods/l/AgnesUnicorn.svg?style=flat)](https://cocoapods.org/pods/AgnesUnicorn)
[![Platform](https://img.shields.io/cocoapods/p/AgnesUnicorn.svg?style=flat)](https://cocoapods.org/pods/AgnesUnicorn)

![](https://imgsa.baidu.com/baike/pic/item/d1a20cf431adcbeffdb795a3a6af2edda2cc9f90.jpg)

## Situration

The simple requirement is like:
![](https://ws2.sinaimg.cn/large/006tKfTcgy1ftjxewsb9ug309x0hxdgg.gif)

In MVVM with RxSwift,  we may face the situation below:
![](https://ws4.sinaimg.cn/large/006tKfTcgy1ftjwu3t0wyj31kw0zk10j.jpg)

If we can use the instance of viewModelA in ControllerB, it will be excellent! But they are in the different modules, and the import actions is unavailable due to our infrastructure guidline.

> Actually, even A and B are both in the same module, the reference of ViewModelA in ControllerB is also not of elegance.



## Usage

Agnes makes your viewModels in different Modules or Components to interact with each other like normal bindings in MVVM.

So in your ViewModelA , you just need to call the `donate` method with a common key to keep the current `signal` , then others can `onNext` or make something to `bindTo` it.


	extension String : Unicorn
	{
	    
	}
	
	
	class ViewModel : NSObject {
	    
	    let input: PublishRelay<String> = PublishRelay()
	    
	    let output: PublishRelay<String> = PublishRelay()
	    
	    override init() {
	        super.init()
	        input.donate(key: key, to: agnes).bind(to: output)
	    }
	}

> All the generic type T in PublishRelay<T> should impletment `Unicorn` , which is Agnes's belief~.

Then we can call the `input` in ViewModelA in other controllers:

	class SecondViewController: UIViewController {
	
	    let disposeBag = DisposeBag()
	    let secondPusher: PublishRelay<String> = PublishRelay<String>()
	    @IBOutlet weak var secondButton: UIButton!
	    
	    override func viewDidLoad() {
	        super.viewDidLoad()
	
	        secondButton.rx.tap.map { "Unicorn comes!" }.bind(to: secondPusher).disposed(by: disposeBag)
	        secondPusher.bind(to: agnes.unicorn(key: key)).disposed(by: disposeBag)
	        // Do any additional setup after loading the view.
	    }
	}

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
- Xcode 9.0 +
- Swift 4.0 +


## Installation

AgnesUnicorn is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AgnesUnicorn'
```

## Author

magic_harly@hotmail.com, hy@mogoroom.com

## License

AgnesUnicorn is available under the MIT license. See the LICENSE file for more info.
