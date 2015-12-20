require 'faraday'

module FaradayMiddleware
  class RaiseHttpException < Faraday::Middleware
    def call(env)
      @app.call(env).on_complete do |response|
        case response[:status].to_i
          when 400 then raise VanillaForumsAPI::BadRequest,             response[:body]
          when 401 then raise VanillaForumsAPI::Unauthorized,           response[:body]
          when 403 then raise VanillaForumsAPI::Forbidden,              response[:body]
          when 404 then raise VanillaForumsAPI::NotFound,               response[:body]
          when 500 then raise VanillaForumsAPI::InternalServerError,    response[:body]
          when 501 then raise VanillaForumsAPI::NotImplemented,         response[:body]
          when 502 then raise VanillaForumsAPI::BadGateway,             response[:body]
          when 503 then raise VanillaForumsAPI::ServiceUnavailable,     response[:body]
        end
      end
    end

    def initialize(app)
      super app
    end
  end
end
