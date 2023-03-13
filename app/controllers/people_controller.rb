# https://github.com/heartcombo/devise#getting-started

class PeopleController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
  end

  def show
  end
end
