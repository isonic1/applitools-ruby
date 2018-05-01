require 'selenium-webdriver'

class GooglePageObjects

  def initialize(driver)
    @driver = driver
  end

  #Page Object Constants...
  VIEWPORT             = { id:    'viewport'                                                                }
  ABOUT                = { css:   '#hptl > a:nth-child(1)'                                                  }
  STORE                = { css:   '#hptl > a:nth-child(2)'                                                  }
  GMAIL                = { css:   '#gbw > div > div > div.gb_oe.gb_R.gb_Lg.gb_Bg > div:nth-child(1) > a'    }
  IMAGES               = { css:   '#gbw > div > div > div.gb_oe.gb_R.gb_Lg.gb_Bg > div:nth-child(2) > a'    }
  MENU                 = { css:   '#gbwa > div.gb_Qc > a'                                                   }
  SIGN_IN              = { id:    'gb_70'                                                                   }
  LOGO                 = { css:   '#hplogo'                                                                 }
  SEARCH_FIELD         = { css:   '#lst-ib'                                                                 }
  MIC                  = { id:    'gsri_ok0'                                                                }
  SEARCH_BUTTON        = { css:   '#tsf > div.tsf-p > div.jsb > center > input[type="submit"]:nth-child(1)' }
  FEELING_LUCKY_BUTTON = { css:   '#gbqfbb'                                                                 }
  ADVERTISING          = { css:   '#fsl > a:nth-child(1)'                                                   }
  FOOTER               = { class: 'fbar'                                                                    }
  BUSINESS             = { css:   '#fsl > a:nth-child(2)'                                                   }
  PRIVACY              = { css:   '#fsr > a:nth-child(1)'                                                   }
  TERMS                = { css:   '#fsr > a:nth-child(2)'                                                   }
  SETTINGS             = { css:   '#fsettl'                                                                 }

  def fe(locator = {}) #find element
    @driver.find_element(locator)
  end

  def fa(locator = {}) #find all elements
    @driver.find_elements(locator)
  end

  def is_displayed? locator
    begin
      fe(locator).displayed?
    rescue
      false
    end
  end

  def get_text locator
    fe(locator).text
  end

  def get_value locator
    fe(locator).attribute("value")
  end

  def get_location locator
    fe(locator).location.to_h
  end

  def get_color locator
    fe(locator).css_value('color')
  end

  def get_size locator
    fe(locator).size.to_h
  end
end

