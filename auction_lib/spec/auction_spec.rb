require 'spec_helper'
require_relative '../lib/auction'

describe Auction do

  it "should have a name" do
    lot = Auction.new("Art")
    expect(Auction.lots[:art]).to eq(lot)
  end

  it "should have a unique name" do
    Auction.new("Art")
    expect(Auction.new("Art")).to raise_error
  end

end
