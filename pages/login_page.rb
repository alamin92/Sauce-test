

class LoginPage
    def initialize(driver)
        @driver = driver
    end 
    def username 
         @driver.find_element(:css, "input#user-name")
    end
    
    def password
         @driver.find_element(:css, "input#password")
    end

    def log_in_button
        @driver.find_element(:css, "input#login-button")
    end

end 