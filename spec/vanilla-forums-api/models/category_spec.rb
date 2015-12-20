require 'spec_helper'
require 'vanilla-forums-api/models/category'

describe VanillaForumsAPI::Category do
  describe '.find_all' do
    it 'returns a list of categories' do
      stub_get('categories/list').to_return(:body => '[{ "ID": 1 }]', :headers => { :content_type => "application/json" })
      expect(described_class.find_all).to eql([{ 'ID' => 1 }])
    end
  end

  describe '.find_by_id' do
    it 'returns a category' do
      stub_get('categories/get', { 'CategoryID' => 1 }).to_return(:body => '{ "ID": 1 }', :headers => { :content_type => "application/json" })
      expect(described_class.find_by_id(1)).to eql({ 'ID' => 1})
    end
  end
end
