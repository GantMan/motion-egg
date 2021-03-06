class UIWindow

  def add_egg(options = {})

    # Easter egg workhorse
    @egg = Egg.new options

    #left
    @swipe_gesture_left = UISwipeGestureRecognizer.alloc.initWithTarget(self, action:"handle_swipe:")
    @swipe_gesture_left.direction = UISwipeGestureRecognizerDirectionLeft 
    @swipe_gesture_left.numberOfTouchesRequired = @egg.number_touches
    self.addGestureRecognizer(@swipe_gesture_left)

    #right
    @swipe_gesture_right = UISwipeGestureRecognizer.alloc.initWithTarget(self, action:"handle_swipe:")
    @swipe_gesture_right.direction = UISwipeGestureRecognizerDirectionRight
    @swipe_gesture_right.numberOfTouchesRequired = @egg.number_touches
    self.addGestureRecognizer(@swipe_gesture_right)

    #up
    @swipe_gesture_up = UISwipeGestureRecognizer.alloc.initWithTarget(self, action:"handle_swipe:")
    @swipe_gesture_up.direction = UISwipeGestureRecognizerDirectionUp
    @swipe_gesture_up.numberOfTouchesRequired = @egg.number_touches
    self.addGestureRecognizer(@swipe_gesture_up)    

    #down
    @swipe_gesture_down = UISwipeGestureRecognizer.alloc.initWithTarget(self, action:"handle_swipe:")
    @swipe_gesture_down.direction = UISwipeGestureRecognizerDirectionDown
    @swipe_gesture_down.numberOfTouchesRequired = @egg.number_touches
    self.addGestureRecognizer(@swipe_gesture_down)  
  end

  # each recognizer should have a direction, but you can send them all to the same function!
  def handle_swipe(sender)
    @egg.add_code(sender.direction)
  end  

end