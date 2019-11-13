House.create(name: 'Hufflepuff')
# House.create(name: 'Test House 2')

User.create(first_name: "Joseph", last_name: "Lim", email: "joseph@gmail.com", password: "password", password_confirmation: "password", house_id: 1)
User.create(first_name: "David", last_name: "Lim", email: "david@gmail.com", password: "password", password_confirmation: "password", house_id: 1)


Chore.create(name: "Wash the dishes", value: 0, house_id: 1)

Chore.create(name: "Do the laundry", value: 0, house_id: 1)

Chore.create(name: "Walk the dog", value: 3, house_id: 1)

Chore.create(name: "Take out the garbage", value: 2, house_id: 1)

Chore.create(name: "Vacuum the house", value: 6, house_id: 1)

Chore.create(name: "Clean the bathroom", value: 5, house_id: 1)

Suggestion.create(chore_id: 1, user_id: 1, value: 4)

Suggestion.create(chore_id: 2, user_id: 2, value: 4)

UserChore.create(chore_id: 3, user_id: 1, start_of_week: "2019-11-10", completed: false)

UserChore.create(chore_id: 4, user_id: 1, start_of_week: "2019-11-10", completed: false)

UserChore.create(chore_id: 5, user_id: 2, start_of_week: "2019-11-10", completed: false)

UserChore.create(chore_id: 6, user_id: 2, start_of_week: "2019-11-10", completed: false)

UserChore.create(chore_id: 3, user_id: 1, start_of_week: "2019-11-03", completed: false)


# User.create(first_name: "Christine", last_name: "J", email: "christine@gmail.com", password: "password", password_confirmation: "password", house_id: 2)
