class Admin < ApplicationRecord
  #   # Include default devise modules. Others available are:
  #   #  :lockable, :timeoutable, :trackable and :omniauthable

  #   devise :database_authenticatable, :registerable,
  #          :recoverable, :rememberable, :trackable,
  #          :validatable,:confirmable, authentication_keys: [:login],


  #   # attr_accessor :login

  #   # attr_writer :login

  #   def login
  #     @login || username || email
  #   end

  #   def self.find_for_database_authentication(warden_conditions)
  #     conditions = warden_conditions.dup
  #     if (login = conditions.delete(:login))
  #       where(conditions.to_h).where(['username = :value OR email = :value', { value: login.downcase }]).first
  #     else
  #       where(conditions.to_h).first
  #     end
  #   end

  #   def send_devise_notification(notification, *args)
  #     devise_mailer.send(notification, self, *args).deliver_later
  #   end
end
