terraform { 
  cloud { 
    
    organization = "terraform-irfan-learning" 

    workspaces { 
      name = "aws-demo-remoteexec" 
    } 
  } 
}