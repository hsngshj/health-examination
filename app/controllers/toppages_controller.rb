class ToppagesController < ApplicationController
  include HealthExaminationResultsHelper
  
  def index
    @user = current_user

    if logged_in?
      @health_examination_result = @user.health_examination_results.where(examination_date: HealthExaminationResult.maximum(:examination_date)).last
      
      if data_check
        cal_user_age
        set_radarchart_data
        set_linechart_data
      end
    end
  end
  
  private

  def cal_user_age
    today = Time.zone.today
    this_years_birthday = Time.zone.local(today.year, @user.birth_date.month, @user.birth_date.day)
    @age = today.year - @user.birth_date.year
    if today < this_years_birthday
      @age -= 1
    end
  end
  
  def set_radarchart_data
    @health_examination_standard_result = HealthExaminationStandardResult.where(age: @age, gender: @user.gender).first
    
    @bmi = @health_examination_result.weight / (@health_examination_result.height / 100 ) ** 2
    @ldl_cholesterol = @health_examination_result.ldl_cholesterol
    @fpg = @health_examination_result.fpg
    @gamma_gtp = @health_examination_result.gamma_gtp
    @uric_acid = @health_examination_result.uric_acid
    
    if !!@health_examination_standard_result
      @bmi_standard = @health_examination_standard_result.bmi
      @bmi_radar = @bmi / @bmi_standard * 80 # レーダーチャート用。標準値を80としたときの診断結果の値を算出
      
      @ldl_cholesterol_standard = @health_examination_standard_result.ldl_cholesterol
      @ldl_cholesterol_radar = @ldl_cholesterol / @ldl_cholesterol_standard * 80 # レーダーチャート用。標準値を80としたときの診断結果の値を算出    
      
      @fpg_standard = @health_examination_standard_result.fpg
      @fpg_radar = @fpg / @fpg_standard * 80 # レーダーチャート用。標準値を80としたときの診断結果の値を算出    
      
      @gamma_gtp_standard = @health_examination_standard_result.gamma_gtp
      @gamma_gtp_radar = @gamma_gtp / @gamma_gtp_standard * 80 # レーダーチャート用。標準値を80としたときの診断結果の値を算出    
      
      @uric_acid_standard = @health_examination_standard_result.uric_acid
      @uric_acid_radar = @uric_acid / @uric_acid_standard * 80 # レーダーチャート用。標準値を80としたときの診断結果の値を算出
    end
  end
  
  def set_linechart_data
    @linechart_data_hash = {}

    @user.health_examination_results.each do |data|
      @linechart_data_hash.store(data.examination_date.strftime("%Y/%m/%d"), data.ldl_cholesterol)
    end
  end
end