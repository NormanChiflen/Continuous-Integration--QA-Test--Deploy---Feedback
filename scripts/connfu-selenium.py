from selenium import selenium
import unittest, time, re

class connfu-selenium(unittest.TestCase):
    def setUp(self):
        self.verificationErrors = []
        self.selenium = selenium("localhost", 4444, "*chrome", "http://localhost:3000/")
        self.selenium.start()
    
    def test_connfu-selenium(self):
        sel = self.selenium
        sel.open("/")
        sel.wait_for_page_to_load("60000")
        sel.open("/")
        sel.click("link=Sign up")
        sel.wait_for_page_to_load("60000")
        sel.type("xpath=//form[@id='user_new']/dl[1]/dd/input", "jmeter7")
        sel.type("id=user_email", "abc@aol.com")
        sel.type("xpath=//form[@id='user_new']/dl[3]/dd/input", "jmeter7")
        sel.type("id=user_password_confirmation", "jmeter7")
        sel.click("id=user_submit")
        sel.wait_for_page_to_load("60000")
        sel.click("link=How it Works")
        sel.click("link=My apps")
        sel.wait_for_page_to_load("60000")
        sel.click("id=step_3")
        sel.wait_for_page_to_load("60000")
        sel.type("id=app_name", "jmeter7-app")
        sel.type("id=app_description", "This is jmeter7 connfu app")
        sel.click("id=app_submit")
        sel.wait_for_page_to_load("60000")
        sel.click("xpath=//div[@class='table']/a/div/div[2]/p/b")
        sel.wait_for_page_to_load("60000")
        sel.click("xpath=//div[@id='content']/div[3]")
        sel.click("xpath=//div[@id='content']/div[4]/div[2]/div")
        sel.click("link=Add channel")
        sel.select("id=channel_type", "RSS")
        sel.type("id=rss_uid", "twitter-uid")
        sel.type("id=rss_uri", "")
        sel.type("id=rss_uid", "rss-uid")
        sel.type("id=rss_uri", "http://www.bbc.co.uk")
        sel.click("id=rss_submit")
        sel.wait_for_page_to_load("60000")
        sel.click("id=app_usage_button")
        sel.click("link=Close")
        sel.click("link=Add channel")
        sel.select("id=channel_type", "Twitter")
        sel.type("id=twitter_uid", "twitter-uid")
        sel.type("id=add_twitter_input", "chiflendotcom")
        sel.type("id=add_twitter_filter_input", "api")
        sel.click("xpath=//div[@class='account_filters']/a/img")
        sel.click("xpath=//td[@class='button']/a/img")
        sel.click("id=create_twitter_channel_button")
        sel.wait_for_page_to_load("60000")
        sel.go_back()
        sel.wait_for_page_to_load("60000")
        sel.click("link=Add channel")
        sel.select("id=channel_type", "Voice")
        sel.type("id=voice_uid", "voice-uid")
        sel.select("id=voice_country", "United Kingdom")
        sel.type("id=voice_topic", "Conference powered by connFu.")
        sel.type("id=voice_welcome_message", "Welcome to connFu, you are going to join the conference")
        sel.type("id=voice_rejected_message", "You are not allowed to join this conference")
        sel.click("xpath=//div[@id='voice_form']//a[.='Cancel']")
        sel.click("link=Add channel")
        sel.select("id=channel_type", "Voice")
        sel.click("id=voice_topic")
        sel.type("id=voice_welcome_message", "Welcome to connFu, you are going to join the conference")
        sel.type("id=voice_rejected_message", "You are not allowed to join this conference")
        sel.click("id=voice_submit")
        sel.wait_for_page_to_load("60000")
        sel.click("xpath=//div[@id='content']//div[normalize-space(.)='Voice']")
        sel.type("id=whitelisted_name", "jmeter7")
        sel.type("id=whitelisted_phone", "11340927863")
        sel.click("xpath=//div[@id='whitelist_form']//button[.='Add']")
        sel.click("xpath=//div[@class='app-create-button']/input")
        sel.wait_for_page_to_load("60000")
        sel.click("xpath=//div[@id='content']//span[normalize-space(.)='http://www.bbc.co.uk']")
        sel.type("xpath=//form[@id='edit_rss_4eb3d8fc9c7ec109ba000037']/dl/div/dd/input", "http://www.cnn.com")
        sel.click("xpath=//div[@class='app-create-button']/input")
        sel.wait_for_page_to_load("60000")
        sel.click("link=Documentation")
        sel.wait_for_page_to_load("60000")
        sel.click("link=Support")
        sel.wait_for_page_to_load("60000")
        sel.click("link=How it Works")
        sel.wait_for_page_to_load("60000")
        sel.click("link=My apps")
        sel.wait_for_page_to_load("60000")
        sel.click("id=step_2")
        sel.wait_for_page_to_load("60000")
        sel.click("link=Support")
        sel.wait_for_page_to_load("60000")
        sel.click("link=My apps")
        sel.wait_for_page_to_load("60000")
        sel.click("id=step_1")
        sel.wait_for_page_to_load("60000")
        sel.click("link=jmeter7")
        sel.wait_for_page_to_load("60000")
        sel.type("id=user_password_confirmation", "jmeter7")
        sel.type("id=user_current_password", "jmeter7")
        sel.type("id=user_password", "jmeter7")
        sel.click("id=user_submit")
        sel.wait_for_page_to_load("60000")
        sel.click("link=Sign out")
        sel.wait_for_page_to_load("60000")
    
    def tearDown(self):
        self.selenium.stop()
        self.assertEqual([], self.verificationErrors)

if __name__ == "__main__":
    unittest.main()
