require 'spec_helper'
require_relative '../lib/auction'
require 'pry'

describe Auction do
  before(:each) do
    Auction.class_variable_set :@@lots, {}
    @auction = Auction.new("Art", 100)
  end
  it "should have a name" do
    expect(Auction.lots[:art]).to eq(@auction)
  end

  it "should have a unique name" do
    Auction.new("Art")
    expect(Auction.lots[:art]).to be(@auction)
  end

  describe "Auction#start" do
    it "should be able to be started" do
      @auction.start
      expect(@auction.active?).to eq(true)
    end
  end

  describe "Auction#active?" do
    it "should tell you if the auction has started" do
      expect(@auction.active?).to eq(false)
      @auction.start
      expect(@auction.active?).to eq(true)
    end
  end

  describe "Auction#bid" do
    it "changes the bid unless there is already a higher bid" do
      @auction.start
      @auction.bid(2000, "Zack")
      expect(@auction.high_bid?).to eq(2000)
      expect(@auction.high_bidder).to eq("Zack")
      @auction.bid(1000, "Joe")
      expect(@auction.high_bid?).to eq(2000)
      expect(@auction.high_bidder).to eq("Zack")
    end

    describe "Auction#end" do
      it "ends the auction" do
        @auction.end
        expect(@auction.active?).to eq(false)
      end
    end

    describe "Auction#status" do
      context "a successful auction" do
        it "describes the status of the auction" do
          expect(@auction.status).to eq("Art has not yet begun.")
          @auction.start
          expect(@auction.status).to eq("The auction on Art has begun, but nobody has bid yet")
          @auction.bid(1000, "Zack")
          expect(@auction.status).to eq("The highest bidder on Art is Zack with $1000")
          @auction.bid(2000, "Joe")
          expect(@auction.status).to eq("The highest bidder on Art is Joe with $2000")
          @auction.end
          expect(@auction.status).to eq("The auction has concluded, Joe won with a bid of $2000")
        end
      end

      context "an auction where the high bid does not meet the reserve" do
        it "describes the status of the auction" do
          @auction.start
          @auction.bid(10, "Jim")
          @auction.end
          expect(@auction.status).to eq("Art failed to sell because the reserve price was not met")
        end
      end

      describe "query" do
        it "Allows you to search for the status of a specific item" do
          expect(Auction.query("Art")).to eq("Art has not yet begun.")
        end
      end

    end
  end

end
