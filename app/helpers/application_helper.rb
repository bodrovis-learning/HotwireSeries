# frozen_string_literal: true

module ApplicationHelper
  def prepend_flash
    turbo_stream.prepend 'flash', partial: 'shared/flash'
  end
end
