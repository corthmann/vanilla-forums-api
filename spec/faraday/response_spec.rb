require 'spec_helper'
require 'vanilla-forums-api'
require 'vanilla-forums-api/models/discussion'

describe Faraday::Response do
  {
      400 => VanillaForumsAPI::BadRequest,
      401 => VanillaForumsAPI::Unauthorized,
      403 => VanillaForumsAPI::Forbidden,
      404 => VanillaForumsAPI::NotFound,
      500 => VanillaForumsAPI::InternalServerError,
      501 => VanillaForumsAPI::NotImplemented,
      502 => VanillaForumsAPI::BadGateway,
      503 => VanillaForumsAPI::ServiceUnavailable
  }.each do |status, exception|
    context "when HTTP status is #{status}" do
      it "should raise #{exception.name} error" do
        stub_get('discussions/list', { 'Page' => 1}).to_return(:body => '', :status => status)
        expect { VanillaForumsAPI::Discussion.find_all }.to raise_error(exception)
      end
    end
  end
end
