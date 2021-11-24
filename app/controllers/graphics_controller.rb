class GraphicsController < ApplicationController
  def my_graphics
    @diary_sales = Order.where(status: "completed").group_by_day(:created_at).count
    @weekly_sales = Order.where(status: "completed").group_by_week(:created_at).count
    @sales_group_by_month = Order.group_by_month(:created_at, format: "%b %Y").sum(:total)
  end
end
