require 'rails_helper'
require 'unit_test'

# Dummy class for containing the IUCat module during testing
class UnitTester
end

describe 'UnitTest Module' do
  before :each do
    @unit_test = UnitTester.new
    @unit_test.extend(UnitTest)
  end

  describe 'Converting from hex' do
    it 'can convert a string from hex to ascii' do
      expect(@unit_test.from_hex('476f20426c756521')).to match('Go Blue!')
    end

    it 'raises an error when passed a string that contains non hex characters' do
      expect { @unit_test.from_hex('476f20426c756521-') }.to raise_error
    end

    xit 'raises an ArgumentError when passed a string that contains non hex characters' do
      expect { @unit_test.from_hex('476f20426c756521-') }.to raise_error(ArgumentError)
    end
  end

  describe 'swapping between hex and ascii' do
    xit 'converts an ascii string to hex' do
      expect(@unit_test.hex_ascii_swapper('-')).to match('2d')
    end

    xit 'converts hex to ascii' do
      expect(@unit_test.hex_ascii_swapper('2d')).to match('-')
    end
  end

  describe 'converting an ascii string to hex' do
    xit 'converts ascii to hex' do
      expect(@unit_test.to_hex('Hunan')).to match('48756e616e')
    end

    xit 'raises an ArgumentError when passed a string that contains non ascii characters' do
      expect { @unit_test.to_hex('長沙 Hunan') }.to raise_error(ArgumentError)
    end

    xit 'raises an error when passed a string that is entirely non ascii characters' do
      expect { @unit_test.to_hex('長沙') }.to raise_error
    end

    xit 'raises an ArgumentError when passed a string that is entirely non ascii characters' do
      expect { @unit_test.to_hex('長沙') }.to raise_error(ArgumentError)
    end
  end
end
