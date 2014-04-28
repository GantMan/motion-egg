class UIWindow
  attr_accessor :current_code
  
  TOUCHES = 1
  KONAMI = [
    UISwipeGestureRecognizerDirectionUp, UISwipeGestureRecognizerDirectionUp, 
    UISwipeGestureRecognizerDirectionDown, UISwipeGestureRecognizerDirectionDown, 
    UISwipeGestureRecognizerDirectionLeft, UISwipeGestureRecognizerDirectionRight,
    UISwipeGestureRecognizerDirectionLeft, UISwipeGestureRecognizerDirectionRight
  ]
  def add_egg
    #left
    @swipe_gesture_left = UISwipeGestureRecognizer.alloc.initWithTarget(self, action:"handle_swipe:")
    @swipe_gesture_left.direction = UISwipeGestureRecognizerDirectionLeft 
    @swipe_gesture_left.numberOfTouchesRequired = TOUCHES
    self.addGestureRecognizer(@swipe_gesture_left)

    #right
    @swipe_gesture_right = UISwipeGestureRecognizer.alloc.initWithTarget(self, action:"handle_swipe:")
    @swipe_gesture_right.direction = UISwipeGestureRecognizerDirectionRight
    @swipe_gesture_right.numberOfTouchesRequired = TOUCHES
    self.addGestureRecognizer(@swipe_gesture_right)

    #up
    @swipe_gesture_up = UISwipeGestureRecognizer.alloc.initWithTarget(self, action:"handle_swipe:")
    @swipe_gesture_up.direction = UISwipeGestureRecognizerDirectionUp
    @swipe_gesture_up.numberOfTouchesRequired = TOUCHES
    self.addGestureRecognizer(@swipe_gesture_up)    

    #down
    @swipe_gesture_down = UISwipeGestureRecognizer.alloc.initWithTarget(self, action:"handle_swipe:")
    @swipe_gesture_down.direction = UISwipeGestureRecognizerDirectionDown
    @swipe_gesture_down.numberOfTouchesRequired = TOUCHES
    self.addGestureRecognizer(@swipe_gesture_down)  
  end

  # each recognizer should have a direction, but you can send them all to the same function!
  def handle_swipe(sender)
    @current_code ||= Array.new
    @current_code.push(sender.direction)

    # Only keep the last 
    @current_code = @current_code[-8..-1] if @current_code.size > 8
    p @current_code
    code_performed if KONAMI == @current_code
  end  

  # Code performed!
  def code_performed
    p "************* OMG THE CODEZ! *************" 
    insert_egg
    show_egg
    NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: 'hide_egg:', userInfo: nil, repeats: false)
  end

  def show_egg(timing = 0.5)
    # Animate the egg into the view:
    UIView.animateWithDuration(timing,
      delay:0.0,
      options:UIViewAnimationOptionCurveLinear,
      animations: lambda {
        @egg_view.frame = showingFrame
      },
      completion:lambda {|finished|
      }
    )
  end

  def hide_egg(sender)
    # Animate the egg out of the view:
    UIView.animateWithDuration(0.5,
      delay:0.0,
      options:UIViewAnimationOptionCurveLinear,
      animations: lambda {
        @egg_view.frame = hidden_frame
      },
      completion:nil
    )
  end  

  def insert_egg
    @egg_view ||= begin
      egg_view = UIImageView.alloc.initWithFrame([[0,0],[egg_width, egg_height]]) #UIView.new
      egg_view.contentMode = UIViewContentModeScaleAspectFit
      egg_view.image = UIImage.imageNamed("toasty.png")
      egg_view.frame = hidden_frame
      egg_view
    end
 
    # We want to add the view to the root view
    UIApplication.sharedApplication.keyWindow.subviews.objectAtIndex(0).nextResponder.view.addSubview(@egg_view)
  end  

  def hidden_frame
    [[0,UIScreen.mainScreen.bounds.size.height + egg_height],[egg_width, egg_height]]
  end

  def showingFrame
    [[0,UIScreen.mainScreen.bounds.size.height - egg_height],[egg_width, egg_height]]
  end  

  def egg_height
    180
  end

  def egg_width
    UIScreen.mainScreen.bounds.size.width
  end
end