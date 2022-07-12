module ApplicationHelper
  def prepend_flash
    turbo_stream.prepend 'flash', partial: 'shared/flash'
  end
end
