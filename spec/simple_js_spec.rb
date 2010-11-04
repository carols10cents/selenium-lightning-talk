require "selenium/client"
require "selenium/rspec/spec_helper"
require "spec_helper"

describe "Vivisimo site search" do
  context "search for test" do
    before(:all) do
      @query = "test"
      page.open "/"
      page.type "query", @query # This looks for id=query, then name=query
      page.click "//input[@value='Submit']", :wait_for => :page
    end
    
    it "should preview the result on the page" do
      result_link_url = page.get_attribute("//li[@id='doc-Ndoc0']/div[@class='document-header']/a@href")
      page.click "po-Ndoc0", :wait_for => :element,
                             :element => "//iframe[@id='pf-Ndoc0']"
      page.get_attribute("//iframe[@id='pf-Ndoc0']@src").should eql result_link_url
    end
  end
end