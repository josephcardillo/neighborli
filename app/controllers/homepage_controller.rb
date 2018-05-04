# frozen_string_literal: true

# :nodoc:
class HomepageController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to user_path(current_user) if user_signed_in?
  end
end
