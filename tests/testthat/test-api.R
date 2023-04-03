with_mock_api(
  test_that("Fetch and process users", {
    user_cols <- c("email", "handle", "id",
                   "isSuspended", "name",
                   "passwordLastChangedAt")
    all_users <- get_users() # tests/testthat/benchling/users.json
    expect_s3_class(all_users, "data.frame")
    expect_named(all_users, user_cols)
    expect_type(get_users(json = TRUE), "character")
    # This uses the redacted name. If not using `with_mock_api` change to
    # user who appears twice.
    limited_users <- get_users(nameIncludes = "user12") # tests/testthat/benchling/users-cb36c3.json
    expect_named(limited_users, user_cols)
    expect_true(nrow(limited_users) == 2)
    nonexistent_user <- get_users(name = "sharalanda") # tests/testthat/benchling/users-c3a298.json
    expect_length(nonexistent_user, 0)
    benchling_user <- get_users(nameIncludes = "Benchling") # tests/testthat/benchling/users-fccc8f.json
    expect_true(nrow(benchling_user) == 1)
    expect_named(benchling_user, user_cols)
    expect_true(benchling_user$email == "benchlingsupport@benchling.com")
  })
)
