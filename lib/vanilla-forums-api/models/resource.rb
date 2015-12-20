require 'vanilla-forums-api/request'
require 'vanilla-forums-api/connection'

module VanillaForumsAPI
  class Resource# < Hashie::Mash
    extend Connection
    extend Request

  end
end
