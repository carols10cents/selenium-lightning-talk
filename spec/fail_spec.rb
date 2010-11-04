require "selenium/client"
require "selenium/rspec/spec_helper"
require "spec_helper"

describe "Vivisimo site search" do
  context "search for test" do
    before(:all) do
      @query = "information"
      page.open "/"
      page.type "//input[@name='query']", @query
      page.click "//input[@value='Submit']", :wait_for => :page
    end
        
    it "should be able to get to the resources page from the search results" do
      page.click "link=Resources", :wait_for => :page
      page.get_text("css=#page1 .link1").should eql "Vivisimo White Papers"
    end
  end
end