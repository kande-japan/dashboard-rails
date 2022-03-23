# frozen_string_literal: true

yasu = User.create(
  name: 'Yasutaka Nishihara',
  email: 'yassan@gmail.com',
  password: 'yassanyassanyassan'
)

SlackUser.create(
  id: 'U12345678',
  user_id: yasu.id
)
