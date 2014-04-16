require 'spec_helper'
require_relative '../lib/auction'

describe Auction do
  before(:each) do
    Auction.class_variable_set :@@lots, {}
  end
  it "should have a name" do
    lot = Auction.new("Art")
    expect(Auction.lots[:art]).to eq(lot)
  end

  it "should have a unique name" do
    lot = Auction.new("art")
    Auction.new("art")
    expect(Auction.lots[:art]).to eq(lot)
  end

end
