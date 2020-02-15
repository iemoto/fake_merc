def facebook_mock(name)
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
    provider: 'facebook',
    uid: 1234567890,
    info: {
      nick_name: name,
      email: "email@kkk",
    },
    credentials: {
      token: 'kou1234'
    }
  )
end


OmniAuth.config.test_mode = true