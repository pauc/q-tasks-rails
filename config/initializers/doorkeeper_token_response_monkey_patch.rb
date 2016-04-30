module Doorkeeper
  module OAuth
    class TokenResponse

      def body
        {
          'access_token'      => token.token,
          'token_type'        => token.token_type,
          'expires_in'        => token.expires_in_seconds,
          'refresh_token'     => token.refresh_token,
          'scope'             => token.scopes_string,
          'created_at'        => token.created_at.to_i,
          'resource_owner_id' => token.resource_owner_id
        }.reject { |_, value| value.blank? }
      end
    end
  end
end
