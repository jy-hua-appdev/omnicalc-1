class ApplicationController < ActionController::Base

  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    @num = params.fetch("number").to_f
    @square_of_num = @num * @num
    render({ :template => "calculation_templates/square_results.html.erb"})
  end

  def blank_square_root_form
    render({ :template => "calculation_templates/square_root_form.html.erb"})
  end

  def calculate_square_root
    @num = params.fetch("number").to_f
    @square_root_of_num = Math.sqrt(@num)
    render({ :template => "calculation_templates/square_root_results.html.erb"})
  end

  def payment_form
    render({ :template => "calculation_templates/payment_form.html.erb"})
  end

  def calculate_payment
    @apr = params.fetch("user_apr").to_f
    @apr_deci = @apr/12/100
    @years = params.fetch("user_years").to_i
    @months = @years*12
    @pv = params.fetch("user_pv").to_f
    @payment = (@pv * @apr_deci * (1+@apr_deci)**@months) / ( (1+@apr_deci)**@months - 1 )
  
    render({ :template => "calculation_templates/payment_results.html.erb"})
  end

  def blank_random_form
    render({ :template => "calculation_templates/random_form.html.erb"})
  end

  def calculate_random
    @num_min = params.fetch("user_min").to_f
    @num_max = params.fetch("user_max").to_f
    @num_random = rand(@num_min..@num_max)
    render({ :template => "calculation_templates/random_results.html.erb"})
  end

end
