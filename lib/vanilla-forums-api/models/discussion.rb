require_relative 'resource'

module VanillaForumsAPI
  class Discussion < Resource

    # Docs: http://docs.vanillaforums.com/api/discussions/

    def self.find_all(page = 1)
      get('discussions/list', { 'Page' => page})
    end

    def self.find_by_category_id(category_id, page = 1)
      get('discussions/category', { 'CategoryID' => category_id, 'Page' => page })
    end

    def self.find_by_category_url_code(url_code, page = 1)
      get('discussions/category', { 'UrlCode' => url_code, 'Page' => page })
    end

    def self.add(options = {})
      post('discussions/add', options)
    end

    def self.edit(options = {})
      post('discussions/edit', options)
    end

    def self.bookmark(discussion_id, user_id, bookmark = true)
      post('discussions/bookmark', {
                                     'Discussion' => discussion_id,
                                     'User' => user_id,
                                     'Bookmark' => bookmark
                                 })
    end

    def self.bookmarked
      get('discussions/bookmarked')
    end
  end
end
