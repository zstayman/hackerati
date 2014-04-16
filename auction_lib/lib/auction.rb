require 'pry'
class Auction
  @@lots = {}

  def initialize(name)

    if @@lots[name.downcase.gsub(" ", "_").to_sym]
      raise StandardError
    else
      @name = name
      @@lots[@name.downcase.gsub(" ", "_").to_sym] = self
    end
  end

  def self.lots
    return @@lots
  end
end
