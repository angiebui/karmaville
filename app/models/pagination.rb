class Pagination
  attr_reader :page, :model_count, :pagination_limit

  def initialize(page, model_count, pagination_limit)
    @model_count = model_count
    @pagination_limit = pagination_limit

    if page <= 0
      @page = min_page
    elsif page > max_page
      @page = max_page
    else
      @page = page
    end
  end

  def offset
    (page - 1) * pagination_limit #0 indexing in db and 1 for page 
  end

  def max_page
    (model_count/(pagination_limit.to_f)).ceil
  end

  def min_page
    1
  end

  def lower_range

  end

  def upper_range

  end

  def pages
    #lower_range + [page] + upper_range

    pages = (page-2..page+2).to_a
    if pages.include? 0
      pages = (1..5).to_a
    elsif pages.include?(max_page + 1)
      pages = (max_page-4..max_page).to_a
    end

    pages
  end


end
