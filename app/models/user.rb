class User < ApplicationRecord
  has_many :value_adjustments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:discord]


  # used to return the full discord tag for a user
  def discord_tag
    username + "#" + discriminator
  end

  # used to set all permissions we're storing on a user
  def set_permissions(auth)
    token = auth.credentials.token 
    response = HTTParty.get('http://discordapp.com/api/users/@me/guilds', {
        headers: { "Authorization": "Bearer #{token}"  }
    })

    sprayze_server_id = Rails.application.credentials.dig(:servers, :sprayze)

    # this is a JSON containing all of the user's server data
    servers = response.parsed_response
    servers.each do |server|
      if server["id"] == sprayze_server_id # they're in sprayze discord server
        self.sprayze_member = true
        save
      end
    end
  end

  # used to create or find a user by the discord omniauth response
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.avatar_url = auth.info.image
      user.username = auth.extra.raw_info.username
      user.discriminator = auth.extra.raw_info.discriminator

      user.password = Devise.friendly_token[0, 20]
    end
  end

end
