require "spec_helper"

RSpec.describe Pman do
  it "has a version number" do
    expect(Pman::VERSION).not_to be nil
  end

  describe '.generate()' do
    it 'generates' do
      expect(Pman).to receive(:generate_password).and_call_original
      expect(Pman.generate).to_not be_nil
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
end
