# terraform_atlas_remote_state_backend

### Purpose of the repository 
- The repository creates atalas state backend, atalas is the former name of Therraform Enterprices. 

#### List of files in the repository

File name                            | File description 
------------------------------------ | --------------------------------------------------------------
`.gitignore` | list of files and directories to ignore.
`main.tf` | Terraform configuration file. 

### How to use this repository. 
- Install `terraform` by following this [instructions](https://www.terraform.io/intro/getting-started/install.html).
- Create GitHub repository and give it name, initialize README.md and add a licence. 
- Clone the repository to your local computer: `git clone git@github.com:nikcbg/terraform_atlas_remote_state_backend`.
- Go to the cloned repo on your computer: `cd terraform_atlas_remote_state_backend`.
- Create a new branch in the repo you just cloned by eaxecuting ` git checkout -b newbranch` command.
- Create `main.tf` file by executing `vim man.tf` command and copy/paste the below code in `main.tf` file:

    ```
    resource "null_resource" "helloWorld" {
    provisioner "local-exec" {
        command = "echo hello world"
     }
   }
    ```

- Save and exit the `main.tf` file by executing `:wq!` command.
- Execute `terraform init` to download the necessary plugins.
- Execute `terraform plan` to create execution plan and see what resources will be created.
- Execute `terraform apply` to create the new resources. 
- Next you need to create `.gitignore` file and put the `.terraform/` and `terraform.tfstate` files in there. 
- Next you need to go to Terraform Enterprice(TFE) to create a new workspace
  - name your workspace.
  - choose none as source 
- Next update your `main.tf` file with the code below:

 ```
  terraform {
  backend "atlas" {
    name    = "org_name/workspace_name"
   }
  }
  
  resource "null_resource" "helloWorld" {
  provisioner "local-exec" {
    command = "echo hello world"
   }
  }
 ```
- Next we need to authenticate to TFE so the existing state on your local computer gets copied to TFE:
  - go to TFE website and click on user settings in upper right corner
  - then click on tokens on the left pane
  - next name your token and click generate token 
  - make sure you copy and download your token and save it in secure place for future use
- Next execute `export ATLAS_TOKEN=your_TFE_token_here` to authenticate with TFE
- Next execute `terraform init` to initialize the new backend
- Next enter yes to the `Enter a value` prompt, the output should display the follwing:

 ```
 Initializing the backend...
 Do you want to copy existing state to the new backend?
 Pre-existing state was found while migrating the previous "local" backend to the
 newly configured "atlas" backend. No existing state was found in the newly
 configured "atlas" backend. Do you want to copy this state to the new "atlas"
 backend? Enter "yes" to copy and "no" to start with an empty state.

 Enter a value: yes


Successfully configured the backend "atlas"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.null: version = "~> 2.0"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
 ```
-     
- Next you can commite your changes to the GitHub repository you created:
  - execute `git add .gitignore main.tf` command to add the files that will be commited.
  - execute `git commint -m "your comment here"` to commite the files to the newbranch, the output should display:
  
  
 ```
   git commit -m "add file"
   [newbranch 1b31782] add file
    2 files changed, 14 insertions(+)
    create mode 100644 .gitignore
    create mode 100644 main.tf
 ```
- Next step is to push all the changes to the GitHub repository:
  - execute `git push origin newbranch` command to push your changes to GitHub, the output should display:
  
  
 ```
   Counting objects: 4, done.
   Delta compression using up to 8 threads.
   Compressing objects: 100% (3/3), done.
   Writing objects: 100% (4/4), 494 bytes | 494.00 KiB/s, done.
   Total 4 (delta 0), reused 0 (delta 0)
   remote: 
   remote: Create a pull request for 'newbranch' on GitHub by visiting:
   remote:      https://github.com/nikcbg/terraform_atlas_remote_state_backend/pull/new/newbranch
   remote: 
   To github.com:nikcbg/terraform_atlas_remote_state_backend.git
   * [new branch]      newbranch -> newbranch

 ```
  
- Next go to GitHub and follow the prompts to create and merge the pull request.
- Finaly you can check your copied state in TFE by goign to Workspaces -> your_workpace_name -> States
