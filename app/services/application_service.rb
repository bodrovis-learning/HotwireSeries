# frozen_string_literal: true

class ApplicationService
  include AfterCommitEverywhere

  def self.call(...)
    new(...).call
  end

  def initialize(*_); end

  def call
    return unless @object.present? && @object.respond_to?(:errors)

    [@object.errors.none?, @object]
  end

  private

  def tx_and_commit
    return unless block_given?

    ActiveRecord::Base.transaction do
      result = yield

      after_commit { post_call } if result && respond_to?(:post_call, true)
    end
  end

  def broadcast_later(channel, template, **params)
    Turbo::StreamsChannel.broadcast_render_later_to(
      channel,
      template:,
      **params
    )
  end
end
