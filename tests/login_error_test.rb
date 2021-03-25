require 'rspec'
require "selenium-webdriver"


RSpec.describe "Thing" do
# driver = Selenium::WebDriver.for :chrome
# driver.manage.timeouts.implicit_wait = 10
#driver.navigate.to 'https://www.saucedemo.com/inventory.html'
before :example do
  @driver = Selenium::WebDriver.for :chrome
  @driver.manage.timeouts.implicit_wait = 10
  @driver.navigate.to 'https://www.saucedemo.com/inventory.html'
end
after :example do
  @driver.quit
end

describe "login_fail"  do
    it "user should not able to log in" do
    user = @driver.find_element(:css, "input#user-name")
    user.send_keys("standard_use")
    # puts user.text
    pass = @driver.find_element(:css, "input#password")
    pass.send_keys("secret_sauc")
    # puts pass.text
    @driver.find_element(:css, "input#login-button").click
    error_msg = @driver.find_element(:xpath, "//div[@id='login_button_container']//form/h3")
    # puts error_text.text == "Epic sadface: Username and password do not match any user in this service"
    expect(error_msg.text).to eq("Epic sadface: Username and password do not match any user in this service")
    end


  
  #   #  --> locked out user  <-- 
    
    it "user should not able to log in" do
   # can I use same webpage 
    user1 = @driver.find_element(:css, "input#user-name")
    user1.clear
    user1.send_keys("locked_out_user")
    # puts user.text
    pass1 = @driver.find_element(:css, "input#password")
    pass1.clear
    pass1.send_keys("secret_sauce")
    # puts pass.text
    @driver.find_element(:css, "input#login-button").click
    error_msg = @driver.find_element(:xpath, "//div[@id='login_button_container']//form/h3")
    puts error_msg.text 
    # expect(error_msg.text).to eq("Epic sadface: Sorry, this user has been locked out.")
    expect(error_msg.text).to eq("Epic sadface: Sorry, this user has been locked out.")
    end
    

    #  --> problem_user  <-- #
    it "user should not able to checkout" do
       
       user1 = @driver.find_element(:css, "input#user-name")
       user1.clear
       user1.send_keys("problem_user")
       # puts user.tex
       pass1 = @driver.find_element(:css, "input#password")
       pass1.clear
       pass1.send_keys("secret_sauce")
       # puts pass.text
       @driver.find_element(:css, "input#login-button").click
       @driver.find_element(:css, "div:nth-of-type(1) > .pricebar > .btn_inventory.btn_primary").click 
       @driver.find_element(:css, "[fill]").click 
       @driver.find_element(:css, ".checkout_button").click
       fname = @driver.find_element(:css, "input#first-name")
       fname.send_keys("almin")
       lname = @driver.find_element(:css, "input#last-name")
       lname.send_keys("hossain")
       zip = @driver.find_element(:css, "input#postal-code")
       zip.send_keys("12345")
       @driver.find_element(:css, ".btn_primary.cart_button").click
       error_msg = @driver.find_element(:xpath, "//div[@id='checkout_info_container']//form/h3")
       puts error_msg.text
       expect(error_msg.text).to eq("Error: Last Name is required")             
      #  error_msg = driver.find_element(:xpath, "//div[@id='login_button_container']//form/h3")
      #  puts error_msg.text
      #  # expect(error_msg.text).to eq("Epic sadface: Sorry, this user has been locked out.")
      #  expect(error_msg.text).to eq("Epic sadface: Username and password do not match any user in this service"
       end
      

       #  --> performance_glitch_user  <-- 
       it "user should not able to log in" do
         user1 = @driver.find_element(:css, "input#user-name")
         user1.clear
        user1.send_keys("performance_glitch_user")
        if @driver.manage.timeouts.page_load = 2
          a = "here is glich"
          puts a
        end
        #puts user.text
        #alternate for sleep
         pass1 = @driver.find_element(:css, "input#password")
         pass1.clear
         pass1.send_keys("secret_sauce")
         # puts pass.text
         @driver.find_element(:css, "input#login-button").click    
         # error_msg = driver.find_element(:xpath, "//div[@id='login_button_container']//form/h3")    
         # puts error_msg.text 
         # expect(error_msg.text).to eq("Epic sadface: Sorry, this user has been locked out.")
         expect(a).to eq("here is glich")        
  end
 end 
end

# homework 1 -> use one browser. 
# 