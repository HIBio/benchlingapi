
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

    #>  [1] "aa-sequences"                 "apps"                        
    #>  [3] "assay-result-schemas"         "assay-results"               
    #>  [5] "assay-run-schemas"            "assay-runs"                  
    #>  [7] "automation-file-transforms"   "automation-input-generators" 
    #>  [9] "automation-output-processors" "batch-schemas"               
    #> [11] "batches"                      "blobs"                       
    #> [13] "box-schemas"                  "boxes"                       
    #> [15] "container-schemas"            "containers"                  
    #> [17] "custom-entities"              "dna-alignments"              
    #> [19] "dna-oligos"                   "dna-sequences"               
    #> [21] "dropdowns"                    "entities"                    
    #> [23] "entity-schemas"               "entries"                     
    #> [25] "entry-schemas"                "entry-templates"             
    #> [27] "events"                       "exports"                     
    #> [29] "feature-libraries"            "features"                    
    #> [31] "folders"                      "legacy-workflow-stage-runs"  
    #> [33] "legacy-workflow-stages"       "legacy-workflows"            
    #> [35] "location-schemas"             "locations"                   
    #> [37] "mixtures"                     "molecules"                   
    #> [39] "oligos"                       "organizations"               
    #> [41] "plate-schemas"                "plates"                      
    #> [43] "projects"                     "registries"                  
    #> [45] "request-fulfillments"         "request-schemas"             
    #> [47] "request-task-schemas"         "requests"                    
    #> [49] "result-transactions"          "rna-oligos"                  
    #> [51] "tasks"                        "teams"                       
    #> [53] "token"                        "transfers"                   
    #> [55] "users"                        "warehouse-credentials"       
    #> [57] "workflow-outputs"             "workflow-stage-runs"         
    #> [59] "workflow-stages"              "workflow-task-groups"        
    #> [61] "workflow-task-schemas"        "workflow-tasks"              
    #> [63] "workflows"

Some of these take an additional (optional) parameter (only one
supported for now)

    #>                        endpoint                parameter
    #> 1                  aa-sequences         {aa_sequence_id}
    #> 2                          apps                 {app_id}
    #> 3          assay-result-schemas              {schema_id}
    #> 4                 assay-results        {assay_result_id}
    #> 5             assay-run-schemas              {schema_id}
    #> 6                    assay-runs           {assay_run_id}
    #> 7    automation-file-transforms           {transform_id}
    #> 8   automation-input-generators     {input_generator_id}
    #> 9  automation-output-processors    {output_processor_id}
    #> 10                batch-schemas              {schema_id}
    #> 11                      batches               {batch_id}
    #> 12                        blobs                {blob_id}
    #> 13                  box-schemas              {schema_id}
    #> 14                        boxes                 {box_id}
    #> 15            container-schemas              {schema_id}
    #> 16                   containers           {container_id}
    #> 17              custom-entities       {custom_entity_id}
    #> 18               dna-alignments       {dna_alignment_id}
    #> 19                   dna-oligos               {oligo_id}
    #> 20                dna-sequences        {dna_sequence_id}
    #> 21                    dropdowns            {dropdown_id}
    #> 22                     entities              {entity_id}
    #> 23               entity-schemas              {schema_id}
    #> 24                      entries               {entry_id}
    #> 25                entry-schemas              {schema_id}
    #> 26              entry-templates      {entry_template_id}
    #> 27            feature-libraries     {feature_library_id}
    #> 28                     features             {feature_id}
    #> 29                      folders              {folder_id}
    #> 30   legacy-workflow-stage-runs           {stage_run_id}
    #> 31       legacy-workflow-stages               {stage_id}
    #> 32             legacy-workflows     {legacy_workflow_id}
    #> 33             location-schemas              {schema_id}
    #> 34                    locations            {location_id}
    #> 35                     mixtures             {mixture_id}
    #> 36                    molecules            {molecule_id}
    #> 37                       oligos               {oligo_id}
    #> 38                organizations        {organization_id}
    #> 39                plate-schemas              {schema_id}
    #> 40                       plates               {plate_id}
    #> 41                     projects             {project_id}
    #> 42                   registries            {registry_id}
    #> 43         request-fulfillments {request_fulfillment_id}
    #> 44              request-schemas              {schema_id}
    #> 45         request-task-schemas              {schema_id}
    #> 46                     requests             {request_id}
    #> 47          result-transactions         {transaction_id}
    #> 48                   rna-oligos               {oligo_id}
    #> 49                        tasks                {task_id}
    #> 50                        teams                {team_id}
    #> 51                        users                {user_id}
    #> 52             workflow-outputs     {workflow_output_id}
    #> 53          workflow-stage-runs           {stage_run_id}
    #> 54              workflow-stages               {stage_id}
    #> 55         workflow-task-groups {workflow_task_group_id}
    #> 56        workflow-task-schemas              {schema_id}
    #> 57               workflow-tasks       {workflow_task_id}
    #> 58                    workflows            {workflow_id}
