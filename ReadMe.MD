### What is the AWS Web Application Firewall (WAF)?

- It enables the establishment of security rules aimed at managing bot activity and block common attack patterns like SQL injection or cross-site scripting."

- It is a AWS Managed service.


### Enable AWS WAF and apply the rules using a Terraform module (2*)

1- Change <ADD_YOUR_IP> with your IP in the [03-aws-waf.tf](03-aws-waf.tf)

2- Run the following commands:

- ```terraform init```
- ```terraform plan```
- ```terraform apply```

   - It will create a VPC, 2 subnets, 2 EC2 instances, 1 Load Balancer (3*)   
   - following this, AWS WAF will be enabled and associated with the previously created Load Balancer.


3- Try to access the Load Balancer (using its DNS Name)

You will encounter a 403 Error, indicating that access is forbidden. This occurs because the IP address has been added to the block list within AWS WAF


### Notes

1. It is not possible to attach WAF directly to a Classic Load Balancer (CLB), because it is not supported. If you have to do it then one option would be creating a CloudFront distribution that uses the CLB as the origin and then attaching WAF to CloudFront.(4*)



### References

1* https://aws.amazon.com/waf/

2* https://github.com/trussworks/terraform-aws-wafv2

3* https://github.com/iam-veeramalla/aws-devops-zero-to-hero/tree/main/day-24

4* [Options for WAF with a Classic Load Balancer](https://repost.aws/questions/QUfDy21UgoQeqt0yDXUVRFIg/options-for-waf-with-a-classic-load-balancer)