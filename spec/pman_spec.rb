require "spec_helper"

RSpec.describe Pman do
  it "has a version number" do
    expect(Pman::VERSION).not_to be nil
  end

  describe '.generate()' do
    it 'generates' do
      expect(Pman).to receive(:generate_password).and_call_original
      expect(Pman).to receive(:persist_password).and_call_original
      expect(Pman.generate('fb')).to_not be_nil
    end
  end

  describe '.generate_password()' do
    it 'generates' do
      expect(Pman.generate_password).to_not be_nil
    end

    it 'generates with default length of 8' do
      expect(Pman.generate_password.size).to eq(8)
    end

    it 'generates of X length' do
      length = 10
      expect(Pman.generate_password(length).size).to eq(length)
    end

    it 'generates of odd length' do
      length = 11
      expect(Pman.generate_password(length).size).to eq(length)
    end

    it 'generates of even length' do
      length = 12
      expect(Pman.generate_password(length).size).to eq(length)
    end

    it 'composes of alphanumeric + special characters' do
      length = 10
      expect(Pman.generate_password(length).size).to eq(length)
    end
  end

  describe '.persist_password()' do
    it 'persists' do
      app, password = 'fb', 'abc123+-'

      Pman.persist_password(app, password)
      passwords = YAML.load_file('passwords.yml')

      expect(passwords[app]).to eq(password)
    end
  end

  describe '.retrieve_password()' do
    it 'retrieves' do
      app, password = 'fb', 'abc123+-'

      Pman.persist_password(app, password)
      retrieved_password = Pman.retrieve_password(app)

      expect(retrieved_password).to eq(password)
    end
  end
end
