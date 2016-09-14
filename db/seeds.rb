%w(Hobby Sport Animals).each { |name| Category.create(name: name) }
first_user = FactoryGirl.create(:user, email: 'demo@example.com', password: 'password')
second_user = FactoryGirl.create(:user, email: 'native@example.com', password: 'password')
3.times { FactoryGirl.create(:post, user: first_user) }
2.times { FactoryGirl.create(:post, user: second_user) }
