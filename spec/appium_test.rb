require 'rubygems'
require 'appium_lib'
capabilities = {
  'appium-version' => '1.0',
  'platformName' => 'iOS',
  'platformVersion' => '7.1',
}

server_url = "http://0.0.0.0:4723/wd/hub"

Appium::Driver.new(caps: capabilities).start_driver
Appium.promote_appium_methods Object

swipe :start_x => 154, :start_x => 470, :end_x => 144, :end_y => 144, :touchCount => 1, :duration => 1
swipe :start_x => 157, :start_x => 480, :end_x => 150, :end_y => 135, :touchCount => 1, :duration => 1
swipe :start_x => 150, :start_x => 121, :end_x => 151, :end_y => 485, :touchCount => 1, :duration => 1
swipe :start_x => 156, :start_x => 122, :end_x => 146, :end_y => 464, :touchCount => 1, :duration => 1
swipe :start_x => 272, :start_x => 334, :end_x => 50, :end_y => 330, :touchCount => 1, :duration => 1
swipe :start_x => 38, :start_x => 313, :end_x => 291, :end_y => 313, :touchCount => 1, :duration => 1
swipe :start_x => 263, :start_x => 319, :end_x => 30, :end_y => 306, :touchCount => 1, :duration => 1
swipe :start_x => 44, :start_x => 302, :end_x => 262, :end_y => 303, :touchCount => 1, :duration => 1
driver_quit
