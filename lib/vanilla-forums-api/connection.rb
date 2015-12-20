require 'faraday_middleware'
Dir[File.expand_path('../../faraday/*.rb', __FILE__)].each { |f| require f }

module VanillaForumsAPI
  module Connection
    private

    def connection
      options = {
          :headers => {
              'Accept' => "application/#{VanillaForumsAPI.format}; charset=utf-8"
          },
          :url => "#{VanillaForumsAPI.endpoint}/api/v1/"
      }

      Faraday::Connection.new(options) do |connection|
        connection.request :json
        connection.use Faraday::Request::UrlEncoded
        connection.options.timeout =  VanillaForumsAPI.timeout # open/read timeout in seconds
        connection.options.open_timeout = VanillaForumsAPI.open_timeout # connection open timeout in seconds

        case VanillaForumsAPI.format.to_s.downcase
          when 'json' then connection.response :json, :content_type => /\bjson$/
        end
        connection.use FaradayMiddleware::RaiseHttpException
        connection.adapter(VanillaForumsAPI.adapter)
      end
    end
  end
end
