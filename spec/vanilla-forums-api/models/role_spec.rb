require 'spec_helper'
require 'vanilla-forums-api/models/role'

describe VanillaForumsAPI::Role do
  describe '.find_all' do
    it 'returns a list of roles' do
      stub_get('roles/list').to_return(:body => '[{ "ID": 1 }]', :headers => { :content_type => "application/json" })
      expect(described_class.find_all).to eql([{ 'ID' => 1 }])
    end
  end

  describe '.find_by_id' do
    it 'returns the role with the given ID' do
      stub_get('roles/get', { 'RoleID' => 1 }).to_return(:body => '{ "ID": 1 }', :headers => { :content_type => "application/json" })
      expect(described_class.find_by_id(1)).to eql({ 'ID' => 1})
    end
  end
end
