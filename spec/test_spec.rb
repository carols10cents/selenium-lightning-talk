require "selenium/client"
require "selenium/rspec/spec_helper"
require "spec_helper"

describe "Vivisimo site search" do
  context "search for test" do
    before(:all) do
      @query = "test"
      page.open "/"
      page.type "//input[@name='query']", @query
      page.click "//input[@value='Submit']", :wait_for => :page
    end
    
    it "should have 8 results" do
      page.get_xpath_count("//ol[@class='results']/li").to_i.should == 8
    end
    
    it "should have 'test' bolded in the first snippet" do
      page.get_text("//ol[@class='results']/li//span[contains(@class, 'vivbold')]").should match(/test/i)
    end
  end
end