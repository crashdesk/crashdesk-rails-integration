Given /^remote harvester for exceptions is running$/ do
  stub_request(:post, "http://beta.crashde.sk:9292/v1/crashes").
    with(:headers => { 'X-Crashdesk-AppKey' => Crashdesk.configuration.app_key })
end

Given /^reporting goes to (.+)$/ do |reporters|
  r = reporters.split(',').flatten
  Crashdesk.configure do |config|
    config.reporters = r
  end
end

Given /^I set crashde.sk app key to (.+)$/ do |app_key|
  Crashdesk.configure do |config|
    config.app_key = app_key
  end
end

Then /^I should see error page$/ do
  page.has_content? "Exception in UsersController#index"
  page.has_content? "app/controllers/users_controller.rb:5:in"
end
