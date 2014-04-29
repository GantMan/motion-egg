describe 'UIWindow' do
  tests RootController

  before do
    # stuff?
  end

  it 'can add the easter egg' do
    window.should.respond_to?(:add_egg)
  end

  it 'does NOT have the eater egg on the screen by default' do
    # validate easter egg is not there
  end

  it 'shows easter egg when the secret code is entered' do

    # HOW THE HELL DO I TEST THIS?
    drag ("main", from: :bottom, to: :top)
    drag ("main", from: :bottom, to: :top)
    drag ("main", from: :top, to: :bottom)
    drag ("main", from: :top, to: :bottom)
    drag ("main", from: :right, to: :left)
    drag ("main", from: :left, to: :right)
    drag ("main", from: :right, to: :left)
    drag ("main", from: :left, to: :right)

    flick("main", :to => :top, :duration => 0.2) # UP
    flick("main", :to => :top, :duration => 0.2) # UP
    flick("main", :to => :bottom, :duration => 0.2) # DOWN
    flick("main", :to => :bottom, :duration => 0.2) # DOWN
    flick("main", :to => :left, :duration => 0.2) # LEFT
    flick("main", :to => :right, :duration => 0.2) # RIGHT
    flick("main", :to => :left, :duration => 0.2) # LEFT
    flick("main", :to => :right, :duration => 0.2) # RIGHT
    wait 1.5 do
      # validates easter egg is there
    end
  end

end