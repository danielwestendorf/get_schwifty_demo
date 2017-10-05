class CurrenciesController < ApplicationController
  def index
    @date = DateTime.current.to_date
  end

  def show
    @date = Date.parse(params[:id])
    raise if @date > DateTime.current.to_date
  rescue
    redirect_to currencies_path
  end

  def create
    @date = parse_date

    redirect_to currency_path(@date.strftime("%Y-%m-%d"))
  end

  private

  def parse_date
    Date.civil(
      params[:currency]["date(1i)"].to_i,
      params[:currency]["date(2i)"].to_i,
      params[:currency]["date(3i)"].to_i
    )
  end
end
