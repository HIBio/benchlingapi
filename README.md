
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

Most of the endpoints have been automatically wrapped, but there is no
guarantee that they work.

The endpoints which should be wrapped are

    #>  [1] "aa_sequences"                 "apps"                        
    #>  [3] "assay_result_schemas"         "assay_results"               
    #>  [5] "assay_run_schemas"            "assay_runs"                  
    #>  [7] "automation_file_transforms"   "automation_input_generators" 
    #>  [9] "automation_output_processors" "batch_schemas"               
    #> [11] "batches"                      "blobs"                       
    #> [13] "box_schemas"                  "boxes"                       
    #> [15] "container_schemas"            "containers"                  
    #> [17] "custom_entities"              "dna_alignments"              
    #> [19] "dna_oligos"                   "dna_sequences"               
    #> [21] "dropdowns"                    "entities"                    
    #> [23] "entity_schemas"               "entries"                     
    #> [25] "entry_schemas"                "entry_templates"             
    #> [27] "events"                       "exports"                     
    #> [29] "feature_libraries"            "features"                    
    #> [31] "folders"                      "legacy_workflow_stage_runs"  
    #> [33] "legacy_workflow_stages"       "legacy_workflows"            
    #> [35] "location_schemas"             "locations"                   
    #> [37] "mixtures"                     "molecules"                   
    #> [39] "oligos"                       "organizations"               
    #> [41] "plate_schemas"                "plates"                      
    #> [43] "projects"                     "registries"                  
    #> [45] "request_fulfillments"         "request_schemas"             
    #> [47] "request_task_schemas"         "requests"                    
    #> [49] "result_transactions"          "rna_oligos"                  
    #> [51] "tasks"                        "teams"                       
    #> [53] "token"                        "transfers"                   
    #> [55] "users"                        "warehouse_credentials"       
    #> [57] "workflow_outputs"             "workflow_stage_runs"         
    #> [59] "workflow_stages"              "workflow_task_groups"        
    #> [61] "workflow_task_schemas"        "workflow_tasks"              
    #> [63] "workflows"

Some of these take an additional (optional) parameter (only one
supported for now)

    #>                        endpoint                parameter
    #> 1                  aa_sequences         {aa_sequence_id}
    #> 2                          apps                 {app_id}
    #> 3          assay_result_schemas              {schema_id}
    #> 4                 assay_results        {assay_result_id}
    #> 5             assay_run_schemas              {schema_id}
    #> 6                    assay_runs           {assay_run_id}
    #> 7    automation_file_transforms           {transform_id}
    #> 8   automation_input_generators     {input_generator_id}
    #> 9  automation_output_processors    {output_processor_id}
    #> 10                batch_schemas              {schema_id}
    #> 11                      batches               {batch_id}
    #> 12                        blobs                {blob_id}
    #> 13                  box_schemas              {schema_id}
    #> 14                        boxes                 {box_id}
    #> 15            container_schemas              {schema_id}
    #> 16                   containers           {container_id}
    #> 17              custom_entities       {custom_entity_id}
    #> 18               dna_alignments       {dna_alignment_id}
    #> 19                   dna_oligos               {oligo_id}
    #> 20                dna_sequences        {dna_sequence_id}
    #> 21                    dropdowns            {dropdown_id}
    #> 22                     entities              {entity_id}
    #> 23               entity_schemas              {schema_id}
    #> 24                      entries               {entry_id}
    #> 25                entry_schemas              {schema_id}
    #> 26              entry_templates      {entry_template_id}
    #> 27            feature_libraries     {feature_library_id}
    #> 28                     features             {feature_id}
    #> 29                      folders              {folder_id}
    #> 30   legacy_workflow_stage_runs           {stage_run_id}
    #> 31       legacy_workflow_stages               {stage_id}
    #> 32             legacy_workflows     {legacy_workflow_id}
    #> 33             location_schemas              {schema_id}
    #> 34                    locations            {location_id}
    #> 35                     mixtures             {mixture_id}
    #> 36                    molecules            {molecule_id}
    #> 37                       oligos               {oligo_id}
    #> 38                organizations        {organization_id}
    #> 39                plate_schemas              {schema_id}
    #> 40                       plates               {plate_id}
    #> 41                     projects             {project_id}
    #> 42                   registries            {registry_id}
    #> 43         request_fulfillments {request_fulfillment_id}
    #> 44              request_schemas              {schema_id}
    #> 45         request_task_schemas              {schema_id}
    #> 46                     requests             {request_id}
    #> 47          result_transactions         {transaction_id}
    #> 48                   rna_oligos               {oligo_id}
    #> 49                        tasks                {task_id}
    #> 50                        teams                {team_id}
    #> 51                        users                {user_id}
    #> 52             workflow_outputs     {workflow_output_id}
    #> 53          workflow_stage_runs           {stage_run_id}
    #> 54              workflow_stages               {stage_id}
    #> 55         workflow_task_groups {workflow_task_group_id}
    #> 56        workflow_task_schemas              {schema_id}
    #> 57               workflow_tasks       {workflow_task_id}
    #> 58                    workflows            {workflow_id}

Many endpoints also include query parameters (see the [official
reference](https://benchling.com/api/reference)). These can be specified
via the `...` argument, and are detailed in the individual help for each
function.

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
View user objects.
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
