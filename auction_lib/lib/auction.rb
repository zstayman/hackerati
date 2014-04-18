require 'pry'
class Auction
  @@lots = {}

  def initialize(name, reserve=0)
    unless @@lots[name.hash_key]
      @name = name
      @reserve = reserve
      @@lots[self.name.hash_key] = self
      @active = false
      @current_bid = 0
      @high_bidder = ""
      @status = "#{self.name} has not yet begun."
    end
  end

  def self.lots
    return @@lots
  end

  def start
    @active = true
    @status = "The auction on #{self.name} has begun, but nobody has bid yet"
  end

  def active?
    return @active
  end

  def bid(amount, bidder_name)
    if self.active?
      if amount > self.high_bid?
        @current_bid = amount
        @high_bidder = bidder_name
        @status = "The highest bidder on Art is #{self.high_bidder} with $#{self.high_bid?}"
      end
    end
  end

  def high_bid?
    return @current_bid
  end

  def high_bidder
    return @high_bidder
  end

  def end
    @active = false
    if self.high_bid? > @reserve
      @status = "The auction has concluded, #{self.high_bidder} won with a bid of $#{self.high_bid?}"
    else
      @status = "#{self.name} failed to sell because the reserve price was not met"
    end
  end

  def status
    return @status
  end

  def name
    return @name
  end

  def self.query(name)
    self.lots[name.hash_key].status
  end


end

class String
  def hash_key
    self.downcase.gsub(" ", "_").to_sym
  end
end
