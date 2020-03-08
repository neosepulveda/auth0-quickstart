# frozen_string_literal: true

module LogoutHelper
  def logout_url
    domain = Rails.application.secrets.auth0_domain
    client_id = Rails.application.secrets.auth0_client_id
    request_params = {
      returnTo: root_url,
      client_id: client_id
    }

    URI::HTTPS.build(host: domain, path: '/v2/logout', query: to_query(request_params))
  end

  private

  def to_query(hash)
    hash.map do |k, v|
      "#{k}=#{CGI.escape(v)}" unless v.nil?
    end .reject(&:nil?).join('&')
  end
end
