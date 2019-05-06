# app/lib/json_web_token.rb
class JsonWebToken
  # 一个随机字符串
  HMAC_SECRET = Rails.application.secrets.secret_key_base

  # 编码方法
  def self.encode(payload, exp = 15.minutes.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, HMAC_SECRET)
  end

  # 解码方法
  def self.decode(token)
    body = JWT.decode(token, HMAC_SECRET)[0]
    HashWithIndifferentAccess.new body
  rescue JWT::DecodeError => e
    raise ExceptionHandler::InvalidToken, e.message
  end
end