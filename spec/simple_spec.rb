require "selenium/client"
require "selenium/rspec/spec_helper"
require "spec_helper"

# Locator 
# type=value
# If there is no locator type:
#   If it starts with //, it's an xpath
#   If it starts with document, it's a dom locator
#   Then look for a matching id
#   Then look for a name
# id=
# name=
# value=
# type=
# link=
# css=form#loginform

describe "Vivisimo site search" do
  context "search for test" do
    before(:all) do
      @query = "test"
      page.open "/"
      page.type "query", @query # This looks for id=query, then name=query
      page.click "//input[@value='Submit']", :wait_for => :page
    end
    
    it "should have 8 results" do
      page.get_xpath_count("//ol[@class='results']/li").to_i.should == 8
    end
    
    it "should have 'test' bolded in the first snippet" do
      page.get_text("//ol[@class='results']/li//span[contains(@class, 'vivbold')]").should match(/#{@query}/i)
    end
  end
end