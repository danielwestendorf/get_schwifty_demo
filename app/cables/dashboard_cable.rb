class DashboardCable < BaseCable
  def fibonacci
    n = params[:i] || SecureRandom.rand(20..40)
    calculated = calculate_fibonacci(n)
    stream partial: "dashboard/fibonacci", locals: { calculated: calculated, n: n }
  end

  private

  def calculate_fibonacci(n)
    return n if n <= 1
    calculate_fibonacci( n - 1 ) + calculate_fibonacci( n - 2 )
  end
end
