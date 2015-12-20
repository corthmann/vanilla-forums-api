require 'spec_helper'
require 'vanilla-forums-api/models/discussion'

describe VanillaForumsAPI::Discussion do

  describe '.find_all' do
    it 'returns a list of discussions' do
      stub_get('discussions/list', { 'Page' => 1}).to_return(:body => '[{ "ID": 1 }]', :headers => { :content_type => "application/json" })
      expect(described_class.find_all).to eql([{ 'ID' => 1 }])
    end
  end

  describe '.find_by_category_id' do
    it 'returns a list of discussions of the given category' do
      stub_get('discussions/category', { 'CategoryID' => 1, 'Page' => 1}).to_return(:body => '[{ "ID": 1 }]', :headers => { :content_type => "application/json" })
      expect(described_class.find_by_category_id(1)).to eql([{ 'ID' => 1 }])
    end
  end

  describe '.find_by_category_id' do
    it 'returns a list of discussions of the given category' do
      stub_get('discussions/category', { 'UrlCode' => 'asd', 'Page' => 1}).to_return(:body => '[{ "ID": 1 }]', :headers => { :content_type => "application/json" })
      expect(described_class.find_by_category_url_code('asd')).to eql([{ 'ID' => 1 }])
    end
  end
end
