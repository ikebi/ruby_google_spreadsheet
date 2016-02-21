require "rubygems"
require "google_drive"

client_id     = "[クライアントID]"
client_secret = "[クライアントシークレット]"
refresh_token = "[リフレッシュトークン]"
client = OAuth2::Client.new(
    client_id,
    client_secret,
    site: "https://accounts.google.com",
    token_url: "/o/oauth2/token",
    authorize_url: "/o/oauth2/auth")
auth_token = OAuth2::AccessToken.from_hash(client,{:refresh_token => refresh_token, :expires_at => 3600})
auth_token = auth_token.refresh!
session = GoogleDrive.login_with_oauth(auth_token.token)
ws = session.spreadsheet_by_key("[スプレッドシートID]").worksheets[0]

#処理
  
ws.save