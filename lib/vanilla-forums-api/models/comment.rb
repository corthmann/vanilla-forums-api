require_relative 'resource'

module VanillaForumsAPI
  class Comment < Resource

    # Docs: http://docs.vanillaforums.com/api/comments/

    def self.add(options = {})
      post('comments/add', options)
    end
  end
end
