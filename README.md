
<!-- README.md is generated from README.Rmd. Please edit that file -->

# benchlingapi

<!-- badges: start -->
<!-- badges: end -->

Connect to the benchling API via R.

## Installation

You can install the development version of benchlingapi like so:

``` r
# install.packages("remotes")
remotes::install_github("HIBio/benchlingapi")

library(benchlingapi)
```

## Authentication

Set up the following environment variables for easy access (e.g. using
`usethis::edit_r_environ()`)

``` bash
BENCHLING_ORG=yourorgname
BENCHLING_TOKEN=sk_dMAQaaa9AaAAwwADRAzAs2AAz4Aaa
```

## Configuration

`set_creds()` can be used to validate and set the credentials for a
given tenant (itself set via `BENCHLING_ORG`). To switch between a fixed
list of tenants, one could write a helper

``` r
use_tenant <- function(tenant = c("test", "prod")) {
  tenant <- match.arg(tenant)
  message("switching to ", tenant)
  switch(tenant,
         prod = benchlingapi::set_creds(
           org_var = "PROD_BENCHLING_ORG",
           token_var = "PROD_BENCHLING_TOKEN"
         ),
         # default
         test = benchlingapi::set_creds()
  )
  invisible()
}
```

This has *not* been included in {benchlingapi} as organisations may have
their own list of tenants to configure.

## Example

``` r
get_users()
#>                 email  handle           id            name
#> 1   jamey@example.com   jamey ent_SPXdAvAd     Jamey Olson
#> 2   peggy@example.com   peggy ent_N3ARMuA4    Peggy Paucek
#> 3 gabriel@example.com gabriel ent_og8mNFAy     Gabriel Toy
#> 4   felix@example.com   felix ent_CXxJcHK2     Felix Rohan
#> 5  garett@example.com  garett ent_qac9DiQn Garett Donnelly
```

## Supported Endpoints

Most of the endpoints have been automatically wrapped[^1] but there is
no guarantee that they work.

The endpoints which should be wrapped with a `get_*` function are

    #>  [1] "aa-sequences"                 "app-configuration-items"     
    #>  [3] "apps"                         "assay-result-schemas"        
    #>  [5] "assay-results"                "assay-run-schemas"           
    #>  [7] "assay-runs"                   "automation-file-transforms"  
    #>  [9] "automation-input-generators"  "automation-output-processors"
    #> [11] "batch-schemas"                "batches"                     
    #> [13] "blobs"                        "box-schemas"                 
    #> [15] "boxes"                        "container-schemas"           
    #> [17] "containers"                   "custom-entities"             
    #> [19] "dna-alignments"               "dna-oligos"                  
    #> [21] "dna-sequences"                "dropdowns"                   
    #> [23] "entities"                     "entity-schemas"              
    #> [25] "entries"                      "entry-schemas"               
    #> [27] "entry-templates"              "events"                      
    #> [29] "exports"                      "feature-libraries"           
    #> [31] "features"                     "folders"                     
    #> [33] "legacy-workflow-stage-runs"   "legacy-workflow-stages"      
    #> [35] "legacy-workflows"             "location-schemas"            
    #> [37] "locations"                    "mixtures"                    
    #> [39] "molecules"                    "nucleotide-alignments"       
    #> [41] "oligos"                       "organizations"               
    #> [43] "plate-schemas"                "plates"                      
    #> [45] "projects"                     "registries"                  
    #> [47] "request-fulfillments"         "request-schemas"             
    #> [49] "request-task-schemas"         "requests"                    
    #> [51] "result-transactions"          "rna-oligos"                  
    #> [53] "rna-sequences"                "tasks"                       
    #> [55] "teams"                        "token"                       
    #> [57] "transfers"                    "users"                       
    #> [59] "warehouse-credentials"        "workflow-outputs"            
    #> [61] "workflow-stage-runs"          "workflow-stages"             
    #> [63] "workflow-task-groups"         "workflow-task-schemas"       
    #> [65] "workflow-tasks"               "workflows"

