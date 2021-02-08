class Cookie < ActiveRecord::Base
  require 'byebug'

  belongs_to :storage, polymorphic: :true
  
  validates :storage, presence: true

  def ready?(cookie)
    # byebug
    if(cookie.pickup_time >= Time.now) 
      return false
    end
    true
  end

  def time_left(cookie)
    time = cookie.pickup_time - cookie.created_at
    if(time < 1 )
      return "Cookie is ready for pickup"
    end
    return "Cookie will be ready in about #{(time/60).round()} minutes"
  end

end
