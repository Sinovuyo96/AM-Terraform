
    variable "role_name"{
        type        = string
        description = "Iam role name"
        # default = "Demo_role"

    }

    variable "policy_name"{
      type = string
    #   default = "Demo_policy_ec2"
    }

    variable "assume_role_policy"{
      type = string
    }

    variable "policy"{
      type = string
    }


    