Some of these take an additional (optional) parameter (only one
supported for now), e.g.

``` r
benchlingapi::get_users
#> function(user_id = NULL, ...) {
#>   endpoint <- "users"
#>   if (!is.null(user_id)) {
#>     endpoint <- glue::glue("users/{user_id}")
#>   }
#>   get_benchling(endpoint, ...)
#> }
#> <bytecode: 0x105e5d770>
#> <environment: namespace:benchlingapi>
```

Many endpoints also include query parameters (see the [official
reference](https://benchling.com/api/reference)). These can be specified
via the `...` argument, and are detailed in the individual help for each
function, e.g.

``` r
?get_organizations
```

------------------------------------------------------------------------

<h2>
List users
</h2>
<h3>
Description
</h3>
<p>
Manage user objects.
</p>
<h3>
Usage
</h3>
<pre><code class='language-R'>get_users(user_id = NULL, ...)
</code></pre>
<h3>
Arguments
</h3>
<table>
<tr style="vertical-align: top;">
<td>
<code>user_id</code>
</td>
<td>
<p>
users id
</p>
</td>
</tr>
<tr style="vertical-align: top;">
<td>
<code>…</code>
</td>
<td>
<p>
additional query parameters; see Details below
</p>
</td>
</tr>
</table>
<h3>
Details
</h3>
<p>
Available query parameters:
</p>
<dl>
<dt>
ids
</dt>
<dd>
<p>
Comma-separated list of ids. Matches all of the provided IDs, or returns
a 400 error that includes a list of which IDs are invalid.
</p>
</dd>
<dt>
name
</dt>
<dd>
<p>
Name of a user. Restricts results to those with the specified name.
</p>
</dd>
<dt>
nameIncludes
</dt>
<dd>
<p>
Name substring of a user. Restricts results to those with names that
include the provided substring.
</p>
</dd>
<dt>
names.anyOf
</dt>
<dd>
<p>
Comma-separated list of names. Restricts results to those that match any
of the specified names, case insensitive. Warning - this filter can be
non-performant due to case insensitivity.
</p>
</dd>
<dt>
names.anyOf.caseSensitive
</dt>
<dd>
<p>
Comma-separated list of names. Restricts results to those that match any
of the specified names, case sensitive.
</p>
</dd>
<dt>
modifiedAt
</dt>
<dd>
<p>
Datetime, in RFC 3339 format. Supports the \> and \< operators. Time
zone defaults to UTC. Restricts results to those modified in the
specified range. e.g. \> 2017-04-30.
</p>
</dd>
<dt>
memberOf
</dt>
<dd>
<p>
Comma-separated list of organization and/or team API IDs. Restricts
results to users that are members of all given groups.
</p>
</dd>
<dt>
adminOf
</dt>
<dd>
<p>
Comma-separated list of organization and/or team API IDs. Restricts
results to users that are admins of all given groups.
</p>
</dd>
<dt>
handles
</dt>
<dd>
<p>
Comma-separated list of handles. Restricts results to the users with the
specified handles.
</p>
</dd>
<dt>
passwordLastChangedAt
</dt>
<dd>
<p>
Datetime, in RFC 3339 format. Supports the \>, \>=, \<, \<=, operators.
Time zone defaults to UTC. Restricts results to users who have last
changed their password in the specified range. e.g. \> 2017-04-30. If
"null" is provided returns users that have no password set (SAML).
</p>
</dd>
<dt>
nextToken
</dt>
<dd>
<p>
Token for pagination
</p>
</dd>
</dl>
<h3>
Value
</h3>
<p>
data from <code>users</code> endpoint
</p>
</div>

------------------------------------------------------------------------

As an example, if your users list has several users with the name
‘David’

``` r
get_users(nameIncludes = "david")
```

    #>                   email    handle           id      name
    #> 1 david.old@example.com david.old ent_U2gA6a41 David Old
    #> 2 david.new@example.com david.new ent_AvA2sA2X David New

[^1]: See `inst/scripts/template.R` for how these `auto_*.R` files are
    generated
