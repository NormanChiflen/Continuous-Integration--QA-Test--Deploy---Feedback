require "rubygems"
gem "rspec"
gem "selenium-client"
require "selenium/client"
require "selenium/rspec/spec_helper"

describe "connfu-rspec-selenium" do
  attr_reader :selenium_driver
  alias :page :selenium_driver

  before(:all) do
    @verification_errors = []
    @selenium_driver = Selenium::Client::Driver.new \
      :host => "localhost",
      :port => 4444,
      :browser => "*chrome",
      :url => "http://localhost:3000/",
      :timeout_in_second => 60
  end

  before(:each) do
    @selenium_driver.start_new_browser_session
  end
  
  append_after(:each) do
    @selenium_driver.close_current_browser_session
    @verification_errors.should == []
  end
  
  it "test_connfu-rspec-selenium" do
    page.open "/"
    page.wait_for_page_to_load "60000"
    page.open "/"
    page.click "link=Sign up"
    page.wait_for_page_to_load "60000"
    page.type "xpath=//form[@id='user_new']/dl[1]/dd/input", "jmeter7"
    page.type "id=user_email", "abc@aol.com"
    page.type "xpath=//form[@id='user_new']/dl[3]/dd/input", "jmeter7"
    page.type "id=user_password_confirmation", "jmeter7"
    page.click "id=user_submit"
    page.wait_for_page_to_load "60000"
    page.click "link=How it Works"
    page.click "link=My apps"
    page.wait_for_page_to_load "60000"
    page.click "id=step_3"
    page.wait_for_page_to_load "60000"
    page.type "id=app_name", "jmeter7-app"
    page.type "id=app_description", "This is jmeter7 connfu app"
    page.click "id=app_submit"
    page.wait_for_page_to_load "60000"
    page.click "xpath=//div[@class='table']/a/div/div[2]/p/b"
    page.wait_for_page_to_load "60000"
    page.click "xpath=//div[@id='content']/div[3]"
    page.click "xpath=//div[@id='content']/div[4]/div[2]/div"
    page.click "link=Add channel"
    page.select "id=channel_type", "RSS"
    page.type "id=rss_uid", "twitter-uid"
    page.type "id=rss_uri", ""
    page.type "id=rss_uid", "rss-uid"
    page.type "id=rss_uri", "http://www.bbc.co.uk"
    page.click "id=rss_submit"
    page.wait_for_page_to_load "60000"
    page.click "id=app_usage_button"
    page.click "link=Close"
    page.click "link=Add channel"
    page.select "id=channel_type", "Twitter"
    page.type "id=twitter_uid", "twitter-uid"
    page.type "id=add_twitter_input", "chiflendotcom"
    page.type "id=add_twitter_filter_input", "api"
    page.click "xpath=//div[@class='account_filters']/a/img"
    page.click "xpath=//td[@class='button']/a/img"
    page.click "id=create_twitter_channel_button"
    page.wait_for_page_to_load "60000"
    page.go_back
    page.wait_for_page_to_load "60000"
    page.click "link=Add channel"
    page.select "id=channel_type", "Voice"
    page.type "id=voice_uid", "voice-uid"
    page.select "id=voice_country", "United Kingdom"
    page.type "id=voice_topic", "Conference powered by connFu."
    page.type "id=voice_welcome_message", "Welcome to connFu, you are going to join the conference"
    page.type "id=voice_rejected_message", "You are not allowed to join this conference"
    page.click "xpath=//div[@id='voice_form']//a[.='Cancel']"
    page.click "link=Add channel"
    page.select "id=channel_type", "Voice"
    page.click "id=voice_topic"
    page.type "id=voice_welcome_message", "Welcome to connFu, you are going to join the conference"
    page.type "id=voice_rejected_message", "You are not allowed to join this conference"
    page.click "id=voice_submit"
    page.wait_for_page_to_load "60000"
    page.click "xpath=//div[@id='content']//div[normalize-space(.)='Voice']"
    page.type "id=whitelisted_name", "jmeter7"
    page.type "id=whitelisted_phone", "11340927863"
    page.click "xpath=//div[@id='whitelist_form']//button[.='Add']"
    page.click "xpath=//div[@class='app-create-button']/input"
    page.wait_for_page_to_load "60000"
    page.click "xpath=//div[@id='content']//span[normalize-space(.)='http://www.bbc.co.uk']"
    page.type "xpath=//form[@id='edit_rss_4eb3d8fc9c7ec109ba000037']/dl/div/dd/input", "http://www.cnn.com"
    page.click "xpath=//div[@class='app-create-button']/input"
    page.wait_for_page_to_load "60000"
    page.click "link=Documentation"
    page.wait_for_page_to_load "60000"
    page.click "link=Support"
    page.wait_for_page_to_load "60000"
    page.click "link=How it Works"
    page.wait_for_page_to_load "60000"
    page.click "link=My apps"
    page.wait_for_page_to_load "60000"
    page.click "id=step_2"
    page.wait_for_page_to_load "60000"
    page.click "link=Support"
    page.wait_for_page_to_load "60000"
    page.click "link=My apps"
    page.wait_for_page_to_load "60000"
    page.click "id=step_1"
    page.wait_for_page_to_load "60000"
    page.click "link=jmeter7"
    page.wait_for_page_to_load "60000"
    page.type "id=user_password_confirmation", "jmeter7"
    page.type "id=user_current_password", "jmeter7"
    page.type "id=user_password", "jmeter7"
    page.click "id=user_submit"
    page.wait_for_page_to_load "60000"
    page.click "link=Sign out"
    page.wait_for_page_to_load "60000"
  end
end
