json.extract! user, :id, :social_id, :social_token, :social_type, :social_imgurl, :social_email, :social_name, :device_id, :device_name, :device_type, :security_token, :advertising_id, :referral_code, :version_name, :version_code, :location, :source_ip, :fcm_token, :utm_source, :utm_medium, :utm_term, :utm_content, :utm_campaign, :utm_gclid, :created_at, :updated_at
json.url user_url(user, format: :json)
