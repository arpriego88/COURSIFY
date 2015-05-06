FactoryGirl.define do
  factory :lesson do |f|
    f.name 'Test lesson'
    f.description 'Test description'
    f.video_url 'MOV_6622.MOV.m4v'
    f.wistia_video 'agh5org4o7'
    f.video_time ''
    f.content 'Test content'
    f.exercise_name 'Test exercise name'
    f.exercise_content 'Test exercise content'
  end

end