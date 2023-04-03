test_that("Credentials can be set", {
  withr::local_envvar(
    BENCHLING_ORG_INTERNAL = "",
    BENCHLING_ORG = "sentinel_org",
    BENCHLING_TOKEN_INTERNAL = "",
    BENCHLING_TOKEN = "sentinel_token"
  )
  expect_equal(get_org(), "sentinel_org")
  expect_equal(get_token(), "sentinel_token")
  expect_error(valid_creds(), regexp = "Could not resolve host: sentinel_org")
})

test_that("Credentials can be overwritten", {
  withr::local_envvar(
    BENCHLING_ORG_INTERNAL = "specific_tenant",
    BENCHLING_ORG = "sentinel_org",
    BENCHLING_TOKEN_INTERNAL = "specific_user",
    BENCHLING_TOKEN = "sentinel_token"
  )
  expect_equal(get_org(), "specific_tenant")
  expect_equal(get_token(), "specific_user")
  expect_error(valid_creds(), "Could not resolve host: specific_tenant")
  set_creds()
  expect_equal(get_org(), "sentinel_org")
  expect_equal(get_token(), "sentinel_token")
  expect_error(valid_creds(), "Could not resolve host: sentinel_org")
})

with_mock_api(
 test_that("Valid credentials are recognised", {
   expect_true(valid_creds()) # tests/testthat/benchling/users.json
 })
)
