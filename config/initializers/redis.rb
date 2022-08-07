# frozen_string_literal: true

# rubocop:disable Style/GlobalVars\
if Rails.env.production?
  $redis = Redis.new(url: ENV.fetch('REDIS_URL', nil), ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE })
end
# rubocop:enable Style/GlobalVars