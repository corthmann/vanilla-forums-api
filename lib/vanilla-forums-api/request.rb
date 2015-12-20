module VanillaForumsAPI
  module Request

    def get(path, options = {})
      request(:get, path, options)
    end

    def post(path, options = {})
      request(:post, path, options)
    end

    def put(path, options = {})
      request(:put, path, options)
    end

    def delete(path, options = {})
      request(:delete, path, options)
    end

    private

    def request(method, path, options)
      path << ".#{VanillaForumsAPI.format}"
      response = connection.send(method) do |request|
        case method
          when :get, :delete
            request.url(path, options.merge!(:access_token => VanillaForumsAPI.access_token))
          when :post, :put
            request.url(path, options.merge!(:access_token => VanillaForumsAPI.access_token))
            request.body = options if !options.empty?
        end
      end
      response.body
    end
  end
end
