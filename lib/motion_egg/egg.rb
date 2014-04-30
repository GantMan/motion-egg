class Egg
  attr_accessor :number_touches, :secret_code, :current_code, :image_file

  DEFAULT_TOUCHES = 1
  KONAMI = [
    UISwipeGestureRecognizerDirectionUp, UISwipeGestureRecognizerDirectionUp, 
    UISwipeGestureRecognizerDirectionDown, UISwipeGestureRecognizerDirectionDown, 
    UISwipeGestureRecognizerDirectionLeft, UISwipeGestureRecognizerDirectionRight,
    UISwipeGestureRecognizerDirectionLeft, UISwipeGestureRecognizerDirectionRight
  ]

  def initialize 

  end

  def number_touches
    @number_touches || DEFAULT_TOUCHES
  end

  def secret_code
    @secret_code || KONAMI
  end

  def image_file
    @image_file || "toasty.png"
  end

  def hidden_frame
    [[0,UIScreen.mainScreen.bounds.size.height + egg_height],[egg_width, egg_height]]
  end

  def show_frame
    [[0,UIScreen.mainScreen.bounds.size.height - egg_height],[egg_width, egg_height]]
  end  

  def egg_height
    180
  end

  def egg_width
    UIScreen.mainScreen.bounds.size.width
  end

end