module SearchHelper
  def match_level(factor)
    if factor > 0 && factor < 0.1
      return ['Low', 'info']
    elsif factor >= 0.1 && factor < 0.2
      return ['Medium', 'primary']
    elsif factor >= 0.2 && factor < 0.35
      return ['High', 'success']
    elsif factor >= 0.35 && factor < 0.7
      return ['Very High', 'warning']
    elsif factor >= 0.7
      return ['Super', 'danger']
    end
  end
end
