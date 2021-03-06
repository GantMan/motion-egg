class Egg
  attr_accessor :number_touches, :current_code

  DEFAULT_TOUCHES = 1
  KONAMI = [
    UISwipeGestureRecognizerDirectionUp, UISwipeGestureRecognizerDirectionUp, 
    UISwipeGestureRecognizerDirectionDown, UISwipeGestureRecognizerDirectionDown, 
    UISwipeGestureRecognizerDirectionLeft, UISwipeGestureRecognizerDirectionRight,
    UISwipeGestureRecognizerDirectionLeft, UISwipeGestureRecognizerDirectionRight
  ]

  def initialize (opts = {})
    @options = {secret_code: KONAMI, number_touches: DEFAULT_TOUCHES, image_file: "toasty.png"}.merge(opts)
  end

  def activate
    #p "************* OMG THE CODEZ! *************" 
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
        @egg_view.frame = show_frame
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
      completion:lambda {|finished|
        #consider removing egg subview here.
      }
    )
  end  

  def insert_egg
    @egg_view ||= begin
      egg_view = UIImageView.alloc.initWithFrame(hidden_frame)
      egg_view.contentMode = UIViewContentModeScaleAspectFit
      egg_view.image = UIImage.imageNamed(@options[:image_file])
      egg_view
    end
 
    # We want to add the view to the root view
    UIApplication.sharedApplication.keyWindow.subviews.objectAtIndex(0).nextResponder.view.addSubview(@egg_view)
  end  

  def add_code new_direction
    @current_code ||= Array.new
    @current_code.push(new_direction)

    # Only keep the last @current_code.size entries
    @current_code = @current_code[-@options[:secret_code].size..-1] if @current_code.size > @options[:secret_code].size 
    #p @current_code
    activate if @options[:secret_code] == @current_code
  end

  def number_touches
    @options[:number_touches]
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