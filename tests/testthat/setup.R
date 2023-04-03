library(httptest)

set_requester(function (request) {
  gsub_request(request,  glue::glue("https://{get_org()}.benchling.com/api/v2/"), "benchling")
})
