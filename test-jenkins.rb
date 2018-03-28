require 'eyes_selenium'

describe 'Testing Applitools' do
  
  before(:all) do
    @eyes = Applitools::Selenium::Eyes.new
    @eyes.api_key = ENV['APPLITOOLS_API_KEY']
    @eyes.match_level = Applitools::MATCH_LEVEL[:strict]
    @eyes.force_full_page_screenshot = true
    @eyes.stitch_mode = :css
    
    @eyes.branch_name = 'qa'
    @eyes.parent_branch_name = 'default'
    
    if ENV['JENKINS_HOME']
      batch_info = Applitools::BatchInfo.new(ENV['JOB_NAME'])
      batch_info.id = ENV["APPLITOOLS_BATCH_ID"]
      @eyes.batch = batch_info
    else
      batch_info = Applitools::BatchInfo.new(ENV['JOB_NAME'])
      batch_info.id = ENV['APPLITOOLS_BATCH_ID']
      @eyes.batch = batch_info
    end
    
    caps = Selenium::WebDriver::Remote::Capabilities.chrome()
    caps['platform'] = 'Windows 7'
    caps['version'] = '63.0'
    caps['screenResolution'] = '2560x1600'    
    sauce_user = ENV['SAUCE_USER']
    sauce_key = ENV['SAUCE_KEY']
    @driver = Selenium::WebDriver.for(:remote, :url => "https://#{sauce_user}:#{sauce_key}@ondemand.saucelabs.com:443/wd/hub", :desired_capabilities => caps)
  end
  
  after(:all) do
    @eyes.abort_if_not_closed
    @driver.quit
  end

  it 'Applitools Test' do |e|
    @eyes.open(driver: @driver, app_name: "Full Page Screenshot 2", test_name: e.full_description, viewport_size: {width: 1050, height: 7})
    @driver.get 'https://google.es'
    @eyes.check_window 'Applitools'
    results = @eyes.close(false)
    expect(results.passed?).to eq true
  end
end

