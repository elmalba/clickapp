# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class AnswersChannel < ApplicationCable::Channel
  include NoBrainer::Streams

  def subscribed

    stream_from Answer.all, include_initial: true
  end

  def unsubscribed

  end
end
