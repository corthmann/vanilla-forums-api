require_relative 'resource'

module VanillaForumsAPI
  class Category < Resource

    # Docs: http://docs.vanillaforums.com/api/categories/

    def self.find_all
      get('categories/list')
    end

    def self.find_by_id(category_id)
      get('categories/get', { 'CategoryID' => category_id })
    end

    def self.add(options = {})
      post('categories/add', options)
    end

    def self.edit(options = {})
      post('categories/edit', options)
    end

    def self.delete(options = {})
      post('categories/delete', options)
    end
  end
end