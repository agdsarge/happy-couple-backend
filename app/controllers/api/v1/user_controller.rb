class Api::V1::UserController < ApplicationController
    before_action :authorize_request

end