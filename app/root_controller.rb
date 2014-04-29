class RootController < UIViewController

  def viewDidLoad
    view.backgroundColor = UIColor.lightGrayColor
    @label = UILabel.alloc.initWithFrame(CGRectZero)
    @label.text = "Perform the Konami Code in Gestures \n
                  UP, UP, \n
                  DOWN, DOWN, \n
                  LEFT, RIGHT, \n
                  LEFT, RIGHT"
    @label.numberOfLines = 0
    @label.font = UIFont.systemFontOfSize(16)
    @label.sizeToFit
    @label.center = view.center
    view.addSubview(@label)    
  end

end
