module GraphsHelper
  def active?(resolution)
    if resolution.to_s == @resolution.to_s
      "active"
    else
      ""
    end
  end
end
