require 'sinatra'
require 'prawn'
require 'sinatra/base'

class App < Sinatra::Base
  get '/:fio_student/:org/:fio_couch' do
    file_name = "#{Dir.pwd}/Договор.pdf"
    pdf = Prawn::Document.new
    pdf.font "DejaVuSans.ttf"
    pdf.text "Договор\n#{params[:fio]} с организацией #{params[:org]},\n Руководитель от организации #{params[:fio_couch]}"
    pdf.render_file(file_name)
    send_file file_name, filename: file_name, type: 'application/pdf'
    File.delete(file_name)
  end
  run! if app_file == $0
end

