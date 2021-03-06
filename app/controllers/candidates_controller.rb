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

  def edit
    @candidate = Candidate.find_by(id: params[:id])
  end

  def update
    @candidate = Candidate.find_by(id: params[:id])
    if @candidate.update(condidate_params)
      flash[:notice] = "更新成功"
      redirect_to '/candidates'
    else
      render :edit
    end
  end

  def destroy
    @candidate = Candidate.find_by(id: params[:id])
    @candidate.destroy
    flash[:notice] = "刪除成功"
    redirect_to '/candidates'
  end


  private
  def condidate_params
    params.require(:candidate).permit(:name, :party, :age, :politics)
  end


end