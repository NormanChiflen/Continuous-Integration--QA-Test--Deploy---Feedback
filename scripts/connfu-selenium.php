<?php

require_once 'PHPUnit/Extensions/SeleniumTestCase.php';

class Example extends PHPUnit_Extensions_SeleniumTestCase
{
  protected function setUp()
  {
    $this->setBrowser("*chrome");
    $this->setBrowserUrl("http://localhost:3000/");
  }

  public function testMyTestCase()
  {
    $this->open("/");
    $this->waitForPageToLoad("60000");
    $this->open("/");
    $this->click("link=Sign up");
    $this->waitForPageToLoad("60000");
    $this->type("xpath=//form[@id='user_new']/dl[1]/dd/input", "jmeter7");
    $this->type("id=user_email", "abc@aol.com");
    $this->type("xpath=//form[@id='user_new']/dl[3]/dd/input", "jmeter7");
    $this->type("id=user_password_confirmation", "jmeter7");
    $this->click("id=user_submit");
    $this->waitForPageToLoad("60000");
    $this->click("link=How it Works");
    $this->click("link=My apps");
    $this->waitForPageToLoad("60000");
    $this->click("id=step_3");
    $this->waitForPageToLoad("60000");
    $this->type("id=app_name", "jmeter7-app");
    $this->type("id=app_description", "This is jmeter7 connfu app");
    $this->click("id=app_submit");
    $this->waitForPageToLoad("60000");
    $this->click("xpath=//div[@class='table']/a/div/div[2]/p/b");
    $this->waitForPageToLoad("60000");
    $this->click("xpath=//div[@id='content']/div[3]");
    $this->click("xpath=//div[@id='content']/div[4]/div[2]/div");
    $this->click("link=Add channel");
    $this->select("id=channel_type", "RSS");
    $this->type("id=rss_uid", "twitter-uid");
    $this->type("id=rss_uri", "");
    $this->type("id=rss_uid", "rss-uid");
    $this->type("id=rss_uri", "http://www.bbc.co.uk");
    $this->click("id=rss_submit");
    $this->waitForPageToLoad("60000");
    $this->click("id=app_usage_button");
    $this->click("link=Close");
    $this->click("link=Add channel");
    $this->select("id=channel_type", "Twitter");
    $this->type("id=twitter_uid", "twitter-uid");
    $this->type("id=add_twitter_input", "chiflendotcom");
    $this->type("id=add_twitter_filter_input", "api");
    $this->click("xpath=//div[@class='account_filters']/a/img");
    $this->click("xpath=//td[@class='button']/a/img");
    $this->click("id=create_twitter_channel_button");
    $this->waitForPageToLoad("60000");
    $this->goBack();
    $this->waitForPageToLoad("60000");
    $this->click("link=Add channel");
    $this->select("id=channel_type", "Voice");
    $this->type("id=voice_uid", "voice-uid");
    $this->select("id=voice_country", "United Kingdom");
    $this->type("id=voice_topic", "Conference powered by connFu.");
    $this->type("id=voice_welcome_message", "Welcome to connFu, you are going to join the conference");
    $this->type("id=voice_rejected_message", "You are not allowed to join this conference");
    $this->click("xpath=//div[@id='voice_form']//a[.='Cancel']");
    $this->click("link=Add channel");
    $this->select("id=channel_type", "Voice");
    $this->click("id=voice_topic");
    $this->type("id=voice_welcome_message", "Welcome to connFu, you are going to join the conference");
    $this->type("id=voice_rejected_message", "You are not allowed to join this conference");
    $this->click("id=voice_submit");
    $this->waitForPageToLoad("60000");
    $this->click("xpath=//div[@id='content']//div[normalize-space(.)='Voice']");
    $this->type("id=whitelisted_name", "jmeter7");
    $this->type("id=whitelisted_phone", "11340927863");
    $this->click("xpath=//div[@id='whitelist_form']//button[.='Add']");
    $this->click("xpath=//div[@class='app-create-button']/input");
    $this->waitForPageToLoad("60000");
    $this->click("xpath=//div[@id='content']//span[normalize-space(.)='http://www.bbc.co.uk']");
    $this->type("xpath=//form[@id='edit_rss_4eb3d8fc9c7ec109ba000037']/dl/div/dd/input", "http://www.cnn.com");
    $this->click("xpath=//div[@class='app-create-button']/input");
    $this->waitForPageToLoad("60000");
    $this->click("link=Documentation");
    $this->waitForPageToLoad("60000");
    $this->click("link=Support");
    $this->waitForPageToLoad("60000");
    $this->click("link=How it Works");
    $this->waitForPageToLoad("60000");
    $this->click("link=My apps");
    $this->waitForPageToLoad("60000");
    $this->click("id=step_2");
    $this->waitForPageToLoad("60000");
    $this->click("link=Support");
    $this->waitForPageToLoad("60000");
    $this->click("link=My apps");
    $this->waitForPageToLoad("60000");
    $this->click("id=step_1");
    $this->waitForPageToLoad("60000");
    $this->click("link=jmeter7");
    $this->waitForPageToLoad("60000");
    $this->type("id=user_password_confirmation", "jmeter7");
    $this->type("id=user_current_password", "jmeter7");
    $this->type("id=user_password", "jmeter7");
    $this->click("id=user_submit");
    $this->waitForPageToLoad("60000");
    $this->click("link=Sign out");
    $this->waitForPageToLoad("60000");
  }
}
?>