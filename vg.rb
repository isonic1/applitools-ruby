require 'eyes_selenium'
require 'rspec'
require 'pry'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
Applitools::EyesLogger.log_handler = Logger.new(STDOUT)

describe 'Visual Grid Example' do

  before(:all) do
    batch_name = "UFG-Batch"
    batch = Applitools::BatchInfo.new(batch_name)
    batch.id = rand(9999999999).to_s
    batch.sequence_name = batch_name
    batch.notify_on_completion = true

    @conf = Applitools::Selenium::Configuration.new.tap do |config|
      config.server_url = "https://eyesapi.applitools.com"
      config.api_key = ENV['APPLITOOLS_API_KEY']
      config.viewport_size = Applitools::RectangleSize.new(1000,600)
      config.app_name = "VG TEST"
      config.batch = batch
      config.add_browser(1200, 800, BrowserTypes::CHROME)
            .add_browser(1200, 800, BrowserTypes::FIREFOX)
            .add_browser(1200, 800, BrowserTypes::IE_10)
            .add_browser(1200, 800, BrowserTypes::IE_11)
            .add_browser(1200, 800, BrowserTypes::SAFARI)
            .add_device_emulation(Devices::IPhoneX, Orientations::PORTRAIT)
            .add_device_emulation(Devices::Nexus10, Orientations::LANDSCAPE)
    end

    concurrency = @conf.browsers_info.size
    @runner = Applitools::Selenium::VisualGridRunner.new(concurrency)
    @eyes = Applitools::Selenium::Eyes.new(runner: @runner)
    @driver = Selenium::WebDriver.for :chrome
  end

  before(:each) do |e|
    @conf.test_name = e.description
    @eyes.set_configuration(@conf)
    @eyes.open(driver: @driver)
  end

  it 'Validate Google.com' do |e|
    @driver.get "https://www.google.com"
    @eyes.check "Google.com", Applitools::Selenium::Target.window.fully(true)
    @eyes.close_async
  end


  after(:all) do
    @driver.quit
    puts "\n*************I AM NOW RUNNING THE GET ALL TEST RESULTS AND I SHOULD SEND A NOTIFICATION....*************\n"
    @runner.get_all_test_results(false)
    @runner.stop
    @eyes.abort_if_not_closed
  end
end