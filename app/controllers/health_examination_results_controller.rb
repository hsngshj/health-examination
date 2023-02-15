class HealthExaminationResultsController < ApplicationController
    before_action :require_user_logged_in
    before_action :correct_user, only:[:show, :edit, :update, :destroy]
    
    def index
        @health_examination_result = current_user.health_examination_results.all
    end

    def new
        @health_examination_result = HealthExaminationResult.new
    end
    
    def create
        @health_examination_result = current_user.health_examination_results.new(examination_params)
        
        if @health_examination_result.save
            flash[:success] = '健康診断結果が正常に保存されました'
            redirect_to health_examination_result_path(@health_examination_result)
        else
            flash[:danger] = '健康診断結果が保存されませんでした'
            render :new
        end
    end

    def show
    end

    def edit
        set_datalist
    end
    
    def update
        if @health_examination_result.update(examination_params)
            flash[:success] = '健康診断結果が正常に保存されました'
            redirect_to health_examination_result_path(@health_examination_result)
        else
            flash[:danger] = '健康診断結果が保存されませんでした'
            render :show
        end
    end

    def destroy
        @health_examination_result.destroy
        
        flash[:success] = '健康診断結果を削除しました'
        redirect_to root_url
    end
    
    private
    
    def correct_user
      @health_examination_result = current_user.health_examination_results.find_by(id: params[:id])
      
      unless @health_examination_result
          redirect_to root_url
      end
    end

    def set_datalist
        Dotenv.load('.env')
        ENV['GOOGLE_APPLICATION_CREDENTIALS']
        
        image_annotator = Google::Cloud::Vision.image_annotator
        
        file_path = "./public" +  @health_examination_result.examination_file_path.url
        
        response = image_annotator.document_text_detection(image: file_path)
        
        @text_array = []
        response.responses.each do |res|
          res.text_annotations.each do |text|
            if text.description =~ /\n/
              next
            elsif text.description =~ /^[0-9]+[0-9.]*\s*(kg|cm|ng|g)*$/
              @text_array << text.description
            end
          end
        end
    end
    
    def examination_params
      params.require(:health_examination_result).permit(:examination_date, :height, :weight, :ldl_cholesterol, :fpg, :gamma_gtp, :uric_acid, :examination_file_path)
    end
end
