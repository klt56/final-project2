class User < ApplicationRecord
  after_create :create_stripe_customer
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable,
	:jwt_authenticatable,
	jwt_revocation_strategy: JwtDenylist

  def create_stripe_customer
    customer = Stripe::Customer.create({
      email: self.email,
    })
    self.stripe_customer_id = customer.id
    self.save
  end


#--------------mailer--------------------------------
after_create :welcome_send

def welcome_send
  UserMailer.user_created(self).deliver_now
end

#------------------------------------------------------

end
