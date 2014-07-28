class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers
  has_many :responses

  def most_answer
    answers = self.answers
    responses = self.responses
    max = 0
    most_ans = nil
    answers.each do |ans|
      num_ans = ans.responses.count   
      if num_ans >= max 
        max = num_ans
        most_ans = ans.answer
      end
    end
    return [most_ans, max]
  end
end
