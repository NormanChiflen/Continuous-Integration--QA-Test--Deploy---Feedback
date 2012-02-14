require "test/unit"
require "rubygems"
gem "selenium-client"
require "selenium/client"

class connfu-test-unit < Test::Unit::TestCase

  def setup
    @verification_errors = []
    @selenium = Selenium::Client::Driver.new \
      :host => "localhost",
      :port => 4444,
      :browser => "*chrome",
      :url => "http://localhost:3000/",
      :timeout_in_second => 60

    @selenium.start_new_browser_session
  end
  
  def teardown
    @selenium.close_current_browser_session
    assert_equal [], @verification_errors
  end
  
  def test_connfu-test-unit
    @selenium.open "/"
    @selenium.wait_for_page_to_load "60000"
    @selenium.open "/"
    @selenium.click "link=Sign up"
    @selenium.wait_for_page_to_load "60000"
    @selenium.type "xpath=//form[@id='user_new']/dl[1]/dd/input", "jmeter7"
    @selenium.type "id=user_email", "abc@aol.com"
    @selenium.type "xpath=//form[@id='user_new']/dl[3]/dd/input", "jmeter7"
    @selenium.type "id=user_password_confirmation", "jmeter7"
    @selenium.click "id=user_submit"
    @selenium.wait_for_page_to_load "60000"
    @selenium.click "link=How it Works"
    @selenium.click "link=My apps"
    @selenium.wait_for_page_to_load "60000"
    @selenium.click "id=step_3"
    @selenium.wait_for_page_to_load "60000"
    @selenium.type "id=app_name", "jmeter7-app"
    @selenium.type "id=app_description", "This is jmeter7 connfu app"
    @selenium.click "id=app_submit"
    @selenium.wait_for_page_to_load "60000"
    @selenium.click "xpath=//div[@class='table']/a/div/div[2]/p/b"
    @selenium.wait_for_page_to_load "60000"
    @selenium.click "xpath=//div[@id='content']/div[3]"
    @selenium.click "xpath=//div[@id='content']/div[4]/div[2]/div"
    @selenium.click "link=Add channel"
    @selenium.select "id=channel_type", "RSS"
    @selenium.type "id=rss_uid", "twitter-uid"
    @selenium.type "id=rss_uri", ""
    @selenium.type "id=rss_uid", "rss-uid"
    @selenium.type "id=rss_uri", "http://www.bbc.co.uk"
    @selenium.click "id=rss_submit"
    @selenium.wait_for_page_to_load "60000"
    @selenium.click "id=app_usage_button"
    @selenium.click "link=Close"
    @selenium.click "link=Add channel"
    @selenium.select "id=channel_type", "Twitter"
    @selenium.type "id=twitter_uid", "twitter-uid"
    @selenium.type "id=add_twitter_input", "chiflendotcom"
    @selenium.type "id=add_twitter_filter_input", "api"
    @selenium.click "xpath=//div[@class='account_filters']/a/img"
    @selenium.click "xpath=//td[@class='button']/a/img"
    @selenium.click "id=create_twitter_channel_button"
    @selenium.wait_for_page_to_load "60000"
    @selenium.go_back
    @selenium.wait_for_page_to_load "60000"
    @selenium.click "link=Add channel"
    @selenium.select "id=channel_type", "Voice"
    @selenium.type "id=voice_uid", "voice-uid"
    @selenium.select "id=voice_country", "United Kingdom"
    @selenium.type "id=voice_topic", "Conference powered by connFu."
    @selenium.type "id=voice_welcome_message", "Welcome to connFu, you are going to join the conference"
    @selenium.type "id=voice_rejected_message", "You are not allowed to join this conference"
    @selenium.click "xpath=//div[@id='voice_form']//a[.='Cancel']"
    @selenium.click "link=Add channel"
    @selenium.select "id=channel_type", "Voice"
    @selenium.click "id=voice_topic"
    @selenium.type "id=voice_welcome_message", "Welcome to connFu, you are going to join the conference"
    @selenium.type "id=voice_rejected_message", "You are not allowed to join this conference"
    @selenium.click "id=voice_submit"
    @selenium.wait_for_page_to_load "60000"
    @selenium.click "xpath=//div[@id='content']//div[normalize-space(.)='Voice']"
    @selenium.type "id=whitelisted_name", "jmeter7"
    @selenium.type "id=whitelisted_phone", "11340927863"
    @selenium.click "xpath=//div[@id='whitelist_form']//button[.='Add']"
    @selenium.click "xpath=//div[@class='app-create-button']/input"
    @selenium.wait_for_page_to_load "60000"
    @selenium.click "xpath=//div[@id='content']//span[normalize-space(.)='http://www.bbc.co.uk']"
    @selenium.type "xpath=//form[@id='edit_rss_4eb3d8fc9c7ec109ba000037']/dl/div/dd/input", "http://www.cnn.com"
    @selenium.click "xpath=//div[@class='app-create-button']/input"
    @selenium.wait_for_page_to_load "60000"
    @selenium.click "link=Documentation"
    @selenium.wait_for_page_to_load "60000"
    @selenium.click "link=Support"
    @selenium.wait_for_page_to_load "60000"
    @selenium.click "link=How it Works"
    @selenium.wait_for_page_to_load "60000"
    @selenium.click "link=My apps"
    @selenium.wait_for_page_to_load "60000"
    @selenium.click "id=step_2"
    @selenium.wait_for_page_to_load "60000"
    @selenium.click "link=Support"
    @selenium.wait_for_page_to_load "60000"
    @selenium.click "link=My apps"
    @selenium.wait_for_page_to_load "60000"
    @selenium.click "id=step_1"
    @selenium.wait_for_page_to_load "60000"
    @selenium.click "link=jmeter7"
    @selenium.wait_for_page_to_load "60000"
    @selenium.type "id=user_password_confirmation", "jmeter7"
    @selenium.type "id=user_current_password", "jmeter7"
    @selenium.type "id=user_password", "jmeter7"
    @selenium.click "id=user_submit"
    @selenium.wait_for_page_to_load "60000"
    @selenium.click "link=Sign out"
    @selenium.wait_for_page_to_load "60000"
  end
end
