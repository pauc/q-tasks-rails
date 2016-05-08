module AuthenticationHelpers

  def self.included(base)
    base.include Devise::TestHelpers
  end

  def with_auth_for(user, token = nil)
    token ||= instance_double "Doorkeeper::AccessToken",
      acceptable?:       true,
      resource_owner_id: user.id,
      token:             'fake_token',
      application:       nil

    allow(controller).to receive(:doorkeeper_token) { token }

    yield
  end
end
