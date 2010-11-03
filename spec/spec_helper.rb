def start_new_browser_session
  @selenium_driver.start_new_browser_session
  @selenium_driver.set_context "Starting example '#{self.description}'" unless not(self.respond_to?('description'))
end

def selenium_driver
  @selenium_driver
end

def page
  @selenium_driver
end

def create_selenium_driver(options={})
  remote_control_server = "localhost"
  port = 4444
  browser = "*firefox"
  timeout = 200
  application_url = "http://vivisimo.com"
  
  @selenium_driver = Selenium::Client::Driver.new(
    remote_control_server,
    port,
    browser,
    application_url,
    timeout)
end

Spec::Runner.configure do |config|
  config.before(:all) do
    create_selenium_driver
    start_new_browser_session
  end
  
  config.append_after(:all) do
    @selenium_driver.close_current_browser_session
  end
end