require 'vanilla-forums-api/request'
require 'vanilla-forums-api/connection'

module VanillaForumsAPI
  class Resource
    extend Connection
    extend Request

  end
end
