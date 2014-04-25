class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = RootController.new
    @window.makeKeyAndVisible

    #left
    @swipe_gesture_left = UISwipeGestureRecognizer.alloc.initWithTarget(self, action:"handle_swipe:")
    @swipe_gesture_left.direction = UISwipeGestureRecognizerDirectionLeft 
    @swipe_gesture_left.numberOfTouchesRequired = 1
    @window.addGestureRecognizer(@swipe_gesture_left)

    #right
    @swipe_gesture_right = UISwipeGestureRecognizer.alloc.initWithTarget(self, action:"handle_swipe:")
    @swipe_gesture_right.direction = UISwipeGestureRecognizerDirectionRight
    @swipe_gesture_right.numberOfTouchesRequired = 1
    @window.addGestureRecognizer(@swipe_gesture_right)

    #up
    @swipe_gesture_up = UISwipeGestureRecognizer.alloc.initWithTarget(self, action:"handle_swipe:")
    @swipe_gesture_up.direction = UISwipeGestureRecognizerDirectionUp
    @swipe_gesture_up.numberOfTouchesRequired = 1
    @window.addGestureRecognizer(@swipe_gesture_up)    

    #down
    @swipe_gesture_down = UISwipeGestureRecognizer.alloc.initWithTarget(self, action:"handle_swipe:")
    @swipe_gesture_down.direction = UISwipeGestureRecognizerDirectionDown
    @swipe_gesture_down.numberOfTouchesRequired = 1
    @window.addGestureRecognizer(@swipe_gesture_down)

    true
  end

  # each recognizer should have a direction, but you can send them all to the same function!
  def handle_swipe(sender)
    p "swipe handler called"
    if(sender.direction == UISwipeGestureRecognizerDirectionDown)
      p "Swiped down"
    end

    if(sender.direction == UISwipeGestureRecognizerDirectionLeft)
      p "Swiped left"
    end

    if(sender.direction == UISwipeGestureRecognizerDirectionRight)
      p "Swiped right"
    end

    if(sender.direction == UISwipeGestureRecognizerDirectionUp)
      p "Swiped up"
    end
  end

end
