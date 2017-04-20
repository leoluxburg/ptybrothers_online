class RegistrationsController < Devise::RegistrationsController
  def create
    super do |user|
      Rider.create(user_id: user.id) if user.id
    end
  end

  protected

  def after_sign_up_path_for(resource)
    if resource.rider
      edit_rider_path(resource.rider)
    else
      super(resource)
    end
  end
end