class GoogleEUnitedStatesTest < GooglePageObjects

  describe 'Testing Google.com without Visual Testing' do

    before(:all) do |e|
      @driver = Selenium::WebDriver.for :chrome
      @page = GooglePageObjects.new(@driver)
      @driver.manage.window.resize_to(1000, 800) #changing the size will fail all the location assertions...
      @driver.get 'https://google.com'
    end

    after(:all) do
      @driver.quit
    end

    context 'Google United States' do #This is just the United States. Some values will change for different locales...

      it { expect(@driver.title).to eq "Google" }

      it { expect(@page.is_displayed?(VIEWPORT)).to eq true }
      it { expect(@page.get_location(VIEWPORT)).to eq ({:x=>0, :y=>0}) }
      it { expect(@page.get_color(VIEWPORT)).to eq "rgba(34, 34, 34, 1)" }
      it { expect(@page.get_size(VIEWPORT)).to eq ({:width=>1000, :height=>686}) }

      it { expect(@page.is_displayed?(ABOUT)).to eq true }
      it { expect(@page.get_text(ABOUT)).to eq "About" }
      it { expect(@page.get_location(ABOUT)).to eq ({:x=>10, :y=>23}) }
      it { expect(@page.get_color(ABOUT)).to eq "rgba(0, 0, 0, 1)" }
      it { expect(@page.get_size(ABOUT)).to eq ({:width=>49, :height=>15}) }

      it { expect(@page.is_displayed?(STORE)).to eq true }
      it { expect(@page.get_text(STORE)).to eq "Store" }
      it { expect(@page.get_location(STORE)).to eq ({:x=>62.59375, :y=>23}) }
      it { expect(@page.get_color(STORE)).to eq "rgba(0, 0, 0, 1)" }
      it { expect(@page.get_size(STORE)).to eq ({:width=>46, :height=>15}) }

      it { expect(@page.is_displayed?(GMAIL)).to eq true }
      it { expect(@page.get_text(GMAIL)).to eq "Gmail" }
      it { expect(@page.get_location(GMAIL)).to eq ({:x=>749.0625, :y=>19}) }
      it { expect(@page.get_color(GMAIL)).to eq "rgba(0, 0, 0, 0.87)" }
      it { expect(@page.get_size(GMAIL)).to eq ({:width=>34, :height=>24}) }

      it { expect(@page.is_displayed?(IMAGES)).to eq true }
      it { expect(@page.get_text(IMAGES)).to eq "Images" }
      it { expect(@page.get_location(IMAGES)).to eq ({:x=>798.015625, :y=>19}) }
      it { expect(@page.get_color(IMAGES)).to eq "rgba(0, 0, 0, 0.87)" }
      it { expect(@page.get_size(IMAGES)).to eq ({:width=>43, :height=>24}) }

      it { expect(@page.is_displayed?(MENU)).to eq true }
      it { expect(@page.get_text(MENU)).to eq "" }
      it { expect(@page.get_location(MENU)).to eq ({:x=>855.65625, :y=>16} ) }
      it { expect(@page.get_color(MENU)).to eq "rgba(0, 0, 0, 1)" }
      it { expect(@page.get_size(MENU)).to eq ({:width=>30, :height=>30} ) }

      it { expect(@page.is_displayed?(SIGN_IN)).to eq true }
      it { expect(@page.get_text(SIGN_IN)).to eq "Sign in" }
      it { expect(@page.get_location(SIGN_IN)).to eq ({:x=>900.65625, :y=>16}) }
      it { expect(@page.get_color(SIGN_IN)).to eq "rgba(255, 255, 255, 1)" }
      it { expect(@page.get_size(SIGN_IN)).to eq ({:width=>69, :height=>30}) }

      it { expect(@page.is_displayed?(LOGO)).to eq true }
      it { expect(@page.get_text(LOGO)).to eq "" }
      it { expect(@page.get_location(LOGO)).to eq ({:x=>225, :y=>89}) }
      it { expect(@page.get_color(LOGO)).to eq "rgba(34, 34, 34, 1)" }
      it { expect(@page.get_size(LOGO)).to eq ({:width=>550, :height=>220}) }

      it { expect(@page.is_displayed?(SEARCH_FIELD)).to eq true }
      it { expect(@page.get_text(SEARCH_FIELD)).to eq "" }
      it { expect(@page.get_location(SEARCH_FIELD)).to eq ({:x=>272.5, :y=>324}) }
      it { expect(@page.get_color(SEARCH_FIELD)).to eq "rgba(0, 0, 0, 1)" }
      it { expect(@page.get_size(SEARCH_FIELD)).to eq ({:width=>403, :height=>34}) }

      it { expect(@page.is_displayed?(MIC)).to eq true }
      it { expect(@page.get_text(MIC)).to eq "" }
      it { expect(@page.get_location(MIC)).to eq ({:x=>703.5, :y=>328}) }
      it { expect(@page.get_color(MIC)).to eq "rgba(26, 13, 171, 1)" }
      it { expect(@page.get_size(MIC)).to eq ({:width=>18, :height=>23}) }

      it { expect(@page.is_displayed?(SEARCH_BUTTON)).to eq true }
      it { expect(@page.get_text(SEARCH_BUTTON)).to eq "" }
      it { expect(@page.get_value(SEARCH_BUTTON)).to eq "Google Search" }
      it { expect(@page.get_location(SEARCH_BUTTON)).to eq ({:x=>361.828125, :y=>393}) }
      it { expect(@page.get_color(SEARCH_BUTTON)).to eq "rgba(117, 117, 117, 1)" }
      it { expect(@page.get_size(SEARCH_BUTTON)).to eq ({:width=>126, :height=>36}) }

      it { expect(@page.is_displayed?(FEELING_LUCKY_BUTTON)).to eq true }
      it { expect(@page.get_text(FEELING_LUCKY_BUTTON)).to eq "" }
      it { expect(@page.get_value(FEELING_LUCKY_BUTTON)).to eq "I'm Feeling Lucky" }
      it { expect(@page.get_location(FEELING_LUCKY_BUTTON)).to eq ({:x=>514.078125, :y=>393}) }
      it { expect(@page.get_color(FEELING_LUCKY_BUTTON)).to eq "rgba(117, 117, 117, 1)" }
      it { expect(@page.get_size(FEELING_LUCKY_BUTTON)).to eq ({:width=>143, :height=>36}) }

      it { expect(@page.is_displayed?(ADVERTISING)).to eq true }
      it { expect(@page.get_text(ADVERTISING)).to eq "Advertising" }
      it { expect(@page.get_location(ADVERTISING)).to eq ({:x=>3, :y=>629}) }
      it { expect(@page.get_color(ADVERTISING)).to eq "rgba(102, 102, 102, 1)" }
      it { expect(@page.get_size(ADVERTISING)).to eq ({:width=>91, :height=>40}) }

      it { expect(@page.is_displayed?(FOOTER)).to eq true }
      it { expect(@page.get_location(FOOTER)).to eq ({:x=>-27, :y=>629}) }
      it { expect(@page.get_color(FOOTER)).to eq "rgba(34, 34, 34, 1)" }
      it { expect(@page.get_size(FOOTER)).to eq ({:width=>1064, :height=>40}) }

      it { expect(@page.is_displayed?(BUSINESS)).to eq true }
      it { expect(@page.get_text(BUSINESS)).to eq "Business" }
      it { expect(@page.get_location(BUSINESS)).to eq ({:x=>94.3125, :y=>629}) }
      it { expect(@page.get_color(BUSINESS)).to eq "rgba(102, 102, 102, 1)" }
      it { expect(@page.get_size(BUSINESS)).to eq ({:width=>80, :height=>40}) }

      it { expect(@page.is_displayed?(PRIVACY)).to eq true }
      it { expect(@page.get_text(PRIVACY)).to eq "Privacy" }
      it { expect(@page.get_location(PRIVACY)).to eq ({:x=>764, :y=>646}) }
      it { expect(@page.get_color(PRIVACY)).to eq "rgba(102, 102, 102, 1)" }
      it { expect(@page.get_size(PRIVACY)).to eq ({:width=>70, :height=>40}) }

      it { expect(@page.is_displayed?(TERMS)).to eq true }
      it { expect(@page.get_text(TERMS)).to eq "Terms" }
      it { expect(@page.get_location(TERMS)).to eq ({:x=>870.625, :y=>629}) }
      it { expect(@page.get_color(TERMS)).to eq "rgba(102, 102, 102, 1)" }
      it { expect(@page.get_size(TERMS)).to eq ({:width=>62, :height=>40}) }

      it { expect(@page.is_displayed?(SETTINGS)).to eq true }
      it { expect(@page.get_text(SETTINGS)).to eq "Settings" }
      it { expect(@page.get_location(SETTINGS)).to eq ({:x=>933.015625, :y=>629}) }
      it { expect(@page.get_color(SETTINGS)).to eq "rgba(102, 102, 102, 1)" }
      it { expect(@page.get_size(SETTINGS)).to eq ({:width=>74, :height=>40}) }
    end
  end
end