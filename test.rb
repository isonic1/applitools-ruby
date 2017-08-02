require 'eyes_selenium'

describe 'Testing Applitools' do

  before(:each) do |e|
    browser = Selenium::WebDriver.for :chrome
    @eyes = Applitools::Selenium::Eyes.new
    @eyes.api_key = ENV['APPLITOOLS_KEY']
    @eyes.match_level = Applitools::MATCH_LEVEL[:strict]
    @eyes.force_full_page_screenshot = true
    @eyes.stitch_mode = :css
    @eyes.batch_info = Applitools::BatchInfo.new('JENKINS EXAMPLE')
    batch_info.id = ENV["APPLITOOLS_BATCH_ID"]
    @eyes.batch = batch_info
    @driver = @eyes.open(driver: browser, app_name: "Full Page Screenshot", test_name: e.full_description, viewport_size: { width: 1000, height: 800 })
  end

  after(:each) do
    @eyes.abort_if_not_closed
    @driver.quit
  end

  it 'Applitools' do
    @driver.get 'https://applitools.com'
    begin
      @eyes.check_window 'CNN'
    rescue
      puts "Encontered error. Retrying..."
      retry
    end
    results = @eyes.close(false)
    expect(results.passed?).to eq true
  end

end