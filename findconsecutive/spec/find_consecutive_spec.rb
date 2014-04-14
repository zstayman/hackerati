require 'spec_helper'
require_relative '../lib/find_consecutive'

describe "#find_consecutive" do
  it "finds indexes that begin runs of three consecutive values" do
    expect(find_consecutive([1, 2, 3, 5, 10, 9, 8, 9, 10, 11, 7])).to eq([0, 4, 6, 7])
  end

  it "returns nil if there are no runs" do
    expect(find_consecutive([2,5,7,3,4,2,9])).to eq(nil)
  end
end
