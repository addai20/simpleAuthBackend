class ApplicationController < ActionController::Base

  def secret_key
    "secret"
  end

  #given a payload {user_id: ?} => token
  def encode(payload)
    JWT.encode(payload, secret_key, 'HS256')
  end

  def decode(token)
    JWT.decode(token, "secret", true, {algorithm: "HS256"})[0]
  end
end
