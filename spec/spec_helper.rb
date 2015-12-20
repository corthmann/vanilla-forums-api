require 'simplecov'
require 'simplecov-rcov'
require 'codeclimate-test-reporter'

SimpleCov.start do
  formatter SimpleCov::Formatter::MultiFormatter[
                SimpleCov::Formatter::HTMLFormatter,
                SimpleCov::Formatter::RcovFormatter,
                CodeClimate::TestReporter::Formatter
            ]
  add_group('VanillaForumsAPI', 'lib/vanilla-forums-api')
  add_group('Specs', 'spec')
end

require 'vanilla-forums-api'

require 'rspec'
require 'webmock/rspec'

RSpec.configure do |config|
  config.include WebMock::API

  config.before(:each) do
    VanillaForumsAPI.configure do |config|
      config.endpoint = 'https://yoursite.vanillaforums.com'
      config.access_token = '123'
    end
  end
end

WebMock.disable_net_connect!(:allow => 'codeclimate.com')

def client_request_url(path, options = {})
  query = options.merge!('access_token' => VanillaForumsAPI.access_token).
      map { |k,v| "#{k}=#{v}" }.join('&')
  "#{VanillaForumsAPI.endpoint}/api/v1/#{path}.#{VanillaForumsAPI.format}?#{query}"
end

def stub_get(path, options = {})
  stub_request(:get, client_request_url(path, options))
end

def stub_post(path)
  stub_request(:post, client_request_url(path))
end
