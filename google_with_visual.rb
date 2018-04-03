require 'eyes_selenium'

describe 'Testing Google.com' do

  before(:each) do |e|
    @driver = Selenium::WebDriver.for :chrome
    @eyes = Applitools::Selenium::Eyes.new
    @eyes.api_key = "9RkMajXrzS1Zu110oTWQps102CHiPRPmeyND99E9iL0G7yAc110"
    @driver.get 'https://google.com'
  end

  after(:each) do
    @eyes.abort_if_not_closed
    @driver.quit
  end

  it 'Google Search Page' do |e|
    @eyes.open(driver: @driver, app_name: "Google.com", test_name: e.description, viewport_size: { width: 1000, height: 686 }) #same as setting browser size to 1000x800
    @eyes.check_window 'Google Page'
    results = @eyes.close(false)
    expect(results.passed?).to be_truthy
  end
end