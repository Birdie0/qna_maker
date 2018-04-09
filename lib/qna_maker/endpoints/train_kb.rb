# def train_kb(user_question, kb_question, kb_answer)
#   response = HTTP.patch(
#     full_url(:train_kb),
#     json: {
#       feedbackRecords: [{
#         userId: '1',
#         userQuestion: user_question,
#         kbQuestion: kb_question,
#         kbAnswer: kb_answer
#       }]
#     }
#   )
#   case response.code
#   when 204
#     'Success!'
#   else
#     response.code
#   end
# end
