class CandidatesController < ApplicationController
  def index
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

  def condidate_params
    params.require(:candidate).permit(:name, :party, :age, :politics)
  end

end