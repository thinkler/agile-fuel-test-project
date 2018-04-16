User.delete_all
Reward.delete_all

User.create(email: 'admin@admin.com', password: 'foopass')

3.times do |i|
  User.create(email: "some#{i}@user.com", password: 'foopass')
end

50.times do
  users = User.all
  reward_statuses = Reward.status.values
  Reward.create(status: reward_statuses.sample, user_id: users.sample.id)
end
