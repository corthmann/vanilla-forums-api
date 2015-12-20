require 'faraday'

module VanillaForumsAPI
  module Configuration

    VALID_OPTIONS_KEYS = [
        # instance
        :endpoint,
        :access_token,
        # connection / faraday
        :adapter,
        :timeout,
        :open_timeout,
        :format
    ].freeze

    DEFAULT_ENDPOINT = nil
    DEFAULT_ACCESS_TOKEN = nil
    DEFAULT_FORMAT = :json
    DEFAULT_ADAPTER = Faraday.default_adapter
    DEFAULT_TIMEOUT = 10
    DEFAULT_OPEN_TIMEOUT = 10

    attr_accessor *VALID_OPTIONS_KEYS

    def self.extended(base)
      base.reset
    end

    def reset
      self.endpoint = DEFAULT_ENDPOINT
      self.access_token = DEFAULT_ACCESS_TOKEN
      self.format = DEFAULT_FORMAT
      self.adapter = DEFAULT_ADAPTER
      self.timeout = DEFAULT_TIMEOUT
      self.open_timeout = DEFAULT_OPEN_TIMEOUT
    end

    def configure
      yield self
    end

    # Return the configuration values set in this module
    def options
      Hash[ * VALID_OPTIONS_KEYS.map { |key| [key, send(key)] }.flatten ]
    end
  end
end
