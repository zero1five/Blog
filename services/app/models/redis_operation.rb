class RedisOperation
  # def self.set_name(name)
  #   $redis.set('name',name)
  # end
  def self.set_token(key, expireTime)
    $redis.set(key, true)
    $redis.expire(key, expireTime)
  end

  def self.get_token(key)
    $redis.get(key)
  end

  def self.del_token(key)
    $redis.del(key)
  end
end