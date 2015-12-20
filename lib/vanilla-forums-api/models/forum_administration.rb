require_relative 'resource'

module VanillaForumsAPI
  class ForumAdministration < Resource

    # Docs: http://docs.vanillaforums.com/api/forum-administration/

    def self.find_all
      get('configuration')
    end
  end
end
