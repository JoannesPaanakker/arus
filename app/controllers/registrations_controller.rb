class RegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(resource)
      bookings_path
    end
end
