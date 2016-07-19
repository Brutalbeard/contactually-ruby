require 'spec_helper'

describe Contactually::Accounts do

  let(:account_json) { File.read(File.join(File.dirname(__FILE__),"fixtures/account.json")) }
  let(:accounts_index_json) { File.read(File.join(File.dirname(__FILE__),"fixtures/accounts_index.json")) }

  before(:all) do
    Contactually.configure { |c| c.access_token = 'VALID_ACCESS_TOKEN' }
    @master = Contactually::API.new
  end

  subject { described_class.new @master }
  describe '#initialize' do
    specify do
      expect(subject).to be_kind_of Contactually::Accounts
    end

    specify do
      expect(subject.instance_variable_get(:@master)).to be_kind_of Contactually::API
    end
  end

  describe '#index' do
    it 'calls the api with correct params' do
      allow(@master).to receive(:call).with('accounts.json', :get, { foo: :bar }).and_return({ 'data' => [] })
      subject.index({ foo: :bar })
      expect(@master).to have_received(:call)
    end

    it 'returns accounts from json response' do
      allow(@master).to receive(:call).with('accounts.json', :get, {}).and_return(JSON.load(accounts_index_json))
      expect(subject.index({})).to be_kind_of Array
      expect(subject.index({})[0]).to be_kind_of Contactually::Account
    end
  end

  describe '#show' do
    it 'calls the api with correct params' do
      allow(@master).to receive(:call).with('accounts/1.json', :get, { foo: :bar }).and_return({ 'data' => {id: 1 }})
      subject.show(1, { foo: :bar })
      expect(@master).to have_received(:call)
    end

    it 'returns an account' do
      allow(@master).to receive(:call).with('accounts/1.json', :get, { foo: :bar }).and_return(JSON.load(account_json))
      expect(subject.show(1, { foo: :bar })).to be_kind_of Contactually::Account
    end
  end

  describe '#destroy' do
    it 'calls the api with correct params' do
      allow(@master).to receive(:call).with('accounts/1.json', :delete, {})
      subject.destroy(1)
      expect(@master).to have_received(:call)
    end
  end
end
