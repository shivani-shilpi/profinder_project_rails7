FrontEndSkill.find_or_create_by(name: 'HTML')
FrontEndSkill.find_or_create_by(name: 'CSS3')
FrontEndSkill.find_or_create_by(name: 'JavaScript')
FrontEndSkill.find_or_create_by(name: 'JQuery')
FrontEndSkill.find_or_create_by(name: 'Bootstrap')
FrontEndSkill.find_or_create_by(name: 'Rect JS')
FrontEndSkill.find_or_create_by(name: 'Angular JS')
FrontEndSkill.find_or_create_by(name: 'Vue JS')


BackEndSkill.find_or_create_by(name: 'Ruby')
BackEndSkill.find_or_create_by(name: 'Python')
BackEndSkill.find_or_create_by(name: 'Postgresql')
BackEndSkill.find_or_create_by(name: 'Node JS')
BackEndSkill.find_or_create_by(name: 'PHP/Laraval')
BackEndSkill.find_or_create_by(name: 'MySQL')
BackEndSkill.find_or_create_by(name: 'MongoDB')
BackEndSkill.find_or_create_by(name: 'Rest Api')

UserSkill.create(user: User.first, skill: Skill.find(1), rating: 8)
UserSkill.create(user: User.first, skill: Skill.find(2), rating: 8)
UserSkill.create(user: User.first, skill: Skill.find(3), rating: 8)
UserSkill.create(user: User.first, skill: Skill.find(4), rating: 8)
UserSkill.create(user: User.first, skill: Skill.find(5), rating: 8)
UserSkill.create(user: User.first, skill: Skill.find(6), rating: 8)

UserSkill.create(user: User.last, skill: Skill.find(1), rating: 8)
UserSkill.create(user: User.last, skill: Skill.find(4), rating: 8)
UserSkill.create(user: User.last, skill: Skill.find(8), rating: 8)
UserSkill.create(user: User.last, skill: Skill.find(6), rating: 8)
UserSkill.create(user: User.last, skill: Skill.find(7), rating: 8)
UserSkill.create(user: User.last, skill: Skill.find(9), rating: 8)




