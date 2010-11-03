$:.unshift

gem 'rspec'
require 'rake'
require 'spec/rake/spectask'

rspec_formatter_defaults = []
rspec_formatter_defaults << "--color"
rspec_formatter_defaults << "--format=progress"
rspec_formatter_defaults << "--require 'selenium/rspec/spec_helper,selenium/rspec/reporting/selenium_test_report_formatter'"
rspec_formatter_defaults << "--format=Selenium::RSpec::SeleniumTestReportFormatter:./reports/test_report.html"

task :default => :test

desc "Run all spec files"
Spec::Rake::SpecTask.new("spec") do |t|
  t.pattern = "spec/*spec.rb"
  t.spec_opts << rspec_formatter_defaults
  t.fail_on_error = false
end

desc "Start Selenium Server in singleswindow mode"
task :'rc:start' do
  puts "** Selenium Server started in single-window mode"
  `java -jar selenium_server/selenium-server.jar -singlewindow -browserSessionReuse`
end