User.create(
  name: '久永 秀治',
  gender: '男性',
  birth_date: '1988-12-12',
  email: 'standbyme1212@gmail.com',
  password: 'changeme'
)

HealthExaminationResult.create(
  height: 172.9,
  weight: 83.7,
  ldl_cholesterol: 184,
  fpg: 84,
  gamma_gtp: 62,
  uric_acid: 8.2,
  examination_date: '2022-11-29',
  examination_file_path:File.open("./public/uploads/health_examination_result/examination_file_path/3/KenshinKekkaPdf_20221226115844.png"),
  user_id: 1
)

HealthExaminationResult.create(
  height: 173.4,
  weight: 82.5,
  ldl_cholesterol: 159,
  fpg: 88,
  gamma_gtp: 60,
  uric_acid: 7.4,
  examination_date: '2022-02-08',
  examination_file_path:File.open("./public/uploads/health_examination_result/examination_file_path/2/KenshinKekkaPdf_20221226115844.png"),
  user_id: 1
)

HealthExaminationResult.create(
  height: 173.4,
  weight: 84.2,
  ldl_cholesterol: 175,
  fpg: 87,
  gamma_gtp: 53,
  uric_acid: 6.8,
  examination_date: '2020-10-21',
  examination_file_path:File.open("./public/uploads/health_examination_result/examination_file_path/1/KenshinKekkaPdf_20221226115844.png"),
  user_id: 1
)

HealthExaminationStandardResult.create(
  age: '34',
  gender: '男性',
  bmi: 24.9,
  ldl_cholesterol: 119,
  fpg: 99,
  gamma_gtp: 50,
  uric_acid: 7.0
)