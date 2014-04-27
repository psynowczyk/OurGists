class StaticPagesController < ApplicationController
  skip_before_filter :require_login

  def login_required
  end

  def login_failed
  end
end
