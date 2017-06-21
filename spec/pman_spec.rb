require "spec_helper"

RSpec.describe Pman do
  it "has a version number" do
    expect(Pman::VERSION).not_to be nil
  end

  describe '.generate()' do
    it 'generates password' do
      expect(Pman.generate()).to_not be_nil
    end

    it 'generates password with default length of 8' do
      expect(Pman.generate().size).to eq(8)
    end

    it 'generates password of X length' do
      length = 10
      expect(Pman.generate(length).size).to eq(length)
    end

    it 'generates password of odd length' do
      length = 11
      expect(Pman.generate(length).size).to eq(length)
    end

    it 'generates password of even length' do
      length = 12
      expect(Pman.generate(length).size).to eq(length)
    end

    it 'generates password compose of alphanumeric + special characters' do
      length = 10
      expect(Pman.generate(length).size).to eq(length)
    end
  end
end
