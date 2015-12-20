require_relative 'resource'

module VanillaForumsAPI
  class Role < Resource

    # Docs: http://docs.vanillaforums.com/api/roles/

    def self.find_all
      get('roles/list')
    end

    def self.find_by_id(role_id)
      get('roles/get', { 'RoleID' => role_id })
    end

    def self.add(options = {})
      post('roles/add', options)
    end

    def self.edit(options = {})
      post('roles/edit', options)
    end
  end
end
