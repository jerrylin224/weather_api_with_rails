class User < ApplicationRecord
  has_secure_password

  def to_token_payload
    {
      sub: id,
      admin: true,
      email: email
    }
    # 在這邊自訂payload的資訊
  end
end
