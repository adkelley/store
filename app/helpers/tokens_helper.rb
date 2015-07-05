module TokensHelper

  def new_token(id)
    token = ApiToken.new
    token.hex_value = new_uuid
    token.store_id = id
    token.save
  end

  def change_token(token)
    token.hex_value = new_uuid
    token.save
  end

  private
  def new_uuid
    uuid = UUID.new
    uuid.generate
  end

end
