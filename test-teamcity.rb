require 'eyes_selenium'

describe 'Testing Applitools' do

  before(:all) do
    @eyes = Applitools::Selenium::Eyes.new
    @eyes.api_key = ENV['APPLITOOLS_KEY']
    puts "MY APPLITOOLS KEY: #{ENV['APPLITOOLS_KEY']}"
    @eyes.match_level = Applitools::MATCH_LEVEL[:strict]
    @eyes.force_full_page_screenshot = true
    @eyes.stitch_mode = :css
    batch_info = Applitools::BatchInfo.new(ENV['APPLITOOLS_BATCH_NAME'])
    batch_info.id = ENV["APPLITOOLS_BATCH_ID"]
    @eyes.batch = batch_info
  end

  before(:each) do |e|
    browser = Selenium::WebDriver.for :chrome
    @driver = @eyes.open(driver: browser, app_name: "Full Page Screenshot", test_name: e.full_description)
  end

  after(:each) do
    @eyes.abort_if_not_closed
    @driver.quit
  end

  it 'Applitools Test' do
    @driver.get 'https://applitools.com'
    @eyes.check_window 'Applitools'
    results = @eyes.close(false)
    expect(results.passed?).to eq true
  end

  # it 'CNN' do
  #   @driver.get 'https://cnn.com'
  #   begin
  #     @eyes.check_window 'CNN'
  #   rescue
  #     puts "Encontered error. Retrying..."
  #     retry
  #   end
  #   results = @eyes.close(false)
  #   expect(results.passed?).to eq true
  # end
end