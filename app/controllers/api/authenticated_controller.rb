module Api
  class AuthenticatedController < BaseApiController
    before_action :authenticate_account!
  end
end
