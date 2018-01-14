badges = [
  ['Backend master', 
    'https://images.vexels.com/media/users/3/128828/isolated/preview/b05860803629a6f615a6c43e46e5ff5d-star-usa-flag-badge-by-vexels.png', 
    'Category', 'Backend'],

  ['Level completed',
    'https://images.vexels.com/media/users/3/134165/isolated/preview/435c122f8420a57fd38d06a30292f2bb-star-flat-icon-68-by-vexels.png',
    'Level', '2'],

  ['Successful First Attempt',
    'https://images.vexels.com/media/users/3/127643/isolated/preview/ddf5b413162921f0b050abeee0388b28-first-place-gold-badge-by-vexels.png',
    'Attempt', '1']

]

badges.each do |title, file_name, rule_name, rule_value|
  Badge.create!(  title: title,
                  file_name: file_name,
                  rule_name: rule_name,
                  rule_value: rule_value )
end 