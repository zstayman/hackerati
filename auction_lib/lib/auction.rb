require 'pry'
class Auction
  @@lots = {}

  def initialize(name)
    unless @@lots[name.downcase.gsub(" ", "_").to_sym]
      @name = name
      @@lots[@name.downcase.gsub(" ", "_").to_sym] = self
    end
  end

  def self.lots
    return @@lots
  end
end
