class Admin::FourPhrasesController < Admin::BaseController
  before_action :authenticate_admin!
  before_action :set_four_phrase, only: [:edit, :update, :destroy]

  def index
    @four_phrases = FourPhrase.page(params[:page])
    @count = @four_phrases.count
  end

  def edit
  end

  def update
    respond_to do |format|
      if @four_phrase.update(four_phrase_params)
        format.html { redirect_to admin_four_phrases_url, notice: 'Four phrase was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @four_phrase.destroy
    respond_to do |format|
      format.html { redirect_to admin_four_phrases_url, notice: 'Four phrase was successfully destroyed.' }
    end
  end

  private

  def set_four_phrase
    @four_phrase = FourPhrase.find(params[:id])
  end

  def four_phrase_params
    params.require(:four_phrase).permit(:char1_id, :char2_id, :char3_id, :char4_id)
  end
end
