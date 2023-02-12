module GCV::GCV
  def set_datalist
    Dotenv.load('/health-examination/.env')
    ENV['GOOGLE_APPLICATION_CREDENTIALS']
    
    image_annotator = Google::Cloud::Vision.image_annotator
    
    file_path = "/home/ubuntu/environment/health-examination/app/gcv/KenshinKekkaPdf_20221226115844.png"
    
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
end