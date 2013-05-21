require "spec_helper"


describe Pagination do
  before do
    @pagination = Pagination.new(1, 100000, 50)
  end

  describe "#offset" do
    it "returns the correct offset for the first page" do
      @pagination.offset.should == 0
    end
  end

  describe '#max_page' do
    it "returns the max page limit" do 
      @pagination.max_page.should eq(100000/50)
    end
  end

  describe '#pages' do
    it 'returns the lowest range' do
      @pagination.pages.should eq((1..5).to_a)
    end

    it 'returns the highest range' do
      pagination = Pagination.new(2000, 100000, 50)
      pagination.pages.should eq((100000/50-4..100000/50).to_a)
    end

    it 'returns the middle range' do
      pagination = Pagination.new(5, 100000, 50)
      pagination.pages.should eq((3..7).to_a)
    end
  end

  describe '#min_page' do
    it 'returns the min page' do
      @pagination.min_page == 1
    end
  end

end
