module ArticlesHelper
  def month_day_coma_year(datetime)
    datetime.strftime("%B %e, %Y")
  end
end
