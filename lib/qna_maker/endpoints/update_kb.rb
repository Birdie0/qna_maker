# def update_kb(add = [], delete = [])
#   response = HTTP.patch(
#     full_url(:update_kb),
#     json: { add: { qnaPairs: add }, delete: { qnaPairs: delete } }
#   )

#   case response.code
#   when 204
#     'Success!'
#   else
#     response.code
#   end
# end
