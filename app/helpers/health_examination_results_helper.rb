module HealthExaminationResultsHelper
  def data_check
    if !!@health_examination_result.height && !!@health_examination_result.weight && !!@health_examination_result.ldl_cholesterol && !!@health_examination_result.fpg && !!@health_examination_result.gamma_gtp && !!@health_examination_result.uric_acid
      return true
    end
  end
end
