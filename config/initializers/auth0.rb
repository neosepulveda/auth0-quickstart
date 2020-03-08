# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    Rails.application.credentials.dig(:auth0, Rails.env.to_sym, :client_id),
    Rails.application.credentials.dig(:auth0, Rails.env.to_sym, :client_secret),
    'neo-dev.eu.auth0.com',
    callback_path: '/auth/auth0/callback',
    authorize_params: {
      scope: 'openid email profile'
    }
  )
end
