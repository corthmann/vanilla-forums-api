module VanillaForumsAPI
  class Error < StandardError
    def inspect
      "#<VanillaForumsAPI::Error: VanillaForumsAPI::Error message=\"#{message}\">"
    end
  end

  # 400 HTTP
  class BadRequest < Error; end

  # 401 HTTP
  class Unauthorized < Error; end

  # 403 HTTP
  class Forbidden < Error; end

  # 404 HTTP
  class NotFound < Error; end

  # 500 HTTP
  class InternalServerError < Error; end

  # 501 HTTP
  class NotImplemented < Error; end

  # 502 HTTP
  class BadGateway < Error; end

  # 503 HTTP
  class ServiceUnavailable < Error; end
end
