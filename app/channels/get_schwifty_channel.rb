# Channel for handling schwifty subscriptions
class GetSchwiftyChannel < ApplicationCable::Channel
  include GetSchwifty::Channel

  def unsubscribe
    puts "Unsub'ed"
  end
end
