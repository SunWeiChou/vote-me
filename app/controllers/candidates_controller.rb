class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end
  
  def show
    @candidate = Candidate.find_by(id: params[:id])
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(condidate_params)

    if @candidate.save
      flash[:notice] = "創建成功"
      redirect_to '/candidates'
    else
      #NG
      render :new
    end
  end

  


  private
  def condidate_params
    params.require(:candidate).permit(:name, :party, :age, :politics)
  end


end